import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../models/brew.dart';
import 'repository_provider.dart';
import 'brew_history_provider.dart';
import '../core/utils/logger.dart';

part 'add_brew_provider.freezed.dart';
part 'add_brew_provider.g.dart';

@freezed
abstract class AddBrewState with _$AddBrewState {
  const factory AddBrewState({
    @Default('') String name,
    @Default(3.0) double strength,
    @Default('240ml') String volume,
    @Default(false) bool isMilkBased,
    @Default('Ethiopia') String origin,
    @Default('Medium') String roastLevel,
    @Default('v60') String brewMethod,
  }) = _AddBrewState;
}

@riverpod
class AddBrewWizard extends _$AddBrewWizard {
  @override
  AddBrewState build() {
    return const AddBrewState();
  }

  void updateDrink({
    required String name,
    required double strength,
    required String volume,
    required bool isMilkBased,
  }) {
    state = state.copyWith(
      name: name,
      strength: strength,
      volume: volume,
      isMilkBased: isMilkBased,
    );
  }

  void updateDetails({
    required String origin,
    required String roastLevel,
    required String brewMethod,
  }) {
    state = state.copyWith(
      origin: origin,
      roastLevel: roastLevel,
      brewMethod: brewMethod,
    );
  }

  int calculateCaffeine() {
    // Basic dynamic calculation based on volume, strength and method
    int volumeMl = 240;
    if (state.volume.toLowerCase().endsWith('ml')) {
      final parsed = int.tryParse(state.volume.replaceAll(RegExp(r'[^0-9]'), ''));
      if (parsed != null) volumeMl = parsed;
    } else if (state.volume == 'Custom') {
      volumeMl = 240;
    }

    // Base caffeine: ~40mg per 100ml
    double baseCaffeine = (volumeMl / 100.0) * 40;

    // Strength multiplier: strength 1..5 maps to 0.6 .. 1.4
    double strengthMultiplier = 1.0 + ((state.strength - 3) * 0.2);

    // Method multiplier
    double methodMultiplier = 1.0;
    if (state.brewMethod == 'moka_pot' || state.brewMethod.contains('espresso')) {
      methodMultiplier = 1.3;
    } else if (state.brewMethod == 'aeropress') {
      methodMultiplier = 1.1;
    }

    return (baseCaffeine * strengthMultiplier * methodMultiplier).round();
  }

  Future<void> logBrew() async {
    final caffeine = calculateCaffeine();
    
    final brew = Brew(
      id: const Uuid().v4(),
      name: state.name.isEmpty ? 'Custom Drink' : state.name,
      strength: state.strength.toInt(),
      volume: state.volume,
      isMilkBased: state.isMilkBased,
      origin: state.origin,
      roastLevel: state.roastLevel,
      brewMethod: state.brewMethod,
      caffeine: caffeine,
      createdAt: DateTime.now(),
    );

    final repo = ref.read(brewRepositoryProvider);
    try {
      await repo.addBrew(brew);
      talker.info('AddBrewWizard: Brew logged successfully');
    } catch (e, st) {
      talker.handle(e, st, 'AddBrewWizard: Failed to log brew');
      rethrow;
    }
    
    // Invalidate state to start fresh next time
    ref.invalidateSelf();
    // Invalidate history so Home screen updates
    ref.invalidate(brewHistoryProvider);
  }
}
