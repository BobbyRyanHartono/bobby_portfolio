import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  final VoidCallback onScrollToTop;

  const FooterSection({
    super.key,
    required this.onScrollToTop,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        border: Border(
          top: BorderSide(
            color: colorScheme.outlineVariant.withValues(alpha: 0.3),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              '© ${DateTime.now().year} Bobby Ryan Hartono. Built with Flutter & Riverpod.',
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ),
          IconButton.filledTonal(
            onPressed: onScrollToTop,
            icon: const Icon(Icons.arrow_upward_rounded),
            tooltip: 'Back to Top',
          ),
        ],
      ),
    );
  }
}
