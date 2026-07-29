import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/test_keys.dart';
import '../../../../core/utils/responsive_layout.dart';
import '../providers/portfolio_providers.dart';

class ContactSection extends ConsumerWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final formStatus = ref.watch(contactFormNotifierProvider);
    final isMobile = ResponsiveLayout.isMobile(context);

    // Controllers initialized for input handling
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final subjectController = TextEditingController();
    final messageController = TextEditingController();

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
              Icon(Icons.mail_outline_rounded,
                  color: colorScheme.primary, size: 28),
              const SizedBox(width: 12),
              Text(
                'Get In Touch',
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
          ResponsiveLayout(
            mobile: Column(
              children: [
                _buildInfoCard(context, colorScheme),
                const SizedBox(height: 24),
                _buildFormCard(
                  context,
                  ref,
                  colorScheme,
                  formStatus,
                  nameController,
                  emailController,
                  subjectController,
                  messageController,
                ),
              ],
            ),
            desktop: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: _buildInfoCard(context, colorScheme),
                ),
                const SizedBox(width: 32),
                Expanded(
                  flex: 3,
                  child: _buildFormCard(
                    context,
                    ref,
                    colorScheme,
                    formStatus,
                    nameController,
                    emailController,
                    subjectController,
                    messageController,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, ColorScheme colorScheme) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Let's discuss your next project!",
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Have an exciting mobile application idea or looking for a senior Flutter developer for your team? Feel free to reach out!',
              style: theme.textTheme.bodyMedium?.copyWith(
                height: 1.5,
                color: colorScheme.onSurface.withValues(alpha: 0.75),
              ),
            ),
            const SizedBox(height: 24),
            _ContactDetailRow(
              icon: Icons.email_outlined,
              title: 'Email',
              detail: 'bobbyryan692@gmail.com',
            ),
            const SizedBox(height: 16),
            _ContactDetailRow(
              icon: Icons.location_on_outlined,
              title: 'Location',
              detail: 'Jakarta, Indonesia (GMT+7)',
            ),
            const SizedBox(height: 16),
            _ContactDetailRow(
              icon: Icons.access_time_outlined,
              title: 'Response Time',
              detail: 'Within 24 Hours',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormCard(
    BuildContext context,
    WidgetRef ref,
    ColorScheme colorScheme,
    ContactFormStatus formStatus,
    TextEditingController nameController,
    TextEditingController emailController,
    TextEditingController subjectController,
    TextEditingController messageController,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (formStatus == ContactFormStatus.success)
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green.shade400),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.check_circle_outline, color: Colors.green),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Message sent successfully! Bobby will get back to you soon.',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            TextField(
              key: TestKeys.contactNameInput,
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Your Name',
                prefixIcon: Icon(Icons.person_outline),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              key: TestKeys.contactEmailInput,
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email Address',
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              key: TestKeys.contactSubjectInput,
              controller: subjectController,
              decoration: const InputDecoration(
                labelText: 'Subject',
                prefixIcon: Icon(Icons.subject_outlined),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              key: TestKeys.contactMessageInput,
              controller: messageController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Your Message',
                alignLabelWithHint: true,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                key: TestKeys.contactSubmitButton,
                onPressed: formStatus == ContactFormStatus.loading
                    ? null
                    : () async {
                        final success = await ref
                            .read(contactFormNotifierProvider.notifier)
                            .sendMessage(
                              name: nameController.text.trim(),
                              email: emailController.text.trim(),
                              subject: subjectController.text.trim(),
                              message: messageController.text.trim(),
                            );
                        if (success && context.mounted) {
                          nameController.clear();
                          emailController.clear();
                          subjectController.clear();
                          messageController.clear();
                        }
                      },
                icon: formStatus == ContactFormStatus.loading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.send_rounded),
                label: Text(
                  formStatus == ContactFormStatus.loading
                      ? 'Sending...'
                      : 'Send Message',
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactDetailRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String detail;

  const _ContactDetailRow({
    required this.icon,
    required this.title,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: colorScheme.primary.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: colorScheme.primary, size: 20),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
            Text(
              detail,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
