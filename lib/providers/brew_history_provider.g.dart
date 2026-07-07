// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brew_history_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BrewHistory)
final brewHistoryProvider = BrewHistoryProvider._();

final class BrewHistoryProvider
    extends $NotifierProvider<BrewHistory, List<Brew>> {
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
  BrewHistory create() => BrewHistory();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Brew> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Brew>>(value),
    );
  }
}

String _$brewHistoryHash() => r'c9a219f721f394f1c378d74abd0f96e37b509c66';

abstract class _$BrewHistory extends $Notifier<List<Brew>> {
  List<Brew> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<List<Brew>, List<Brew>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<Brew>, List<Brew>>,
              List<Brew>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
