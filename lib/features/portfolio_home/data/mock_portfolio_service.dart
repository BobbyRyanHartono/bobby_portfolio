import '../domain/models/project.dart';
import '../domain/models/experience.dart';
import '../domain/models/profile_info.dart';
import '../domain/repositories/portfolio_repository.dart';

class MockPortfolioService implements PortfolioRepository {
  @override
  Future<ProfileInfo> getProfileInfo() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return const ProfileInfo(
      name: 'Samuel Bobby Ryan Hartono',
      title: 'Senior Flutter & Mobile Solutions Architect',
      bio: 'Crafting high-performance, cross-platform mobile apps with Flutter, Dart & modern reactive architecture. Passionate about beautiful UX, scalable state management, and clean code.',
      location: 'Jakarta, Indonesia',
      email: 'bobbyryan692@gmail.com',
      githubUrl: 'https://github.com/bobbyryanhartono',
      linkedinUrl: 'https://linkedin.com/in/bobbyryanhartono',
      twitterUrl: 'https://twitter.com/bobbyryanhartono',
      yearsOfExperience: 6,
      completedProjects: 28,
      satisfiedClients: 22,
      skills: {
        'Mobile & Desktop': [
          'Flutter',
          'Dart',
          'iOS (Swift)',
          'Android (Kotlin)',
          'React Native'
        ],
        'Architecture & State': [
          'Riverpod',
          'BLoC / Cubit',
          'Clean Architecture',
          'Provider',
          'SOLID Principles'
        ],
        'Backend & Cloud': [
          'Firebase',
          'REST APIs',
          'GraphQL',
          'Node.js',
          'PostgreSQL',
          'Docker'
        ],
        'DevOps & Testing': [
          'CI/CD (GitHub Actions)',
          'Fastlane',
          'Unit & Widget Testing',
          'Integration Testing',
          'Codemagic'
        ],
      },
    );
  }

  @override
  Future<List<Project>> getProjects() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return const [
      Project(
        id: 'proj-1',
        title: 'Fin Pulse - Crypto & Wealth Management App',
        description:
            'A modern financial portfolio tracker with real-time web-socket feeds, dynamic charts, and automated budget alerts.',
        longDescription:
            'Fin Pulse is an enterprise-grade Flutter application that handles high-frequency real-time stock and crypto data visualization. Features interactive interactive charts, custom alerts, biometric auth, and offline persistence using Hive.',
        tags: ['Flutter', 'Riverpod', 'WebSockets', 'Chart Engine', 'Firebase'],
        category: 'Mobile App',
        imageUrl:
            'https://images.unsplash.com/photo-1611974789855-9c2a0a7236a3?auto=format&fit=crop&w=800&q=80',
        githubUrl: 'https://github.com/bobbyryanhartono/finpulse',
        liveUrl: 'https://finpulse-demo.app',
        featured: true,
      ),
      Project(
        id: 'proj-2',
        title: 'OmniHealth - Telemedicine Platform',
        description:
            'Seamless doctor-patient communication with encrypted video consultations, electronic prescriptions, and vital stats tracking.',
        longDescription:
            'Designed and built end-to-end for Android and iOS using Flutter Clean Architecture. Includes WebRTC video calling, push notifications, digital signature workflow, and payment gateway integration.',
        tags: ['Flutter', 'WebRTC', 'Riverpod', 'Clean Arch', 'Stripe'],
        category: 'Mobile App',
        imageUrl:
            'https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?auto=format&fit=crop&w=800&q=80',
        githubUrl: 'https://github.com/bobbyryanhartono/omnihealth',
        liveUrl: 'https://omnihealth.example.com',
        featured: true,
      ),
      Project(
        id: 'proj-3',
        title: 'LogiRoute - Fleet Logistics Dashboard',
        description:
            'Multi-platform desktop and web command center for fleet tracking, driver dispatching, and route optimization.',
        longDescription:
            'Built with Flutter Web & Desktop to streamline dispatch operations across 500+ vehicles. Features Google Maps SDK integration, custom spatial algorithms, and automated report generation.',
        tags: ['Flutter Web', 'Flutter Desktop', 'Google Maps', 'Riverpod'],
        category: 'Web & Desktop',
        imageUrl:
            'https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?auto=format&fit=crop&w=800&q=80',
        githubUrl: 'https://github.com/bobbyryanhartono/logiroute',
        liveUrl: 'https://logiroute.example.com',
        featured: true,
      ),
      Project(
        id: 'proj-4',
        title: 'EcoFood - Zero Waste Marketplace',
        description:
            'Hyper-local marketplace connecting surplus food vendors with conscious consumers at discounted prices.',
        longDescription:
            'Developed full-stack with Flutter and Firebase. Features geolocation discovery, dynamic QR pickup validation, push notifications, and dark/light theme switching.',
        tags: ['Flutter', 'Firebase', 'GeoFlutterFire', 'Riverpod'],
        category: 'Mobile App',
        imageUrl:
            'https://images.unsplash.com/photo-1542838132-92c53300491e?auto=format&fit=crop&w=800&q=80',
        githubUrl: 'https://github.com/bobbyryanhartono/ecofood',
        liveUrl: 'https://ecofood.example.com',
        featured: false,
      ),
      Project(
        id: 'proj-5',
        title: 'DevSpace - Developer Portfolio Engine',
        description:
            'An open-source customizable portfolio template built with Flutter Web for mobile and software engineers.',
        longDescription:
            'A lightweight, responsive, accessible web portfolio template featuring smooth animations, theme customizers, and seamless Markdown project showcases.',
        tags: ['Flutter Web', 'Open Source', 'Riverpod', 'Material 3'],
        category: 'Web & Desktop',
        imageUrl:
            'https://images.unsplash.com/photo-1498050108023-c5249f4df085?auto=format&fit=crop&w=800&q=80',
        githubUrl: 'https://github.com/bobbyryanhartono/devspace',
        liveUrl: 'https://devspace-flutter.web.app',
        featured: false,
      ),
    ];
  }

  @override
  Future<List<Experience>> getExperiences() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return const [
      Experience(
        id: 'exp-1',
        role: 'Lead Flutter Engineer',
        company: 'NexaTech Innovations',
        period: '2023 - Present',
        descriptionPoints: [
          'Spearheaded the redesign and refactoring of flagship mobile apps, increasing app store rating from 3.8 to 4.8.',
          'Architected app state management using Riverpod and modularized code into feature packages for a team of 8 engineers.',
          'Reduced CI/CD build and test pipeline duration by 40% using Fastlane and GitHub Actions.',
        ],
        technologies: ['Flutter', 'Dart', 'Riverpod', 'Clean Arch', 'Fastlane'],
        location: 'Jakarta, Indonesia (Hybrid)',
        employmentType: 'Full-time',
        companyLogoUrl: 'NT',
      ),
      Experience(
        id: 'exp-2',
        role: 'Senior Mobile Developer',
        company: 'Veloce Digital Systems',
        period: '2021 - 2023',
        descriptionPoints: [
          'Engineered cross-platform mobile solutions for fintech and e-commerce clients with 1M+ total active users.',
          'Implemented secure payment integrations, biometrics auth, and local database encryption using SQLCipher & Hive.',
          'Mentored junior developers, conducted rigorous code reviews, and enforced TDD practices.',
        ],
        technologies: ['Flutter', 'Kotlin', 'Swift', 'BLoC', 'Firebase'],
        location: 'Singapore (Remote)',
        employmentType: 'Full-time',
        companyLogoUrl: 'VD',
      ),
      Experience(
        id: 'exp-3',
        role: 'Flutter & Android Developer',
        company: 'KodeLabs Studio',
        period: '2019 - 2021',
        descriptionPoints: [
          'Developed 10+ custom mobile applications for startups and enterprise clients across Southeast Asia.',
          'Integrated complex Bluetooth Low Energy (BLE) hardware communicators and background location services.',
        ],
        technologies: ['Flutter', 'Android SDK', 'Java/Kotlin', 'REST APIs'],
        location: 'Bandung, Indonesia',
        employmentType: 'Full-time',
        companyLogoUrl: 'KL',
      ),
    ];
  }

  @override
  Future<bool> sendContactMessage({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    await Future.delayed(const Duration(milliseconds: 800));
    // Simulating successful submission
    return true;
  }
}
