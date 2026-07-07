import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/brew.dart';

part 'brew_history_provider.g.dart';

@riverpod
class BrewHistory extends _$BrewHistory {
  @override
  List<Brew> build() {
    return [];
  }

  void addBrew(Brew brew) {
    state = [brew, ...state];
  }

  void removeBrew(String id) {
    state = state.where((b) => b.id != id).toList();
  }
}
