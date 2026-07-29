import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/test_keys.dart';
import '../../../../core/utils/responsive_layout.dart';
import '../providers/portfolio_providers.dart';

class PortfolioNavBar extends ConsumerWidget implements PreferredSizeWidget {
  final Function(String section) onNavItemSelected;

  const PortfolioNavBar({
    super.key,
    required this.onNavItemSelected,
  });

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final activeSection = ref.watch(activeSectionProvider);
    final themeMode = ref.watch(themeModeProvider);

    final isDesktop = ResponsiveLayout.isDesktop(context);

    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: colorScheme.surface.withValues(alpha: 0.9),
        border: Border(
          bottom: BorderSide(
            color: colorScheme.outlineVariant.withValues(alpha: 0.3),
          ),
        ),
      ),
      child: Row(
        children: [
          // Brand Logo
          InkWell(
            onTap: () => onNavItemSelected('Home'),
            borderRadius: BorderRadius.circular(8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        colorScheme.primary,
                        colorScheme.secondary,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'BH',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: Text(
                    'Bobby Ryan Hartono',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          // Desktop Nav Menu Items
          if (isDesktop) ...[
            _NavBarLink(
              key: TestKeys.navItem('Home'),
              title: 'Home',
              isActive: activeSection == 'Home',
              onTap: () => onNavItemSelected('Home'),
            ),
            _NavBarLink(
              key: TestKeys.navItem('About'),
              title: 'About',
              isActive: activeSection == 'About',
              onTap: () => onNavItemSelected('About'),
            ),
            _NavBarLink(
              key: TestKeys.navItem('Experience'),
              title: 'Experience',
              isActive: activeSection == 'Experience',
              onTap: () => onNavItemSelected('Experience'),
            ),
            _NavBarLink(
              key: TestKeys.navItem('Projects'),
              title: 'Projects',
              isActive: activeSection == 'Projects',
              onTap: () => onNavItemSelected('Projects'),
            ),
            _NavBarLink(
              key: TestKeys.navItem('Skills'),
              title: 'Skills',
              isActive: activeSection == 'Skills',
              onTap: () => onNavItemSelected('Skills'),
            ),
            _NavBarLink(
              key: TestKeys.navItem('Contact'),
              title: 'Contact',
              isActive: activeSection == 'Contact',
              onTap: () => onNavItemSelected('Contact'),
            ),
            const SizedBox(width: 16),
          ],

          // Dark/Light Theme Toggle
          IconButton(
            key: TestKeys.themeToggle,
            icon: Icon(
              themeMode == ThemeMode.dark
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
            ),
            tooltip: 'Toggle Theme',
            onPressed: () {
              ref.read(themeModeProvider.notifier).state =
                  themeMode == ThemeMode.dark
                      ? ThemeMode.light
                      : ThemeMode.dark;
            },
          ),

          // Mobile & Tablet Menu Drawer Button
          if (!isDesktop)
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
        ],
      ),
    );
  }
}

class _NavBarLink extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  const _NavBarLink({
    super.key,
    required this.title,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          foregroundColor: isActive
              ? colorScheme.primary
              : colorScheme.onSurface.withValues(alpha: 0.7),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
              ),
            ),
            if (isActive)
              Container(
                margin: const EdgeInsets.only(top: 4),
                height: 2,
                width: 16,
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
