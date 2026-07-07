// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(brewRepository)
final brewRepositoryProvider = BrewRepositoryProvider._();

final class BrewRepositoryProvider
    extends $FunctionalProvider<BrewRepository, BrewRepository, BrewRepository>
    with $Provider<BrewRepository> {
  BrewRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'brewRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$brewRepositoryHash();

  @$internal
  @override
  $ProviderElement<BrewRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BrewRepository create(Ref ref) {
    return brewRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BrewRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BrewRepository>(value),
    );
  }
}

String _$brewRepositoryHash() => r'3a1c8563f25386f4abd9d1d254191fd679305b7d';
