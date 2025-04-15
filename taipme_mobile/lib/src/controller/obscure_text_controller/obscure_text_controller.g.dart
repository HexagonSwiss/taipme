// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'obscure_text_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$obscureTextControllerHash() =>
    r'a08113432424e1f5c152f05d9ddc0a9a9c189d35';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ObscureTextController
    extends BuildlessAutoDisposeNotifier<bool> {
  late final String param;

  bool build(
    String param,
  );
}

/// See also [ObscureTextController].
@ProviderFor(ObscureTextController)
const obscureTextControllerProvider = ObscureTextControllerFamily();

/// See also [ObscureTextController].
class ObscureTextControllerFamily extends Family<bool> {
  /// See also [ObscureTextController].
  const ObscureTextControllerFamily();

  /// See also [ObscureTextController].
  ObscureTextControllerProvider call(
    String param,
  ) {
    return ObscureTextControllerProvider(
      param,
    );
  }

  @override
  ObscureTextControllerProvider getProviderOverride(
    covariant ObscureTextControllerProvider provider,
  ) {
    return call(
      provider.param,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'obscureTextControllerProvider';
}

/// See also [ObscureTextController].
class ObscureTextControllerProvider
    extends AutoDisposeNotifierProviderImpl<ObscureTextController, bool> {
  /// See also [ObscureTextController].
  ObscureTextControllerProvider(
    String param,
  ) : this._internal(
          () => ObscureTextController()..param = param,
          from: obscureTextControllerProvider,
          name: r'obscureTextControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$obscureTextControllerHash,
          dependencies: ObscureTextControllerFamily._dependencies,
          allTransitiveDependencies:
              ObscureTextControllerFamily._allTransitiveDependencies,
          param: param,
        );

  ObscureTextControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.param,
  }) : super.internal();

  final String param;

  @override
  bool runNotifierBuild(
    covariant ObscureTextController notifier,
  ) {
    return notifier.build(
      param,
    );
  }

  @override
  Override overrideWith(ObscureTextController Function() create) {
    return ProviderOverride(
      origin: this,
      override: ObscureTextControllerProvider._internal(
        () => create()..param = param,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        param: param,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ObscureTextController, bool>
      createElement() {
    return _ObscureTextControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ObscureTextControllerProvider && other.param == param;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, param.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ObscureTextControllerRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `param` of this provider.
  String get param;
}

class _ObscureTextControllerProviderElement
    extends AutoDisposeNotifierProviderElement<ObscureTextController, bool>
    with ObscureTextControllerRef {
  _ObscureTextControllerProviderElement(super.provider);

  @override
  String get param => (origin as ObscureTextControllerProvider).param;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
