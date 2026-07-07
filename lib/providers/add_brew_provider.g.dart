// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_brew_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AddBrewWizard)
final addBrewWizardProvider = AddBrewWizardProvider._();

final class AddBrewWizardProvider
    extends $NotifierProvider<AddBrewWizard, AddBrewState> {
  AddBrewWizardProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addBrewWizardProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addBrewWizardHash();

  @$internal
  @override
  AddBrewWizard create() => AddBrewWizard();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddBrewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddBrewState>(value),
    );
  }
}

String _$addBrewWizardHash() => r'67321e0ec624d45cfd154aeb534722d8cb36cf16';

abstract class _$AddBrewWizard extends $Notifier<AddBrewState> {
  AddBrewState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AddBrewState, AddBrewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AddBrewState, AddBrewState>,
              AddBrewState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
