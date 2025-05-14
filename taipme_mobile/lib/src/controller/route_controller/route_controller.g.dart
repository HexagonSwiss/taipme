// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routeControllerHash() => r'b109a545cd85821b36843d372b569fecd43db412';

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

/// See also [routeController].
@ProviderFor(routeController)
const routeControllerProvider = RouteControllerFamily();

/// See also [routeController].
class RouteControllerFamily extends Family<AsyncValue<String?>> {
  /// See also [routeController].
  const RouteControllerFamily();

  /// See also [routeController].
  RouteControllerProvider call({
    bool requiresAuth = true,
  }) {
    return RouteControllerProvider(
      requiresAuth: requiresAuth,
    );
  }

  @override
  RouteControllerProvider getProviderOverride(
    covariant RouteControllerProvider provider,
  ) {
    return call(
      requiresAuth: provider.requiresAuth,
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
  String? get name => r'routeControllerProvider';
}

/// See also [routeController].
class RouteControllerProvider extends AutoDisposeFutureProvider<String?> {
  /// See also [routeController].
  RouteControllerProvider({
    bool requiresAuth = true,
  }) : this._internal(
          (ref) => routeController(
            ref as RouteControllerRef,
            requiresAuth: requiresAuth,
          ),
          from: routeControllerProvider,
          name: r'routeControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$routeControllerHash,
          dependencies: RouteControllerFamily._dependencies,
          allTransitiveDependencies:
              RouteControllerFamily._allTransitiveDependencies,
          requiresAuth: requiresAuth,
        );

  RouteControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.requiresAuth,
  }) : super.internal();

  final bool requiresAuth;

  @override
  Override overrideWith(
    FutureOr<String?> Function(RouteControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RouteControllerProvider._internal(
        (ref) => create(ref as RouteControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        requiresAuth: requiresAuth,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String?> createElement() {
    return _RouteControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RouteControllerProvider &&
        other.requiresAuth == requiresAuth;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, requiresAuth.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RouteControllerRef on AutoDisposeFutureProviderRef<String?> {
  /// The parameter `requiresAuth` of this provider.
  bool get requiresAuth;
}

class _RouteControllerProviderElement
    extends AutoDisposeFutureProviderElement<String?> with RouteControllerRef {
  _RouteControllerProviderElement(super.provider);

  @override
  bool get requiresAuth => (origin as RouteControllerProvider).requiresAuth;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
