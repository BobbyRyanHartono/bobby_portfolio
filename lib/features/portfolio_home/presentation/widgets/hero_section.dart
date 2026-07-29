import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/test_keys.dart';
import '../../../../core/utils/responsive_layout.dart';
import '../providers/portfolio_providers.dart';

class HeroSection extends ConsumerWidget {
  final VoidCallback onProjectsPressed;
  final VoidCallback onContactPressed;

  const HeroSection({
    super.key,
    required this.onProjectsPressed,
    required this.onContactPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final profileAsync = ref.watch(profileInfoProvider);

    final isMobile = ResponsiveLayout.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 64,
        vertical: isMobile ? 40 : 80,
      ),
      child: profileAsync.when(
        data: (profile) => Column(
          children: [
            if (isMobile)
              Column(
                children: [
                  _buildAvatar(colorScheme),
                  const SizedBox(height: 32),
                  _buildContent(context, colorScheme, profile),
                ],
              )
            else
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: _buildContent(context, colorScheme, profile),
                  ),
                  const SizedBox(width: 48),
                  Expanded(
                    flex: 2,
                    child: _buildAvatar(colorScheme),
                  ),
                ],
              ),
            const SizedBox(height: 60),
            _buildStatsBar(context, colorScheme, profile),
          ],
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (err, stack) => Center(
          child: Text('Error loading profile: $err'),
        ),
      ),
    );
  }

  Widget _buildContent(
      BuildContext context, ColorScheme colorScheme, dynamic profile) {
    final theme = Theme.of(context);
    final isMobile = ResponsiveLayout.isMobile(context);

    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Available for work badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: colorScheme.primary.withValues(alpha: 0.3),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.greenAccent,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Available for new projects',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Hi, I'm ${profile.name}",
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface.withValues(alpha: 0.8),
          ),
        ),
        const SizedBox(height: 8),
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [colorScheme.primary, colorScheme.secondary],
          ).createShader(bounds),
          child: Text(
            profile.title,
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
            style: (isMobile
                    ? theme.textTheme.headlineSmall
                    : theme.textTheme.displaySmall)
                ?.copyWith(
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          profile.bio,
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurface.withValues(alpha: 0.7),
            height: 1.5,
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 16,
          runSpacing: 16,
          children: [
            ElevatedButton.icon(
              key: TestKeys.heroProjectsButton,
              onPressed: onProjectsPressed,
              icon: const Icon(Icons.rocket_launch_rounded),
              label: const Text('View Work'),
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            OutlinedButton.icon(
              key: TestKeys.heroContactButton,
              onPressed: onContactPressed,
              icon: const Icon(Icons.mail_outline_rounded),
              label: const Text('Get In Touch'),
              style: OutlinedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                side: BorderSide(color: colorScheme.primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAvatar(ColorScheme colorScheme) {
    return Center(
      child: Container(
        width: 240,
        height: 240,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              colorScheme.primary,
              colorScheme.secondary,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: colorScheme.primary.withValues(alpha: 0.35),
              blurRadius: 30,
              spreadRadius: 5,
            ),
          ],
        ),
        padding: const EdgeInsets.all(6),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colorScheme.surface,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.code_rounded,
                  size: 64,
                  color: colorScheme.primary,
                ),
                const SizedBox(height: 8),
                Text(
                  'FLUTTER DEV',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    fontSize: 12,
                    color: colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatsBar(
      BuildContext context, ColorScheme colorScheme, dynamic profile) {
    final isDesktop = ResponsiveLayout.isDesktop(context);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.3),
        ),
      ),
      child: Flex(
        direction: isDesktop ? Axis.horizontal : Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _StatItem(
            value: '${profile.yearsOfExperience}+',
            label: 'Years Experience',
          ),
          if (!isDesktop) const Divider(height: 24) else _divider(colorScheme),
          _StatItem(
            value: '${profile.completedProjects}+',
            label: 'Projects Delivered',
          ),
          if (!isDesktop) const Divider(height: 24) else _divider(colorScheme),
          _StatItem(
            value: '${profile.satisfiedClients}+',
            label: 'Happy Clients',
          ),
        ],
      ),
    );
  }

  Widget _divider(ColorScheme colorScheme) {
    return Container(
      height: 40,
      width: 1,
      color: colorScheme.outlineVariant.withValues(alpha: 0.5),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w800,
            color: colorScheme.primary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }
}
