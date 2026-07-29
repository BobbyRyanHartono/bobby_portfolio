import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/test_keys.dart';
import '../providers/portfolio_providers.dart';
import '../widgets/about_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/footer_section.dart';
import '../widgets/hero_section.dart';
import '../widgets/navigation_bar.dart';
import '../widgets/projects_section.dart';
import '../widgets/skills_section.dart';

class PortfolioHomeScreen extends ConsumerWidget {
  PortfolioHomeScreen({super.key});

  final ScrollController _scrollController = ScrollController();

  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  GlobalKey _getKeyForSection(String section) {
    switch (section) {
      case 'About':
        return _aboutKey;
      case 'Experience':
        return _experienceKey;
      case 'Projects':
        return _projectsKey;
      case 'Skills':
        return _skillsKey;
      case 'Contact':
        return _contactKey;
      case 'Home':
      default:
        return _homeKey;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: PortfolioNavBar(
        onNavItemSelected: (section) {
          ref.read(activeSectionProvider.notifier).state = section;
          _scrollToSection(_getKeyForSection(section));
        },
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [colorScheme.primary, colorScheme.secondary],
                ),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Bobby Ryan Hartono',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Flutter Solutions Architect',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            _buildDrawerTile(context, ref, 'Home', Icons.home_outlined),
            _buildDrawerTile(context, ref, 'About', Icons.person_outline),
            _buildDrawerTile(
                context, ref, 'Experience', Icons.work_outline),
            _buildDrawerTile(
                context, ref, 'Projects', Icons.folder_outlined),
            _buildDrawerTile(
                context, ref, 'Skills', Icons.psychology_outlined),
            _buildDrawerTile(
                context, ref, 'Contact', Icons.mail_outline),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            KeyedSubtree(
              key: _homeKey,
              child: HeroSection(
                key: TestKeys.section('Home'),
                onProjectsPressed: () {
                  ref.read(activeSectionProvider.notifier).state = 'Projects';
                  _scrollToSection(_projectsKey);
                },
                onContactPressed: () {
                  ref.read(activeSectionProvider.notifier).state = 'Contact';
                  _scrollToSection(_contactKey);
                },
              ),
            ),
            KeyedSubtree(
              key: _aboutKey,
              child: AboutSection(key: TestKeys.section('About')),
            ),
            KeyedSubtree(
              key: _experienceKey,
              child: ExperienceSection(key: TestKeys.section('Experience')),
            ),
            KeyedSubtree(
              key: _projectsKey,
              child: ProjectsSection(key: TestKeys.section('Projects')),
            ),
            KeyedSubtree(
              key: _skillsKey,
              child: SkillsSection(key: TestKeys.section('Skills')),
            ),
            KeyedSubtree(
              key: _contactKey,
              child: ContactSection(key: TestKeys.section('Contact')),
            ),
            FooterSection(
              onScrollToTop: () {
                ref.read(activeSectionProvider.notifier).state = 'Home';
                _scrollToSection(_homeKey);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerTile(
      BuildContext context, WidgetRef ref, String section, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(section),
      onTap: () {
        Navigator.of(context).pop();
        ref.read(activeSectionProvider.notifier).state = section;
        _scrollToSection(_getKeyForSection(section));
      },
    );
  }
}
