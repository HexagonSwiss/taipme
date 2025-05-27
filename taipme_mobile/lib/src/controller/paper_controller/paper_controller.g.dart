// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paper_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchUserPapersSummaryHash() =>
    r'd1a9f6ad2e9c128066dbf70a88d1df43d0ce8330';

/// See also [fetchUserPapersSummary].
@ProviderFor(fetchUserPapersSummary)
final fetchUserPapersSummaryProvider =
    AutoDisposeFutureProvider<PapersSummaryModel>.internal(
  fetchUserPapersSummary,
  name: r'fetchUserPapersSummaryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchUserPapersSummaryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FetchUserPapersSummaryRef
    = AutoDisposeFutureProviderRef<PapersSummaryModel>;
String _$fetchPaperContentHash() => r'e0bd10b79b6c3bb890b3fd86810cea0b15f71836';

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

/// See also [fetchPaperContent].
@ProviderFor(fetchPaperContent)
const fetchPaperContentProvider = FetchPaperContentFamily();

/// See also [fetchPaperContent].
class FetchPaperContentFamily extends Family<AsyncValue<PaperContentModel>> {
  /// See also [fetchPaperContent].
  const FetchPaperContentFamily();

  /// See also [fetchPaperContent].
  FetchPaperContentProvider call(
    int paperId,
  ) {
    return FetchPaperContentProvider(
      paperId,
    );
  }

  @override
  FetchPaperContentProvider getProviderOverride(
    covariant FetchPaperContentProvider provider,
  ) {
    return call(
      provider.paperId,
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
  String? get name => r'fetchPaperContentProvider';
}

/// See also [fetchPaperContent].
class FetchPaperContentProvider
    extends AutoDisposeFutureProvider<PaperContentModel> {
  /// See also [fetchPaperContent].
  FetchPaperContentProvider(
    int paperId,
  ) : this._internal(
          (ref) => fetchPaperContent(
            ref as FetchPaperContentRef,
            paperId,
          ),
          from: fetchPaperContentProvider,
          name: r'fetchPaperContentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchPaperContentHash,
          dependencies: FetchPaperContentFamily._dependencies,
          allTransitiveDependencies:
              FetchPaperContentFamily._allTransitiveDependencies,
          paperId: paperId,
        );

  FetchPaperContentProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.paperId,
  }) : super.internal();

  final int paperId;

  @override
  Override overrideWith(
    FutureOr<PaperContentModel> Function(FetchPaperContentRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchPaperContentProvider._internal(
        (ref) => create(ref as FetchPaperContentRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        paperId: paperId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PaperContentModel> createElement() {
    return _FetchPaperContentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchPaperContentProvider && other.paperId == paperId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, paperId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchPaperContentRef on AutoDisposeFutureProviderRef<PaperContentModel> {
  /// The parameter `paperId` of this provider.
  int get paperId;
}

class _FetchPaperContentProviderElement
    extends AutoDisposeFutureProviderElement<PaperContentModel>
    with FetchPaperContentRef {
  _FetchPaperContentProviderElement(super.provider);

  @override
  int get paperId => (origin as FetchPaperContentProvider).paperId;
}

String _$currentPaperIdHash() => r'657dbf1d9c130d050d4d634aed33ea5625835e86';

abstract class _$CurrentPaperId extends BuildlessAutoDisposeNotifier<int> {
  late final PapersSummaryModel summaryData;

  int build(
    PapersSummaryModel summaryData,
  );
}

/// See also [CurrentPaperId].
@ProviderFor(CurrentPaperId)
const currentPaperIdProvider = CurrentPaperIdFamily();

/// See also [CurrentPaperId].
class CurrentPaperIdFamily extends Family<int> {
  /// See also [CurrentPaperId].
  const CurrentPaperIdFamily();

  /// See also [CurrentPaperId].
  CurrentPaperIdProvider call(
    PapersSummaryModel summaryData,
  ) {
    return CurrentPaperIdProvider(
      summaryData,
    );
  }

  @override
  CurrentPaperIdProvider getProviderOverride(
    covariant CurrentPaperIdProvider provider,
  ) {
    return call(
      provider.summaryData,
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
  String? get name => r'currentPaperIdProvider';
}

/// See also [CurrentPaperId].
class CurrentPaperIdProvider
    extends AutoDisposeNotifierProviderImpl<CurrentPaperId, int> {
  /// See also [CurrentPaperId].
  CurrentPaperIdProvider(
    PapersSummaryModel summaryData,
  ) : this._internal(
          () => CurrentPaperId()..summaryData = summaryData,
          from: currentPaperIdProvider,
          name: r'currentPaperIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$currentPaperIdHash,
          dependencies: CurrentPaperIdFamily._dependencies,
          allTransitiveDependencies:
              CurrentPaperIdFamily._allTransitiveDependencies,
          summaryData: summaryData,
        );

  CurrentPaperIdProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.summaryData,
  }) : super.internal();

  final PapersSummaryModel summaryData;

  @override
  int runNotifierBuild(
    covariant CurrentPaperId notifier,
  ) {
    return notifier.build(
      summaryData,
    );
  }

  @override
  Override overrideWith(CurrentPaperId Function() create) {
    return ProviderOverride(
      origin: this,
      override: CurrentPaperIdProvider._internal(
        () => create()..summaryData = summaryData,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        summaryData: summaryData,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CurrentPaperId, int> createElement() {
    return _CurrentPaperIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CurrentPaperIdProvider && other.summaryData == summaryData;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, summaryData.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CurrentPaperIdRef on AutoDisposeNotifierProviderRef<int> {
  /// The parameter `summaryData` of this provider.
  PapersSummaryModel get summaryData;
}

class _CurrentPaperIdProviderElement
    extends AutoDisposeNotifierProviderElement<CurrentPaperId, int>
    with CurrentPaperIdRef {
  _CurrentPaperIdProviderElement(super.provider);

  @override
  PapersSummaryModel get summaryData =>
      (origin as CurrentPaperIdProvider).summaryData;
}

String _$paperActionsControllerHash() =>
    r'6540b397decc105c1199691ca155f7ccff9d1952';

/// See also [PaperActionsController].
@ProviderFor(PaperActionsController)
final paperActionsControllerProvider =
    AutoDisposeNotifierProvider<PaperActionsController, void>.internal(
  PaperActionsController.new,
  name: r'paperActionsControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$paperActionsControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PaperActionsController = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
