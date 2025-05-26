// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paper_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchUserPapersSummaryHash() =>
    r'60de15739162a72ae0ce0a00bc6333544ac258ef';

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
String _$fetchPaperContentHash() => r'148e119b15038efcf600948f90fe60dc241be403';

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

String _$userPapersSummarySyncControllerHash() =>
    r'5a4e77e688f4a3c3c08cc3b66ee32bd4c78235db';

/// See also [UserPapersSummarySyncController].
@ProviderFor(UserPapersSummarySyncController)
final userPapersSummarySyncControllerProvider = NotifierProvider<
    UserPapersSummarySyncController, PapersSummaryModel?>.internal(
  UserPapersSummarySyncController.new,
  name: r'userPapersSummarySyncControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userPapersSummarySyncControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserPapersSummarySyncController = Notifier<PapersSummaryModel?>;
String _$paperContentSyncControllerHash() =>
    r'87093328a717974f0d4b57a064af3169ef53bc42';

/// See also [PaperContentSyncController].
@ProviderFor(PaperContentSyncController)
final paperContentSyncControllerProvider = NotifierProvider<
    PaperContentSyncController, Map<int, PaperContentModel?>>.internal(
  PaperContentSyncController.new,
  name: r'paperContentSyncControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$paperContentSyncControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PaperContentSyncController = Notifier<Map<int, PaperContentModel?>>;
String _$currentPaperIdHash() => r'96136354aa8a6060311b685fd402ab038ccfe654';

/// See also [CurrentPaperId].
@ProviderFor(CurrentPaperId)
final currentPaperIdProvider =
    AutoDisposeNotifierProvider<CurrentPaperId, int>.internal(
  CurrentPaperId.new,
  name: r'currentPaperIdProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentPaperIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentPaperId = AutoDisposeNotifier<int>;
String _$paperActionsControllerHash() =>
    r'ab18521a0163b3af2736a86be6f7c4490962e310';

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
