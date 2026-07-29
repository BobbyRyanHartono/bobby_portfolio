import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/mock_portfolio_service.dart';
import '../../domain/models/experience.dart';
import '../../domain/models/profile_info.dart';
import '../../domain/models/project.dart';
import '../../domain/repositories/portfolio_repository.dart';

// Repository Provider
final portfolioRepositoryProvider = Provider<PortfolioRepository>((ref) {
  return MockPortfolioService();
});

// Profile Info Provider
final profileInfoProvider = FutureProvider<ProfileInfo>((ref) async {
  final repo = ref.watch(portfolioRepositoryProvider);
  return repo.getProfileInfo();
});

// Projects Provider
final projectsProvider = FutureProvider<List<Project>>((ref) async {
  final repo = ref.watch(portfolioRepositoryProvider);
  return repo.getProjects();
});

// Experiences Provider
final experiencesProvider = FutureProvider<List<Experience>>((ref) async {
  final repo = ref.watch(portfolioRepositoryProvider);
  return repo.getExperiences();
});

// Project Category Filter Provider
final selectedCategoryProvider = StateProvider<String>((ref) => 'All');

// Filtered Projects Computed Provider
final filteredProjectsProvider = Provider<AsyncValue<List<Project>>>((ref) {
  final projectsAsync = ref.watch(projectsProvider);
  final category = ref.watch(selectedCategoryProvider);

  return projectsAsync.whenData((projects) {
    if (category == 'All') return projects;
    return projects.where((p) => p.category == category).toList();
  });
});

// Theme Mode Provider (Light/Dark)
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.dark);

// Active Section Navigation Provider
final activeSectionProvider = StateProvider<String>((ref) => 'Home');

// Contact Form State
enum ContactFormStatus { initial, loading, success, error }

class ContactFormNotifier extends StateNotifier<ContactFormStatus> {
  final PortfolioRepository _repository;
  ContactFormNotifier(this._repository) : super(ContactFormStatus.initial);

  Future<bool> sendMessage({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    state = ContactFormStatus.loading;
    try {
      final success = await _repository.sendContactMessage(
        name: name,
        email: email,
        subject: subject,
        message: message,
      );
      if (success) {
        state = ContactFormStatus.success;
        return true;
      } else {
        state = ContactFormStatus.error;
        return false;
      }
    } catch (_) {
      state = ContactFormStatus.error;
      return false;
    }
  }

  void reset() {
    state = ContactFormStatus.initial;
  }
}

final contactFormNotifierProvider =
    StateNotifierProvider<ContactFormNotifier, ContactFormStatus>((ref) {
  final repo = ref.watch(portfolioRepositoryProvider);
  return ContactFormNotifier(repo);
});
