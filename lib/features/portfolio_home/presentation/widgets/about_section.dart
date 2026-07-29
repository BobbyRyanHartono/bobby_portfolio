import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/utils/responsive_layout.dart';
import '../providers/portfolio_providers.dart';

class AboutSection extends ConsumerWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final profileAsync = ref.watch(profileInfoProvider);
    final isMobile = ResponsiveLayout.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 64,
        vertical: 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.person_pin_rounded, color: colorScheme.primary, size: 28),
              const SizedBox(width: 12),
              Text(
                'About Me',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: 3,
            width: 48,
            decoration: BoxDecoration(
              color: colorScheme.primary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 32),
          profileAsync.when(
            data: (profile) => ResponsiveLayout(
              mobile: Column(
                children: [
                  _buildBioCard(context, colorScheme, profile),
                  const SizedBox(height: 20),
                  _buildHighlightsGrid(context, colorScheme),
                ],
              ),
              desktop: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: _buildBioCard(context, colorScheme, profile),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    flex: 2,
                    child: _buildHighlightsGrid(context, colorScheme),
                  ),
                ],
              ),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, _) => Text('Error loading about section: $err'),
          ),
        ],
      ),
    );
  }

  Widget _buildBioCard(
      BuildContext context, ColorScheme colorScheme, dynamic profile) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Engineering Scalable Mobile Applications',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'I am Bobby Ryan Hartono, a passionate mobile solutions architect with over 6 years of experience building cross-platform applications. My core expertise centers around Flutter, Dart, Clean Architecture, and reactive state management frameworks like Riverpod & BLoC.',
              style: theme.textTheme.bodyMedium?.copyWith(
                height: 1.6,
                color: colorScheme.onSurface.withValues(alpha: 0.8),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'I specialize in designing maintainable app architectures, integrating real-time streaming services, implementing sleek custom UI design systems, and ensuring seamless cross-platform performance across iOS, Android, and Web.',
              style: theme.textTheme.bodyMedium?.copyWith(
                height: 1.6,
                color: colorScheme.onSurface.withValues(alpha: 0.8),
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 24,
              runSpacing: 12,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.location_on_outlined,
                        color: colorScheme.primary, size: 20),
                    const SizedBox(width: 6),
                    Text(
                      profile.location,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.mark_email_read_outlined,
                        color: colorScheme.primary, size: 20),
                    const SizedBox(width: 6),
                    Text(
                      profile.email,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHighlightsGrid(BuildContext context, ColorScheme colorScheme) {
    return Column(
      children: [
        _HighlightTile(
          icon: Icons.architecture_rounded,
          title: 'Clean Architecture',
          description:
              'Decoupled UI, domain, and data layers for maintainability & unit testing.',
        ),
        const SizedBox(height: 12),
        _HighlightTile(
          icon: Icons.bolt_rounded,
          title: 'Reactive State',
          description:
              'Seamless state flow using Riverpod for predictable, high-performance state handling.',
        ),
        const SizedBox(height: 12),
        _HighlightTile(
          icon: Icons.palette_outlined,
          title: 'Material 3 & Motion',
          description:
              'Fluid responsive designs, adaptive light/dark themes, and micro-interactions.',
        ),
      ],
    );
  }
}

class _HighlightTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _HighlightTile({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: colorScheme.primary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: colorScheme.primary),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
