import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:artisan_cafe/core/extensions/context_extensions.dart';
import '../core/theme/app_colors.dart';
import '../providers/user_provider.dart';
import '../providers/locale_provider.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  Future<void> _editName(String currentName) async {
    final l10n = context.l10n;
    final controller = TextEditingController(text: currentName);
    final newName = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.editName),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: l10n.enterNewName),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, controller.text),
            child: Text(l10n.save),
          ),
        ],
      ),
    );
    if (newName != null && newName.trim().isNotEmpty) {
      ref.read(currentUserProvider.notifier).updateName(newName.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(currentUserProvider);
    final user = userState.value;
    final l10n = context.l10n;

    if (userState.isLoading || user == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        titleSpacing: 20,
        title: Row(
          children: [
            const Icon(Icons.coffee, color: AppColors.primary, size: 24),
            const SizedBox(width: 12),
            Text(
              l10n.appName,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.primary,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            // Profile Hero Section
            Column(
              children: [
                GestureDetector(
                  onTap: () => _editName(user.name),
                  child: Text(
                    user.name,
                    style: Theme.of(
                      context,
                    ).textTheme.headlineLarge?.copyWith(fontSize: 28),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.homeBrewerSince(user.createdAt.year.toString()),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Bento Grid Settings
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLow,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE0D4C0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.my_location,
                          color: AppColors.onSecondaryContainer,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        l10n.dailyGoal,
                        style: Theme.of(
                          context,
                        ).textTheme.labelMedium?.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLowest,
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryContainer.withValues(
                            alpha: 0.08,
                          ),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (user.dailyGoal > 0) {
                              ref
                                  .read(currentUserProvider.notifier)
                                  .updateDailyGoal(user.dailyGoal - 1);
                            }
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: AppColors.secondaryContainer,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.remove,
                              color: AppColors.onSecondaryContainer,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              '${user.dailyGoal}',
                              style: Theme.of(context).textTheme.headlineMedium
                                  ?.copyWith(color: AppColors.primary),
                            ),
                            Text(
                              l10n.cupsPerDay,
                              style: Theme.of(context).textTheme.labelSmall
                                  ?.copyWith(color: AppColors.onSurfaceVariant),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            ref
                                .read(currentUserProvider.notifier)
                                .updateDailyGoal(user.dailyGoal + 1);
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: AppColors.secondaryContainer,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: AppColors.onSecondaryContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Notification Reminders Card
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLow,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE0D4C0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.secondaryContainer,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.notifications,
                              color: AppColors.onSecondaryContainer,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            l10n.reminders,
                            style: Theme.of(
                              context,
                            ).textTheme.labelMedium?.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      Switch(
                        value: user.remindersEnabled,
                        onChanged: (val) => ref
                            .read(currentUserProvider.notifier)
                            .toggleReminders(val),
                        activeThumbColor: AppColors.onPrimary,
                        activeTrackColor: AppColors.primaryContainer,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    l10n.remindersDescription,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Language Card
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLow,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE0D4C0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.secondaryContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.language,
                          color: AppColors.onSecondaryContainer,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        l10n.language,
                        style: Theme.of(
                          context,
                        ).textTheme.labelMedium?.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                  DropdownButton<String>(
                    value: user.languageCode,
                    underline: const SizedBox(),
                    items: const [
                      DropdownMenuItem(value: 'en', child: Text('English')),
                      DropdownMenuItem(value: 'ru', child: Text('Русский')),
                    ],
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        ref
                            .read(localeProvider.notifier)
                            .updateLanguage(newValue);
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Export Data Card
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryContainer.withValues(alpha: 0.08),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.onPrimary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.download,
                      color: AppColors.onPrimary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.exportData,
                          style: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(
                                color: AppColors.onPrimary,
                                fontSize: 14,
                              ),
                        ),
                        Text(
                          l10n.exportDataDescription,
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(
                                color: AppColors.onPrimary.withValues(
                                  alpha: 0.7,
                                ),
                              ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: AppColors.onPrimary),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Account Security / Misc
            _buildListItem(Icons.lock, 'Privacy & Security', false),
            const SizedBox(height: 8),
            _buildListItem(Icons.help, 'Support Center', false),
            const SizedBox(height: 8),
            _buildListItem(
              Icons.logout,
              'Log Out',
              true,
              onTap: () async {
                await ref.read(currentUserProvider.notifier).logout();
                if (context.mounted) context.go('/login');
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem(
    IconData icon,
    String label,
    bool isError, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFE0D4C0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: isError ? AppColors.error : AppColors.onSurfaceVariant,
                ),
                const SizedBox(width: 12),
                Text(
                  label,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontSize: 14,
                    color: isError ? AppColors.error : AppColors.onSurface,
                  ),
                ),
              ],
            ),
            if (!isError)
              const Icon(
                Icons.chevron_right,
                color: AppColors.onSurfaceVariant,
              ),
          ],
        ),
      ),
    );
  }
}
