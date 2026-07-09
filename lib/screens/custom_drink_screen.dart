import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:artisan_cafe/core/extensions/context_extensions.dart';
import '../core/theme/app_colors.dart';
import '../core/constants/app_images.dart';
import '../providers/add_brew_provider.dart';

class CustomDrinkScreen extends ConsumerStatefulWidget {
  const CustomDrinkScreen({super.key});

  @override
  ConsumerState<CustomDrinkScreen> createState() => _CustomDrinkScreenState();
}

class _CustomDrinkScreenState extends ConsumerState<CustomDrinkScreen> {
  late final TextEditingController _nameController;
  late double _strength;
  late String _selectedVolume;
  late bool _isMilkBased;

  @override
  void initState() {
    super.initState();
    final initialState = ref.read(addBrewWizardProvider);
    _nameController = TextEditingController(text: initialState.name);
    _strength = initialState.strength;
    _selectedVolume = initialState.volume;
    _isMilkBased = initialState.isMilkBased;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: Text(l10n.customDrinkTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            color: AppColors.primary.withValues(alpha: 0.4),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Visual
            Container(
              height: 192,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
                image: const DecorationImage(
                  image: NetworkImage(AppImages.customDrinkBg),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.4),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    child: Text(
                      l10n.craftRecipe,
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Drink Name
            Text(
              l10n.drinkName,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: AppColors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: l10n.drinkNameHint,
                hintStyle: TextStyle(
                  color: AppColors.onSurfaceVariant.withValues(alpha: 0.5),
                ),
                filled: true,
                fillColor: AppColors.surfaceContainerLowest,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: AppColors.outlineVariant,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: AppColors.tertiaryContainer,
                    width: 2,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Strength Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.strength,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: AppColors.onSurfaceVariant,
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
                    [
                      l10n.strengthSubtle,
                      l10n.strengthLight,
                      l10n.strengthModerate,
                      l10n.strengthBold,
                      l10n.strengthExtraStrong,
                    ][_strength.toInt() - 1],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.onSecondaryContainer,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SliderTheme(
              data: SliderThemeData(
                activeTrackColor: AppColors.outlineVariant,
                inactiveTrackColor: AppColors.outlineVariant,
                thumbColor: AppColors.primaryContainer,
                trackHeight: 8,
              ),
              child: Slider(
                value: _strength,
                min: 1,
                max: 5,
                divisions: 4,
                onChanged: (val) => setState(() => _strength = val),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.strengthMildLabel,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.onSurfaceVariant.withValues(alpha: 0.6),
                  ),
                ),
                Text(
                  l10n.strengthStrongLabel,
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.onSurfaceVariant.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Volume Chips
            Text(
              l10n.volumeMl,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: AppColors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildVolumeChip('240ml'),
                _buildVolumeChip('350ml'),
                _buildVolumeChip('470ml'),
                _buildVolumeChip(l10n.volumeCustom),
              ],
            ),
            const SizedBox(height: 24),

            // Milk Toggle
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLow,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.outlineVariant.withValues(alpha: 0.3),
                ),
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
                          Icons.opacity,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.milkBased,
                            style: Theme.of(context).textTheme.labelMedium
                                ?.copyWith(color: AppColors.onSurface),
                          ),
                          Text(
                            l10n.milkBasedDesc,
                            style: Theme.of(context).textTheme.labelSmall
                                ?.copyWith(color: AppColors.onSurfaceVariant),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Switch(
                    value: _isMilkBased,
                    onChanged: (val) => setState(() => _isMilkBased = val),
                    activeThumbColor: AppColors.onPrimary,
                    activeTrackColor: AppColors.primaryContainer,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 100), // Spacing for bottom button
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(
          20,
        ).copyWith(bottom: MediaQuery.of(context).padding.bottom + 20),
        decoration: const BoxDecoration(color: AppColors.surfaceContainerLow),
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              ref
                  .read(addBrewWizardProvider.notifier)
                  .updateDrink(
                    name: _nameController.text.trim(),
                    strength: _strength,
                    volume: _selectedVolume,
                    isMilkBased: _isMilkBased,
                  );
              context.push('/add_drink/details');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryContainer,
              foregroundColor: AppColors.onPrimary,
              elevation: 4,
            ),
            child: Text(
              l10n.continueButton,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVolumeChip(String label) {
    bool isSelected = _selectedVolume == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedVolume = label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryContainer : Colors.transparent,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.outlineVariant,
            width: 2,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isSelected
                ? AppColors.onPrimary
                : AppColors.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
