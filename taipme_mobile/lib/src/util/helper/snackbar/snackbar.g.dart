// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snackbar.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$snackBarHash() => r'db7d8072ba7b4b9f64dc876cab68f02b8a278b38';

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

/// See also [snackBar].
@ProviderFor(snackBar)
const snackBarProvider = SnackBarFamily();

/// See also [snackBar].
class SnackBarFamily extends Family<AsyncValue<SnackBarClosedReason?>> {
  /// See also [snackBar].
  const SnackBarFamily();

  /// See also [snackBar].
  SnackBarProvider call({
    required String text,
    Duration duration = const Duration(seconds: 3),
    bool successOrFail = false,
    BuildContext? contextFromParameter,
  }) {
    return SnackBarProvider(
      text: text,
      duration: duration,
      successOrFail: successOrFail,
      contextFromParameter: contextFromParameter,
    );
  }

  @override
  SnackBarProvider getProviderOverride(
    covariant SnackBarProvider provider,
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
  String? get name => r'snackBarProvider';
}

/// See also [snackBar].
class SnackBarProvider
    extends AutoDisposeFutureProvider<SnackBarClosedReason?> {
  /// See also [snackBar].
  SnackBarProvider({
    required String text,
    Duration duration = const Duration(seconds: 3),
    bool successOrFail = false,
    BuildContext? contextFromParameter,
  }) : this._internal(
          (ref) => snackBar(
            ref as SnackBarRef,
            text: text,
            duration: duration,
            successOrFail: successOrFail,
            contextFromParameter: contextFromParameter,
          ),
          from: snackBarProvider,
          name: r'snackBarProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$snackBarHash,
          dependencies: SnackBarFamily._dependencies,
          allTransitiveDependencies: SnackBarFamily._allTransitiveDependencies,
          text: text,
          duration: duration,
          successOrFail: successOrFail,
          contextFromParameter: contextFromParameter,
        );

  SnackBarProvider._internal(
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
    FutureOr<SnackBarClosedReason?> Function(SnackBarRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SnackBarProvider._internal(
        (ref) => create(ref as SnackBarRef),
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
  AutoDisposeFutureProviderElement<SnackBarClosedReason?> createElement() {
    return _SnackBarProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SnackBarProvider &&
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
mixin SnackBarRef on AutoDisposeFutureProviderRef<SnackBarClosedReason?> {
  /// The parameter `text` of this provider.
  String get text;

  /// The parameter `duration` of this provider.
  Duration get duration;

  /// The parameter `successOrFail` of this provider.
  bool get successOrFail;

  /// The parameter `contextFromParameter` of this provider.
  BuildContext? get contextFromParameter;
}

class _SnackBarProviderElement
    extends AutoDisposeFutureProviderElement<SnackBarClosedReason?>
    with SnackBarRef {
  _SnackBarProviderElement(super.provider);

  @override
  String get text => (origin as SnackBarProvider).text;
  @override
  Duration get duration => (origin as SnackBarProvider).duration;
  @override
  bool get successOrFail => (origin as SnackBarProvider).successOrFail;
  @override
  BuildContext? get contextFromParameter =>
      (origin as SnackBarProvider).contextFromParameter;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
