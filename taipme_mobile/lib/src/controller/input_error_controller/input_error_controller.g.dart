// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input_error_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$inputErrorControllerHash() =>
    r'3598573c3d0e0e649f37cd75e0446df882cc57c5';

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

abstract class _$InputErrorController
    extends BuildlessAutoDisposeNotifier<String?> {
  late final String param;

  String? build(
    String param,
  );
}

/// See also [InputErrorController].
@ProviderFor(InputErrorController)
const inputErrorControllerProvider = InputErrorControllerFamily();

/// See also [InputErrorController].
class InputErrorControllerFamily extends Family<String?> {
  /// See also [InputErrorController].
  const InputErrorControllerFamily();

  /// See also [InputErrorController].
  InputErrorControllerProvider call(
    String param,
  ) {
    return InputErrorControllerProvider(
      param,
    );
  }

  @override
  InputErrorControllerProvider getProviderOverride(
    covariant InputErrorControllerProvider provider,
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
  String? get name => r'inputErrorControllerProvider';
}

/// See also [InputErrorController].
class InputErrorControllerProvider
    extends AutoDisposeNotifierProviderImpl<InputErrorController, String?> {
  /// See also [InputErrorController].
  InputErrorControllerProvider(
    String param,
  ) : this._internal(
          () => InputErrorController()..param = param,
          from: inputErrorControllerProvider,
          name: r'inputErrorControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$inputErrorControllerHash,
          dependencies: InputErrorControllerFamily._dependencies,
          allTransitiveDependencies:
              InputErrorControllerFamily._allTransitiveDependencies,
          param: param,
        );

  InputErrorControllerProvider._internal(
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
  String? runNotifierBuild(
    covariant InputErrorController notifier,
  ) {
    return notifier.build(
      param,
    );
  }

  @override
  Override overrideWith(InputErrorController Function() create) {
    return ProviderOverride(
      origin: this,
      override: InputErrorControllerProvider._internal(
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
  AutoDisposeNotifierProviderElement<InputErrorController, String?>
      createElement() {
    return _InputErrorControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InputErrorControllerProvider && other.param == param;
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
mixin InputErrorControllerRef on AutoDisposeNotifierProviderRef<String?> {
  /// The parameter `param` of this provider.
  String get param;
}

class _InputErrorControllerProviderElement
    extends AutoDisposeNotifierProviderElement<InputErrorController, String?>
    with InputErrorControllerRef {
  _InputErrorControllerProviderElement(super.provider);

  @override
  String get param => (origin as InputErrorControllerProvider).param;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
