import '../models/project.dart';
import '../models/experience.dart';
import '../models/profile_info.dart';

abstract class PortfolioRepository {
  Future<ProfileInfo> getProfileInfo();
  Future<List<Project>> getProjects();
  Future<List<Experience>> getExperiences();
  Future<bool> sendContactMessage({
    required String name,
    required String email,
    required String subject,
    required String message,
  });
}
