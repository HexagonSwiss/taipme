// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$routeControllerHash() => r'1fabf986e7070200d14f7960e1a53a467e2538ce';

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
    String? backupRoute,
    bool requiresAuth = false,
  }) {
    return RouteControllerProvider(
      backupRoute: backupRoute,
      requiresAuth: requiresAuth,
    );
  }

  @override
  RouteControllerProvider getProviderOverride(
    covariant RouteControllerProvider provider,
  ) {
    return call(
      backupRoute: provider.backupRoute,
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
    String? backupRoute,
    bool requiresAuth = false,
  }) : this._internal(
          (ref) => routeController(
            ref as RouteControllerRef,
            backupRoute: backupRoute,
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
          backupRoute: backupRoute,
          requiresAuth: requiresAuth,
        );

  RouteControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.backupRoute,
    required this.requiresAuth,
  }) : super.internal();

  final String? backupRoute;
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
        backupRoute: backupRoute,
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
        other.backupRoute == backupRoute &&
        other.requiresAuth == requiresAuth;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, backupRoute.hashCode);
    hash = _SystemHash.combine(hash, requiresAuth.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RouteControllerRef on AutoDisposeFutureProviderRef<String?> {
  /// The parameter `backupRoute` of this provider.
  String? get backupRoute;

  /// The parameter `requiresAuth` of this provider.
  bool get requiresAuth;
}

class _RouteControllerProviderElement
    extends AutoDisposeFutureProviderElement<String?> with RouteControllerRef {
  _RouteControllerProviderElement(super.provider);

  @override
  String? get backupRoute => (origin as RouteControllerProvider).backupRoute;
  @override
  bool get requiresAuth => (origin as RouteControllerProvider).requiresAuth;
}

String _$loginOrRegisterRouteControllerHash() =>
    r'5d374fdab2331f41f656c5b3bf02a7110d3006e6';

/// See also [loginOrRegisterRouteController].
@ProviderFor(loginOrRegisterRouteController)
final loginOrRegisterRouteControllerProvider =
    AutoDisposeFutureProvider<String?>.internal(
  loginOrRegisterRouteController,
  name: r'loginOrRegisterRouteControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loginOrRegisterRouteControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef LoginOrRegisterRouteControllerRef
    = AutoDisposeFutureProviderRef<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
