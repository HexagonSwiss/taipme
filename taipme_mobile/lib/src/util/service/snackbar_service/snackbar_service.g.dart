// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snackbar_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$snackBarServiceHash() => r'02f3eeca7391c70bc0d13148299f5a0a96394cc4';

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

/// See also [snackBarService].
@ProviderFor(snackBarService)
const snackBarServiceProvider = SnackBarServiceFamily();

/// See also [snackBarService].
class SnackBarServiceFamily extends Family<AsyncValue<SnackBarClosedReason>> {
  /// See also [snackBarService].
  const SnackBarServiceFamily();

  /// See also [snackBarService].
  SnackBarServiceProvider call({
    required String text,
    Duration duration = const Duration(seconds: 3),
    bool successOrFail = false,
    BuildContext? contextFromParameter,
  }) {
    return SnackBarServiceProvider(
      text: text,
      duration: duration,
      successOrFail: successOrFail,
      contextFromParameter: contextFromParameter,
    );
  }

  @override
  SnackBarServiceProvider getProviderOverride(
    covariant SnackBarServiceProvider provider,
  ) {
    return call(
      text: provider.text,
      duration: provider.duration,
      successOrFail: provider.successOrFail,
      contextFromParameter: provider.contextFromParameter,
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
  String? get name => r'snackBarServiceProvider';
}

/// See also [snackBarService].
class SnackBarServiceProvider
    extends AutoDisposeFutureProvider<SnackBarClosedReason> {
  /// See also [snackBarService].
  SnackBarServiceProvider({
    required String text,
    Duration duration = const Duration(seconds: 3),
    bool successOrFail = false,
    BuildContext? contextFromParameter,
  }) : this._internal(
          (ref) => snackBarService(
            ref as SnackBarServiceRef,
            text: text,
            duration: duration,
            successOrFail: successOrFail,
            contextFromParameter: contextFromParameter,
          ),
          from: snackBarServiceProvider,
          name: r'snackBarServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$snackBarServiceHash,
          dependencies: SnackBarServiceFamily._dependencies,
          allTransitiveDependencies:
              SnackBarServiceFamily._allTransitiveDependencies,
          text: text,
          duration: duration,
          successOrFail: successOrFail,
          contextFromParameter: contextFromParameter,
        );

  SnackBarServiceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.text,
    required this.duration,
    required this.successOrFail,
    required this.contextFromParameter,
  }) : super.internal();

  final String text;
  final Duration duration;
  final bool successOrFail;
  final BuildContext? contextFromParameter;

  @override
  Override overrideWith(
    FutureOr<SnackBarClosedReason> Function(SnackBarServiceRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SnackBarServiceProvider._internal(
        (ref) => create(ref as SnackBarServiceRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        text: text,
        duration: duration,
        successOrFail: successOrFail,
        contextFromParameter: contextFromParameter,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<SnackBarClosedReason> createElement() {
    return _SnackBarServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SnackBarServiceProvider &&
        other.text == text &&
        other.duration == duration &&
        other.successOrFail == successOrFail &&
        other.contextFromParameter == contextFromParameter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, text.hashCode);
    hash = _SystemHash.combine(hash, duration.hashCode);
    hash = _SystemHash.combine(hash, successOrFail.hashCode);
    hash = _SystemHash.combine(hash, contextFromParameter.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SnackBarServiceRef on AutoDisposeFutureProviderRef<SnackBarClosedReason> {
  /// The parameter `text` of this provider.
  String get text;

  /// The parameter `duration` of this provider.
  Duration get duration;

  /// The parameter `successOrFail` of this provider.
  bool get successOrFail;

  /// The parameter `contextFromParameter` of this provider.
  BuildContext? get contextFromParameter;
}

class _SnackBarServiceProviderElement
    extends AutoDisposeFutureProviderElement<SnackBarClosedReason>
    with SnackBarServiceRef {
  _SnackBarServiceProviderElement(super.provider);

  @override
  String get text => (origin as SnackBarServiceProvider).text;
  @override
  Duration get duration => (origin as SnackBarServiceProvider).duration;
  @override
  bool get successOrFail => (origin as SnackBarServiceProvider).successOrFail;
  @override
  BuildContext? get contextFromParameter =>
      (origin as SnackBarServiceProvider).contextFromParameter;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
