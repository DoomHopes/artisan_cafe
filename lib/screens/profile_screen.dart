import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _dailyGoal = 3;
  bool _remindersEnabled = true;

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
                border: Border.all(color: AppColors.primaryFixedDim, width: 2),
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://lh3.googleusercontent.com/aida-public/AB6AXuAq_jLtTY0KMzlTcihRRPC6cRzsKBwBxDhMSZJLI6tlmlgdYXZodJB6VwfgTa-O21kyIXoUDVM7tUBiYW4P4DIw8wy7kQ3U_PcMy3Cj-R9DUa9NMegYFj6xE3lnZdNebXU4VW2PC2_jh_v0E7JQAQ98AFtEM1geNXHK4JSPGi-0aJMZ70Ovc3clrspNV-_XvoUfxyDtFkSTl7ISd4GerXALBhOY8eMoWnbwzuuMEEU0l-6ZapvEJ1bBfqyESKRjkHYalHFjjeR7a-ZR'),
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
          children: [
            // Profile Hero Section
            Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 96,
                      height: 96,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.surfaceContainerLowest, width: 4),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryContainer.withValues(alpha: 0.08),
                            blurRadius: 24,
                            offset: const Offset(0, 8),
                          ),
                        ],
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://lh3.googleusercontent.com/aida-public/AB6AXuBDRai8WdE6sCcAMo8WPTlVLdFbmUzwIa0UoOHMtfeq8-L2Wn9ddKE8djAfgkKsFi-rTMMDgeTBIIJy3zhYGbYqah-9sEvcja088Rzy0VsrTFW5dF2wb666gBcajPLCKlLW5jLBe1qOrBAS73U2RBONd5KSU3s4TTWz7qEHprUXTL_pgCr0F8luvJqYNKY9dsGCZAqO3eh8OcvobELolenJrB-hn6hlgGjstrIi1GfGtGiPG-0mRN75Pz76FMdt8ID8wSm6lT9pzmyJ'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryContainer.withValues(alpha: 0.08),
                              blurRadius: 24,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: const Icon(Icons.edit, color: AppColors.onPrimary, size: 16),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text('Alex Thompson', style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 28)),
                const SizedBox(height: 4),
                Text('Home Brewer since 2021', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.onSurfaceVariant)),
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
                        child: const Icon(Icons.my_location, color: AppColors.onSecondaryContainer),
                      ),
                      const SizedBox(width: 12),
                      Text('Daily Goal', style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 14)),
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
                          color: AppColors.primaryContainer.withValues(alpha: 0.08),
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
                            if (_dailyGoal > 0) setState(() => _dailyGoal--);
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: AppColors.secondaryContainer,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.remove, color: AppColors.onSecondaryContainer),
                          ),
                        ),
                        Column(
                          children: [
                            Text('$_dailyGoal', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.primary)),
                            Text('cups/day', style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.onSurfaceVariant)),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() => _dailyGoal++);
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: AppColors.secondaryContainer,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.add, color: AppColors.onSecondaryContainer),
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
                            child: const Icon(Icons.notifications, color: AppColors.onSecondaryContainer),
                          ),
                          const SizedBox(width: 12),
                          Text('Reminders', style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 14)),
                        ],
                      ),
                      Switch(
                        value: _remindersEnabled,
                        onChanged: (val) => setState(() => _remindersEnabled = val),
                        activeThumbColor: AppColors.onPrimary,
                        activeTrackColor: AppColors.primaryContainer,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Receive smart prompts to log your brews and track caffeine metabolism.',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.onSurfaceVariant),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Coffee Type Favorites Card
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
                            child: const Icon(Icons.favorite, color: AppColors.onSecondaryContainer),
                          ),
                          const SizedBox(width: 12),
                          Text('Coffee Type Favorites', style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 14)),
                        ],
                      ),
                      Text(
                        'Edit All',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppColors.primary,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildTag('V60 Pour Over', Icons.water_drop, true),
                      _buildTag('Espresso', Icons.coffee_maker, false),
                      _buildTag('Cold Brew', Icons.ac_unit, false),
                      _buildTag('Add New', Icons.add, false),
                    ],
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
                    child: const Icon(Icons.download, color: AppColors.onPrimary),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Export Data', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.onPrimary, fontSize: 14)),
                        Text('Download brew history as CSV', style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.onPrimary.withValues(alpha: 0.7))),
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
            _buildListItem(Icons.logout, 'Log Out', true),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String label, IconData icon, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : AppColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(32),
        border: isActive ? null : Border.all(color: const Color(0xFFE0D4C0)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: isActive ? AppColors.onPrimary : AppColors.onSurfaceVariant),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isActive ? AppColors.onPrimary : AppColors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(IconData icon, String label, bool isError) {
    return Container(
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
              Icon(icon, color: isError ? AppColors.error : AppColors.onSurfaceVariant),
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
            const Icon(Icons.chevron_right, color: AppColors.onSurfaceVariant),
        ],
      ),
    );
  }
}
