import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../core/theme/app_colors.dart';
import '../providers/add_brew_provider.dart';

class BrewDetailsScreen extends ConsumerStatefulWidget {
  const BrewDetailsScreen({super.key});

  @override
  ConsumerState<BrewDetailsScreen> createState() => _BrewDetailsScreenState();
}

class _BrewDetailsScreenState extends ConsumerState<BrewDetailsScreen> {
  late String _selectedOrigin;
  late String _selectedRoast;
  late String _selectedMethod;

  @override
  void initState() {
    super.initState();
    final initialState = ref.read(addBrewWizardProvider);
    _selectedOrigin = initialState.origin;
    _selectedRoast = initialState.roastLevel;
    _selectedMethod = initialState.brewMethod;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: const Text('Brew Details'),
        actions: const [SizedBox(width: 48)], // Spacer for centering
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Step 2 of 3', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.onSurfaceVariant)),
                Text('Configuration', style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.primary)),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: 0.666,
              backgroundColor: AppColors.surfaceVariant,
              color: AppColors.onTertiaryContainer,
              minHeight: 8,
              borderRadius: BorderRadius.circular(4),
            ),
            const SizedBox(height: 32),

            // Coffee Origin
            Text('Coffee Origin', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.primary)),
            const SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.8,
              children: [
                _buildOriginCard('Ethiopia', 'Floral & Citrus'),
                _buildOriginCard('Brazil', 'Nutty & Chocolate'),
                _buildOriginCard('Colombia', 'Balanced & Fruity'),
                _buildOriginCard('Guatemala', 'Spicy & Smoky'),
              ],
            ),
            const SizedBox(height: 32),

            // Roast Level
            Text('Roast Level', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.primary)),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildRoastChip('Light'),
                  const SizedBox(width: 8),
                  _buildRoastChip('Medium'),
                  const SizedBox(width: 8),
                  _buildRoastChip('Dark'),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Brew Method
            Text('Brew Method', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.primary)),
            const SizedBox(height: 16),
            Column(
              children: [
                _buildMethodRadio('v60', 'V60', 'Clean and bright pour-over', Icons.coffee_maker),
                const SizedBox(height: 8),
                _buildMethodRadio('french_press', 'French Press', 'Full-bodied and immersive', Icons.filter_list),
                const SizedBox(height: 8),
                _buildMethodRadio('aeropress', 'AeroPress', 'Versatile and travel-friendly', Icons.vibration),
                const SizedBox(height: 8),
                _buildMethodRadio('moka_pot', 'Moka Pot', 'Rich and espresso-like', Icons.local_fire_department),
              ],
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(20).copyWith(bottom: MediaQuery.of(context).padding.bottom + 20),
        decoration: BoxDecoration(
          color: AppColors.surface.withValues(alpha: 0.8),
        ),
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              ref.read(addBrewWizardProvider.notifier).updateDetails(
                origin: _selectedOrigin,
                roastLevel: _selectedRoast,
                brewMethod: _selectedMethod,
              );
              context.push('/add_drink/review');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryContainer,
              foregroundColor: AppColors.onPrimary,
              elevation: 4,
            ),
            child: const Text('Continue', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ),
        ),
      ),
    );
  }

  Widget _buildOriginCard(String title, String subtitle) {
    bool isSelected = _selectedOrigin == title;
    return GestureDetector(
      onTap: () => setState(() => _selectedOrigin = title),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryContainer : AppColors.surfaceContainerLow,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primaryContainer : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: isSelected ? AppColors.onPrimary : AppColors.primary,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: isSelected ? AppColors.onPrimaryContainer : AppColors.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoastChip(String label) {
    bool isSelected = _selectedRoast == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedRoast = label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryContainer : AppColors.secondaryFixed,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected ? AppColors.onPrimary : AppColors.onSecondaryFixed,
          ),
        ),
      ),
    );
  }

  Widget _buildMethodRadio(String value, String title, String subtitle, IconData icon) {
    bool isSelected = _selectedMethod == value;
    return GestureDetector(
      onTap: () => setState(() => _selectedMethod = value),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.outlineVariant),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.surfaceContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: AppColors.primary),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: AppColors.primary)),
                  Text(subtitle, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: AppColors.onSurfaceVariant)),
                ],
              ),
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primaryContainer : AppColors.outlineVariant,
                  width: 2,
                ),
                color: isSelected ? AppColors.primary : Colors.transparent,
              ),
              child: isSelected
                  ? Center(child: Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle)))
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
