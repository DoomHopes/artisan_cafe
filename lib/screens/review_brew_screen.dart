import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:artisan_cafe/core/extensions/context_extensions.dart';
import '../core/theme/app_colors.dart';
import '../core/constants/app_images.dart';
import '../providers/add_brew_provider.dart';

class ReviewBrewScreen extends ConsumerStatefulWidget {
  const ReviewBrewScreen({super.key});

  @override
  ConsumerState<ReviewBrewScreen> createState() => _ReviewBrewScreenState();
}

class _ReviewBrewScreenState extends ConsumerState<ReviewBrewScreen> {
  bool _isLogging = false;

  void _handleLogBrew() async {
    setState(() => _isLogging = true);
    await ref.read(addBrewWizardProvider.notifier).logBrew();
    if (mounted) {
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    final brewState = ref.watch(addBrewWizardProvider);
    final dynamicCaffeine = ref
        .read(addBrewWizardProvider.notifier)
        .calculateCaffeine();
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: Text(l10n.reviewBrew),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => context.go('/'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Step Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  l10n.step3Of3,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
                Text(
                  l10n.readyToLog,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              height: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: AppColors.outlineVariant,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: 1.0,
                  backgroundColor: AppColors.outlineVariant,
                  color: const Color(0xFFD84315),
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Summary Card
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLow,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE0D4C0)),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryContainer.withValues(alpha: 0.08),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: -20,
                    top: -20,
                    child: Icon(
                      Icons.coffee,
                      size: 120,
                      color: AppColors.primary.withValues(alpha: 0.1),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.brewSummary,
                        style: Theme.of(context).textTheme.labelMedium
                            ?.copyWith(
                              color: AppColors.onSurfaceVariant,
                              letterSpacing: 1.2,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${brewState.name.isEmpty ? l10n.customDrinkTitle : brewState.name}, ${brewState.roastLevel}',
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(color: AppColors.primary),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _buildSummaryChip(
                            Icons.location_on,
                            brewState.origin,
                          ),
                          _buildSummaryChip(
                            Icons.local_fire_department,
                            '${brewState.roastLevel} Roast',
                          ),
                          if (brewState.isMilkBased)
                            _buildSummaryChip(
                              Icons.water_drop,
                              l10n.milkBasedLabel,
                            ),
                          _buildSummaryChip(
                            Icons.coffee_maker,
                            brewState.brewMethod
                                .replaceAll('_', ' ')
                                .toUpperCase(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Caffeine Impact Card
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.primaryContainer,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryContainer.withValues(alpha: 0.08),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.caffeineImpact,
                            style: Theme.of(context).textTheme.labelMedium
                                ?.copyWith(
                                  color: AppColors.onPrimaryContainer,
                                  letterSpacing: 1.2,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                '$dynamicCaffeine',
                                style: Theme.of(context).textTheme.displayMedium
                                    ?.copyWith(
                                      color: AppColors.surface,
                                      fontSize: 40,
                                    ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                l10n.mgLabel,
                                style: Theme.of(context).textTheme.headlineSmall
                                    ?.copyWith(color: AppColors.surfaceDim),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.surface.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.1),
                          ),
                        ),
                        child: const Icon(Icons.bolt, color: AppColors.surface),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10n.dailyProgress,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppColors.surfaceDim,
                        ),
                      ),
                      Text(
                        l10n.dailyProgressValue("320", "400"),
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppColors.surfaceDim,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: 0.8,
                    backgroundColor: const Color(
                      0xFFE0D4C0,
                    ).withValues(alpha: 0.2),
                    color: const Color(0xFFD84315),
                    minHeight: 12,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.remainingLimitText("80"),
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: AppColors.surfaceDim,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Visual Interest
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFE0D4C0)),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryContainer.withValues(
                            alpha: 0.08,
                          ),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                        ),
                      ],
                      image: const DecorationImage(
                        image: NetworkImage(AppImages.reviewMap),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 160,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLowest,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFE0D4C0)),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.schedule,
                          color: Color(0xFFD84315),
                          size: 36,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          l10n.estimatedPeak,
                          style: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(color: AppColors.onSurfaceVariant),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '10:45 AM',
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                color: AppColors.primary,
                                fontSize: 20,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 48),

            // Log Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _isLogging ? null : _handleLogBrew,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3E2723),
                  foregroundColor: const Color(0xFFFFF3E0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _isLogging ? 'Logging...' : 'Log Brew',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 12),
                    if (_isLogging)
                      const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Color(0xFFFFF3E0),
                          strokeWidth: 2,
                        ),
                      )
                    else
                      const Icon(Icons.send, size: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.secondaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppColors.onSecondaryContainer),
          const SizedBox(width: 6),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: AppColors.onSecondaryContainer,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
