// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brew_history_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(brewHistory)
final brewHistoryProvider = BrewHistoryProvider._();

final class BrewHistoryProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Brew>>,
          List<Brew>,
          FutureOr<List<Brew>>
        >
    with $FutureModifier<List<Brew>>, $FutureProvider<List<Brew>> {
  BrewHistoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'brewHistoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$brewHistoryHash();

  @$internal
  @override
  $FutureProviderElement<List<Brew>> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Brew>> create(Ref ref) {
    return brewHistory(ref);
  }
}

String _$brewHistoryHash() => r'd3e3f17729ad777d22b42e52f57e525aefd71184';
