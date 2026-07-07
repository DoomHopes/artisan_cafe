import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        titleSpacing: 20,
        title: Row(
          children: [
            const Icon(Icons.coffee, color: AppColors.primary, size: 24),
            const SizedBox(width: 12),
            Text(
              'Artisan Cafe',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.primary,
                fontSize: 24,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.outlineVariant, width: 1),
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuA2P1Uf0y3GD7gcZ4y-jicQXXKI08Gfnlrgypa5bjkgAOyoyQcK-kEyw1lvK5My3-oYo9I-OK_nTqhBHhBPT3Zwt6GhmLBNfaDhfIs1r4MKk9q-CTAIJ1MbMuh_Lx2xdcQho_aF2_PYb31OKi4P5br_g3Repwz7N9s6tjt79kpIpX7pWY87bH-tPvbVprHfe-gCOSqR_xcL1Z-cZRQSzXH77_DoolERYdGiMh2Qbe5JgvH_e5mxYT-ehqmzZ94GugDXcrYIzQ8sFjXF'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Weekly Insights',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 28),
            ),
            const SizedBox(height: 4),
            Text(
              'Your caffeine ritual, quantified.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.onSurfaceVariant),
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
                          color: AppColors.primaryContainer.withValues(alpha: 0.05),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Weekly Average', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.onSurfaceVariant, fontSize: 14)),
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text('2.4', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.primary)),
                            const SizedBox(width: 4),
                            Text('cups/day', style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.onSurfaceVariant)),
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
                          color: AppColors.primaryContainer.withValues(alpha: 0.05),
                          blurRadius: 24,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Total Caffeine', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.onPrimaryContainer, fontSize: 14)),
                        const SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text('1,420', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.onPrimary)),
                            const SizedBox(width: 4),
                            Text('mg', style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.onPrimaryContainer)),
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
                      Text('Consumption Trends', style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 14)),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.secondaryContainer,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Text('Week', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.onSecondaryContainer)),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            child: const Text('Month', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.onSurfaceVariant)),
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
                          children: List.generate(4, (index) => const Divider(color: AppColors.outline, thickness: 0.2)),
                        ),
                        // Bars
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            _buildBar('M', 0.6, false),
                            _buildBar('T', 0.85, true),
                            _buildBar('W', 0.4, false),
                            _buildBar('T', 0.95, true),
                            _buildBar('F', 0.7, false),
                            _buildBar('S', 0.3, false),
                            _buildBar('S', 0.15, false),
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
            Text('Bean Preferences', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 24)),
            const SizedBox(height: 12),
            _buildPreferenceItem(Icons.coffee_maker, 'Ethiopian Yirgacheffe', 0.42, true),
            const SizedBox(height: 12),
            _buildPreferenceItem(Icons.water_drop, 'Cold Brew (House)', 0.28, false),
            const SizedBox(height: 12),
            _buildPreferenceItem(Icons.local_cafe, 'Oat Milk Latte', 0.15, false),
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
                      const Icon(Icons.lightbulb_outline, size: 20, color: Color(0xFF872000)),
                      const SizedBox(width: 8),
                      Text('Brewing Tip', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: const Color(0xFF872000))),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text('Optimize your extraction', style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 8),
                  Text(
                    'Based on your frequency, you might enjoy a coarser grind for your morning ritual to reduce acidity.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.onSurfaceVariant),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Text('Learn how', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.primary)),
                      const SizedBox(width: 4),
                      const Icon(Icons.arrow_forward, size: 18, color: AppColors.primary),
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
            color: isHighlight ? AppColors.secondaryContainer : AppColors.surfaceContainerHigh,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 160 * percent,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: isHighlight ? 0.3 : 0.0),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(day, style: const TextStyle(fontSize: 12, color: AppColors.onSurfaceVariant)),
      ],
    );
  }

  Widget _buildPreferenceItem(IconData icon, String title, double percent, bool isPrimary) {
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
              color: isPrimary ? AppColors.secondaryContainer : AppColors.surfaceContainerHigh,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: isPrimary ? AppColors.primary : AppColors.onSurfaceVariant),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.onSurface)),
                    Text('${(percent * 100).toInt()}%', style: const TextStyle(fontSize: 12, color: AppColors.onSurfaceVariant)),
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
