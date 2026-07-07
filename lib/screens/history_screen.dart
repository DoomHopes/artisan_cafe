import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
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
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.surfaceContainerHigh,
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuDNouNIKRf-blWvybGod2s2e5x8okgdQ8OY4aGDY-J5CNkhT81MszxWf_leibS80BrEK5O7Dy2jHU9kkH3uaSCRhc1um9V2xn9uAilWmB6N8XHC7xyEaA7bK6G6uxdIIMmjVSGZpiKaEd3-9aTCE159-faqZ6NlKPDvQbRBiFSK3AcQCVMGL-MPrg7SOe2HTNhix5Akbvgf8e1znWR0ftifzWGutAT9xxcX9wB4pSWjqebZFK2fkG6_EmZsHuhcDyY1EDuQ4_6tijyk'),
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
            // History Header & Stats Summary
            Text(
              'Brew History',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 28),
            ),
            const SizedBox(height: 8),
            Text(
              'Your coffee journey, curated cup by cup.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.onSurfaceVariant),
            ),
            const SizedBox(height: 24),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              child: Row(
                children: [
                  _buildStatCard(
                    context,
                    title: "TODAY'S INTAKE",
                    value: "120",
                    unit: "mg",
                    bgColor: AppColors.surfaceContainer,
                  ),
                  const SizedBox(width: 16),
                  _buildStatCard(
                    context,
                    title: "AVG ROAST",
                    value: "Medium",
                    unit: "",
                    bgColor: AppColors.surfaceContainerLow,
                  ),
                  const SizedBox(width: 16),
                  _buildStatCard(
                    context,
                    title: "TOTAL CUPS",
                    value: "42",
                    unit: "",
                    bgColor: AppColors.surfaceContainerLow,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Timeline Section: Today
            _buildTimelineHeader(context, 'Today', isHighlighted: true),
            const SizedBox(height: 16),
            Stack(
              children: [
                Positioned(
                  left: 24,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: 2,
                    color: AppColors.outlineVariant.withValues(alpha: 0.3),
                  ),
                ),
                Column(
                  children: [
                    _buildHistoryItem(
                      context,
                      icon: Icons.coffee,
                      iconBgColor: AppColors.secondaryContainer,
                      iconColor: AppColors.onSecondaryContainer,
                      title: 'Double Espresso',
                      time: '08:45 AM',
                      subtitle: 'Ethiopia Sidamo • Medium Roast',
                      caffeine: '64',
                    ),
                    const SizedBox(height: 16),
                    _buildHistoryItem(
                      context,
                      icon: Icons.local_cafe,
                      iconBgColor: AppColors.secondaryContainer,
                      iconColor: AppColors.onSecondaryContainer,
                      title: 'Oat Milk Latte',
                      time: '11:30 AM',
                      subtitle: 'Signature House Blend',
                      caffeine: '56',
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Timeline Section: Yesterday
            _buildTimelineHeader(context, 'Yesterday', isHighlighted: false),
            const SizedBox(height: 16),
            Stack(
              children: [
                Positioned(
                  left: 24,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: 2,
                    color: AppColors.outlineVariant.withValues(alpha: 0.3),
                  ),
                ),
                Column(
                  children: [
                    _buildHistoryItem(
                      context,
                      icon: Icons.coffee_maker,
                      iconBgColor: AppColors.surfaceContainerHigh,
                      iconColor: AppColors.onSurfaceVariant,
                      title: 'V60 Pour Over',
                      time: '09:15 AM',
                      subtitle: 'Colombia Gesha • Light Roast',
                      caffeine: '85',
                    ),
                    const SizedBox(height: 16),
                    _buildHistoryItem(
                      context,
                      icon: Icons.bolt,
                      iconBgColor: AppColors.surfaceContainerHigh,
                      iconColor: AppColors.onSurfaceVariant,
                      title: 'Cortado',
                      time: '03:45 PM',
                      subtitle: 'Brazil Cerrado',
                      caffeine: '64',
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Bento Style Insights
            Text(
              'Weekly Ritual',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.primary),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 160,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.primaryContainer,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.trending_up, color: AppColors.onPrimaryContainer, size: 32),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Most Drunk', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.onPrimaryContainer.withValues(alpha: 0.8))),
                            const SizedBox(height: 4),
                            Text('Flat White', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.onPrimary, fontSize: 20)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 160,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.secondaryContainer,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.wb_sunny, color: AppColors.onSecondaryContainer, size: 32),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Peak Time', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.onSecondaryContainer.withValues(alpha: 0.8))),
                            const SizedBox(height: 4),
                            Text('09:30 AM', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.onSurface, fontSize: 20)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, {required String title, required String value, required String unit, required Color bgColor}) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0D4C0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: AppColors.onSurfaceVariant,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.primary),
              ),
              if (unit.isNotEmpty) ...[
                const SizedBox(width: 4),
                Text(
                  unit,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineHeader(BuildContext context, String text, {required bool isHighlighted}) {
    return Row(
      children: [
        if (isHighlighted)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primaryFixedDim,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              text.toUpperCase(),
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: AppColors.onTertiaryFixedVariant,
                letterSpacing: 1.2,
              ),
            ),
          )
        else
          Text(
            text.toUpperCase(),
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: AppColors.onSurfaceVariant,
              letterSpacing: 1.2,
            ),
          ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            height: 1,
            color: AppColors.outlineVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildHistoryItem(
    BuildContext context, {
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required String title,
    required String time,
    required String subtitle,
    required String caffeine,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryContainer.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.onSurface, fontSize: 14)),
                    Text(time, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.onSurfaceVariant)),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(subtitle, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.onTertiaryFixedVariant)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(caffeine, style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.primary, fontSize: 20)),
                        const SizedBox(width: 2),
                        Text('mg', style: Theme.of(context).textTheme.labelSmall),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
