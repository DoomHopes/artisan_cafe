import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:artisan_cafe/core/extensions/context_extensions.dart';
import '../core/theme/app_colors.dart';
import '../providers/brew_history_provider.dart';
import '../providers/user_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brewsAsync = ref.watch(brewHistoryProvider);
    final user = ref.watch(currentUserProvider).value;
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        titleSpacing: 20,
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: AppColors.secondaryContainer,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.coffee,
                color: AppColors.onSecondaryContainer,
                size: 24,
              ),
            ),
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
      body: brewsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (brews) {
          final today = DateTime.now();
          final todayBrews = brews
              .where(
                (b) =>
                    b.createdAt.year == today.year &&
                    b.createdAt.month == today.month &&
                    b.createdAt.day == today.day,
              )
              .toList();
          final totalCaffeine = todayBrews.fold<int>(
            0,
            (sum, brew) => sum + brew.caffeine,
          );
          final progress = (todayBrews.length / 5.0).clamp(0.0, 1.0);
          final latestBrew = brews.isNotEmpty ? brews.first : null;

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.goodMorning(user?.name ?? 'Alex'),
                  style: Theme.of(
                    context,
                  ).textTheme.headlineLarge?.copyWith(fontSize: 28),
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.readyForFirstBrew,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 32),

                // Progress Ring
                Center(
                  child: SizedBox(
                    width: 256,
                    height: 256,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CircularProgressIndicator(
                          value: progress,
                          strokeWidth: 8,
                          backgroundColor: AppColors.secondaryContainer,
                          color: AppColors.primaryContainer,
                          strokeCap: StrokeCap.round,
                        ),
                        Center(
                          child: Text(
                            '${todayBrews.length}',
                            style: Theme.of(context).textTheme.displayLarge
                                ?.copyWith(
                                  fontSize: 40,
                                  color: AppColors.primary,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Latest Drink Card
                if (latestBrew != null)
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppColors.surface.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.secondaryContainer.withValues(
                          alpha: 0.5,
                        ),
                      ),
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
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: AppColors.primaryContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.local_cafe,
                            color: AppColors.onPrimary,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                latestBrew.name.isNotEmpty
                                    ? latestBrew.name
                                    : l10n.customDrink,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(fontSize: 24),
                              ),
                              Text(
                                DateFormat(
                                  'MMMM d, h:mm a',
                                ).format(latestBrew.createdAt),
                                style: Theme.of(context).textTheme.labelMedium
                                    ?.copyWith(
                                      color: AppColors.onSurfaceVariant,
                                      fontSize: 14,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.secondaryContainer,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            '${latestBrew.caffeine}mg',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.onSecondaryContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.outlineVariant,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Center(child: Text(l10n.noDrinksLogged)),
                  ),
                const SizedBox(height: 16),

                // Daily Tip
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainer,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE0D4C0)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.lightbulb_outline,
                        color: AppColors.onTertiaryContainer,
                        size: 24,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.dailyCaffeineTipTitle,
                              style: Theme.of(
                                context,
                              ).textTheme.labelLarge?.copyWith(fontSize: 14),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              l10n.dailyCaffeineTipText,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: AppColors.onSurfaceVariant,
                                    fontStyle: FontStyle.italic,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Stats Grid
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFE0D4C0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.hydrationLabel,
                              style: Theme.of(context).textTheme.labelSmall
                                  ?.copyWith(
                                    color: AppColors.onSurfaceVariant,
                                    letterSpacing: 1.2,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  '1.2',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineMedium,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  l10n.litersLabel,
                                  style: Theme.of(context).textTheme.labelSmall
                                      ?.copyWith(
                                        color: AppColors.onSurfaceVariant,
                                      ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            LinearProgressIndicator(
                              value: 0.66,
                              backgroundColor: AppColors.secondaryContainer,
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(4),
                              minHeight: 4,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFE0D4C0)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.caffeineLabel,
                              style: Theme.of(context).textTheme.labelSmall
                                  ?.copyWith(
                                    color: AppColors.onSurfaceVariant,
                                    letterSpacing: 1.2,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  '$totalCaffeine',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.headlineMedium,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  l10n.mgLabel,
                                  style: Theme.of(context).textTheme.labelSmall
                                      ?.copyWith(
                                        color: AppColors.onSurfaceVariant,
                                      ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            LinearProgressIndicator(
                              value: (totalCaffeine / 400.0).clamp(0.0, 1.0),
                              backgroundColor: AppColors.secondaryContainer,
                              color: totalCaffeine > 400
                                  ? AppColors.error
                                  : AppColors.primary,
                              borderRadius: BorderRadius.circular(4),
                              minHeight: 4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/add_drink');
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add, size: 32),
      ),
    );
  }
}
