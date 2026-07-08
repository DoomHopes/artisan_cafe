import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../core/theme/app_colors.dart';
import '../providers/brew_history_provider.dart';
import '../models/brew.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brewsAsync = ref.watch(brewHistoryProvider);

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
      ),
      body: brewsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
        data: (brews) {
          final today = DateTime.now();
          final todayMidnight = DateTime(today.year, today.month, today.day);

          final todayBrews = brews
              .where(
                (b) =>
                    b.createdAt.year == today.year &&
                    b.createdAt.month == today.month &&
                    b.createdAt.day == today.day,
              )
              .toList();

          final todayCaffeine = todayBrews.fold<int>(
            0,
            (sum, b) => sum + b.caffeine,
          );
          final totalCups = brews.length;

          String avgRoast = "N/A";
          String mostDrunk = "N/A";
          String peakTime = "N/A";

          if (brews.isNotEmpty) {
            final roastCounts = <String, int>{};
            final nameCounts = <String, int>{};
            final hourCounts = <String, int>{};

            for (var b in brews) {
              roastCounts[b.roastLevel] = (roastCounts[b.roastLevel] ?? 0) + 1;
              final name = b.name.isNotEmpty ? b.name : 'Custom Drink';
              nameCounts[name] = (nameCounts[name] ?? 0) + 1;
              final hour = DateFormat('hh:00 a').format(b.createdAt);
              hourCounts[hour] = (hourCounts[hour] ?? 0) + 1;
            }

            avgRoast = roastCounts.entries
                .reduce((a, b) => a.value > b.value ? a : b)
                .key;
            mostDrunk = nameCounts.entries
                .reduce((a, b) => a.value > b.value ? a : b)
                .key;
            peakTime = hourCounts.entries
                .reduce((a, b) => a.value > b.value ? a : b)
                .key;
          }

          final groupedBrews = <String, List<Brew>>{};
          for (var b in brews) {
            final dateStr = DateFormat('yyyy-MM-dd').format(b.createdAt);
            groupedBrews.putIfAbsent(dateStr, () => []).add(b);
          }
          final sortedDates = groupedBrews.keys.toList()
            ..sort((a, b) => b.compareTo(a));

          List<Widget> timelineWidgets = [];
          for (var dateStr in sortedDates) {
            final dateBrews = groupedBrews[dateStr]!;
            final dateObj = DateTime.parse(dateStr);
            final difference = todayMidnight.difference(dateObj).inDays;

            String headerText = DateFormat('MMMM d, yyyy').format(dateObj);
            bool isHighlighted = false;

            if (difference == 0) {
              headerText = "Today";
              isHighlighted = true;
            } else if (difference == 1) {
              headerText = "Yesterday";
            }

            timelineWidgets.add(
              _buildTimelineHeader(
                context,
                headerText,
                isHighlighted: isHighlighted,
              ),
            );
            timelineWidgets.add(const SizedBox(height: 16));

            List<Widget> itemWidgets = [];
            for (var b in dateBrews) {
              itemWidgets.add(
                _buildHistoryItem(
                  context,
                  icon: Icons.coffee,
                  iconBgColor: AppColors.secondaryContainer,
                  iconColor: AppColors.onSecondaryContainer,
                  title: b.name.isNotEmpty ? b.name : 'Custom Drink',
                  time: DateFormat('hh:mm a').format(b.createdAt),
                  subtitle: '${b.origin} • ${b.roastLevel} Roast',
                  caffeine: '${b.caffeine}',
                ),
              );
              itemWidgets.add(const SizedBox(height: 16));
            }

            timelineWidgets.add(
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
                  Column(children: itemWidgets),
                ],
              ),
            );
            timelineWidgets.add(const SizedBox(height: 40));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // History Header & Stats Summary
                Text(
                  'Brew History',
                  style: Theme.of(
                    context,
                  ).textTheme.headlineLarge?.copyWith(fontSize: 28),
                ),
                const SizedBox(height: 8),
                Text(
                  'Your coffee journey, curated cup by cup.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
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
                        value: "$todayCaffeine",
                        unit: "mg",
                        bgColor: AppColors.surfaceContainer,
                      ),
                      const SizedBox(width: 16),
                      _buildStatCard(
                        context,
                        title: "AVG ROAST",
                        value: avgRoast,
                        unit: "",
                        bgColor: AppColors.surfaceContainerLow,
                      ),
                      const SizedBox(width: 16),
                      _buildStatCard(
                        context,
                        title: "TOTAL CUPS",
                        value: "$totalCups",
                        unit: "",
                        bgColor: AppColors.surfaceContainerLow,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // Dynamic Timeline
                if (brews.isEmpty)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Text(
                        'No history yet.',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  )
                else
                  ...timelineWidgets,

                // Bento Style Insights
                Text(
                  'Weekly Ritual',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.primary,
                  ),
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
                            const Icon(
                              Icons.trending_up,
                              color: AppColors.onPrimaryContainer,
                              size: 32,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Most Drunk',
                                  style: Theme.of(context).textTheme.labelMedium
                                      ?.copyWith(
                                        color: AppColors.onPrimaryContainer
                                            .withValues(alpha: 0.8),
                                      ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  mostDrunk,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                        color: AppColors.onPrimary,
                                        fontSize: 20,
                                      ),
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
                            const Icon(
                              Icons.wb_sunny,
                              color: AppColors.onSecondaryContainer,
                              size: 32,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Peak Time',
                                  style: Theme.of(context).textTheme.labelMedium
                                      ?.copyWith(
                                        color: AppColors.onSecondaryContainer
                                            .withValues(alpha: 0.8),
                                      ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  peakTime,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                        color: AppColors.onSurface,
                                        fontSize: 20,
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
                const SizedBox(height: 32),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required String title,
    required String value,
    required String unit,
    required Color bgColor,
  }) {
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
                style: Theme.of(
                  context,
                ).textTheme.headlineMedium?.copyWith(color: AppColors.primary),
              ),
              if (unit.isNotEmpty) ...[
                const SizedBox(width: 4),
                Text(unit, style: Theme.of(context).textTheme.labelMedium),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineHeader(
    BuildContext context,
    String text, {
    required bool isHighlighted,
  }) {
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
        Expanded(child: Container(height: 1, color: AppColors.outlineVariant)),
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
                    Text(
                      title,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: AppColors.onSurface,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      time,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.onTertiaryFixedVariant,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          caffeine,
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                color: AppColors.primary,
                                fontSize: 20,
                              ),
                        ),
                        const SizedBox(width: 2),
                        Text(
                          'mg',
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
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
