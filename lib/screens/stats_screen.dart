import 'package:flutter/material.dart';
import 'package:artisan_cafe/core/extensions/context_extensions.dart';
import '../core/theme/app_colors.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: AppColors.background,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.weeklyInsights,
              style: Theme.of(
                context,
              ).textTheme.headlineLarge?.copyWith(fontSize: 28),
            ),
            const SizedBox(height: 4),
            Text(
              l10n.weeklyInsightsSubtitle,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),

            // Summary Bento Grid
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.outlineVariant),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryContainer.withValues(
                            alpha: 0.05,
                          ),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.weeklyAverage,
                          style: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(
                                color: AppColors.onSurfaceVariant,
                                fontSize: 14,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '2.4',
                              style: Theme.of(context).textTheme.headlineMedium
                                  ?.copyWith(color: AppColors.primary),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              l10n.cupsPerDay,
                              style: Theme.of(context).textTheme.labelSmall
                                  ?.copyWith(color: AppColors.onSurfaceVariant),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.primaryContainer,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryContainer.withValues(
                            alpha: 0.05,
                          ),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.totalCaffeineLabel,
                          style: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(
                                color: AppColors.onPrimaryContainer,
                                fontSize: 14,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '1,420',
                              style: Theme.of(context).textTheme.headlineMedium
                                  ?.copyWith(color: AppColors.onPrimary),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              l10n.mgLabel,
                              style: Theme.of(context).textTheme.labelSmall
                                  ?.copyWith(
                                    color: AppColors.onPrimaryContainer,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Weekly Bar Chart Section
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLowest,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.outlineVariant),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryContainer.withValues(alpha: 0.05),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        l10n.consumptionTrends,
                        style: Theme.of(
                          context,
                        ).textTheme.labelMedium?.copyWith(fontSize: 14),
                      ),
                      Row(
                        children: [
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
                              l10n.week,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.onSecondaryContainer,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            child: Text(
                              l10n.month,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.onSurfaceVariant,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    height: 192,
                    child: Stack(
                      children: [
                        // Grid lines
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            4,
                            (index) => const Divider(
                              color: AppColors.outline,
                              thickness: 0.2,
                            ),
                          ),
                        ),
                        // Bars
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            _buildBar(l10n.shortMon, 0.6, false),
                            _buildBar(l10n.shortTue, 0.85, true),
                            _buildBar(l10n.shortWed, 0.4, false),
                            _buildBar(l10n.shortThu, 0.95, true),
                            _buildBar(l10n.shortFri, 0.7, false),
                            _buildBar(l10n.shortSat, 0.3, false),
                            _buildBar(l10n.shortSun, 0.15, false),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Bean Preferences
            Text(
              l10n.beanPreferences,
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontSize: 24),
            ),
            const SizedBox(height: 12),
            _buildPreferenceItem(
              Icons.coffee_maker,
              l10n.ethiopianYirgacheffe,
              0.42,
              true,
            ),
            const SizedBox(height: 12),
            _buildPreferenceItem(
              Icons.water_drop,
              l10n.coldBrewHouse,
              0.28,
              false,
            ),
            const SizedBox(height: 12),
            _buildPreferenceItem(
              Icons.local_cafe,
              l10n.oatMilkLatte,
              0.15,
              false,
            ),
            const SizedBox(height: 24),

            // Ambient Brewing Tip
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.primaryFixedDim),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.lightbulb_outline,
                        size: 20,
                        color: Color(0xFF872000),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        l10n.brewingTip,
                        style: Theme.of(context).textTheme.labelMedium
                            ?.copyWith(color: const Color(0xFF872000)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    l10n.optimizeExtraction,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.optimizeExtractionText,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        l10n.learnHow,
                        style: Theme.of(context).textTheme.labelMedium
                            ?.copyWith(color: AppColors.primary),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.arrow_forward,
                        size: 18,
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBar(String day, double percent, bool isHighlight) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 32,
          height: 160 * percent,
          decoration: BoxDecoration(
            color: isHighlight
                ? AppColors.secondaryContainer
                : AppColors.surfaceContainerHigh,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 160 * percent,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(
                  alpha: isHighlight ? 0.3 : 0.0,
                ),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          day,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildPreferenceItem(
    IconData icon,
    String title,
    double percent,
    bool isPrimary,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.outlineVariant),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: isPrimary
                  ? AppColors.secondaryContainer
                  : AppColors.surfaceContainerHigh,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: isPrimary ? AppColors.primary : AppColors.onSurfaceVariant,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.onSurface,
                      ),
                    ),
                    Text(
                      '${(percent * 100).toInt()}%',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: percent,
                  backgroundColor: AppColors.outlineVariant,
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(4),
                  minHeight: 6,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
