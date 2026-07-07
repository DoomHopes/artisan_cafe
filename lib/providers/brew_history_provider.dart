import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/brew.dart';
import 'repository_provider.dart';

part 'brew_history_provider.g.dart';

@riverpod
Future<List<Brew>> brewHistory(Ref ref) async {
  final repo = ref.watch(brewRepositoryProvider);
  return await repo.getBrews();
}
