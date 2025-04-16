// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'typing_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$clickCountHash() => r'48f9774585d28e5298409195ea3f59b99b7386b5';

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

abstract class _$ClickCount extends BuildlessAutoDisposeNotifier<int> {
  late final int maxCount;

  int build(
    int maxCount,
  );
}

/// See also [ClickCount].
@ProviderFor(ClickCount)
const clickCountProvider = ClickCountFamily();

/// See also [ClickCount].
class ClickCountFamily extends Family<int> {
  /// See also [ClickCount].
  const ClickCountFamily();

  /// See also [ClickCount].
  ClickCountProvider call(
    int maxCount,
  ) {
    return ClickCountProvider(
      maxCount,
    );
  }

  @override
  ClickCountProvider getProviderOverride(
    covariant ClickCountProvider provider,
  ) {
    return call(
      provider.maxCount,
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
  String? get name => r'clickCountProvider';
}

/// See also [ClickCount].
class ClickCountProvider
    extends AutoDisposeNotifierProviderImpl<ClickCount, int> {
  /// See also [ClickCount].
  ClickCountProvider(
    int maxCount,
  ) : this._internal(
          () => ClickCount()..maxCount = maxCount,
          from: clickCountProvider,
          name: r'clickCountProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$clickCountHash,
          dependencies: ClickCountFamily._dependencies,
          allTransitiveDependencies:
              ClickCountFamily._allTransitiveDependencies,
          maxCount: maxCount,
        );

  ClickCountProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.maxCount,
  }) : super.internal();

  final int maxCount;

  @override
  int runNotifierBuild(
    covariant ClickCount notifier,
  ) {
    return notifier.build(
      maxCount,
    );
  }

  @override
  Override overrideWith(ClickCount Function() create) {
    return ProviderOverride(
      origin: this,
      override: ClickCountProvider._internal(
        () => create()..maxCount = maxCount,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        maxCount: maxCount,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ClickCount, int> createElement() {
    return _ClickCountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ClickCountProvider && other.maxCount == maxCount;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, maxCount.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ClickCountRef on AutoDisposeNotifierProviderRef<int> {
  /// The parameter `maxCount` of this provider.
  int get maxCount;
}

class _ClickCountProviderElement
    extends AutoDisposeNotifierProviderElement<ClickCount, int>
    with ClickCountRef {
  _ClickCountProviderElement(super.provider);

  @override
  int get maxCount => (origin as ClickCountProvider).maxCount;
}

String _$isTypingCompleteHash() => r'6abd482436ea3d5ebbebd9c4812cb9d984a9bde2';

/// See also [IsTypingComplete].
@ProviderFor(IsTypingComplete)
final isTypingCompleteProvider =
    AutoDisposeNotifierProvider<IsTypingComplete, bool>.internal(
  IsTypingComplete.new,
  name: r'isTypingCompleteProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$isTypingCompleteHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IsTypingComplete = AutoDisposeNotifier<bool>;
String _$displayedTextHash() => r'79c63f4ec94994f12c4424aacfbe3b4afcb537da';

abstract class _$DisplayedText extends BuildlessAutoDisposeNotifier<String> {
  late final List<String> textList;

  String build(
    List<String> textList,
  );
}

/// See also [DisplayedText].
@ProviderFor(DisplayedText)
const displayedTextProvider = DisplayedTextFamily();

/// See also [DisplayedText].
class DisplayedTextFamily extends Family<String> {
  /// See also [DisplayedText].
  const DisplayedTextFamily();

  /// See also [DisplayedText].
  DisplayedTextProvider call(
    List<String> textList,
  ) {
    return DisplayedTextProvider(
      textList,
    );
  }

  @override
  DisplayedTextProvider getProviderOverride(
    covariant DisplayedTextProvider provider,
  ) {
    return call(
      provider.textList,
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
  String? get name => r'displayedTextProvider';
}

/// See also [DisplayedText].
class DisplayedTextProvider
    extends AutoDisposeNotifierProviderImpl<DisplayedText, String> {
  /// See also [DisplayedText].
  DisplayedTextProvider(
    List<String> textList,
  ) : this._internal(
          () => DisplayedText()..textList = textList,
          from: displayedTextProvider,
          name: r'displayedTextProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$displayedTextHash,
          dependencies: DisplayedTextFamily._dependencies,
          allTransitiveDependencies:
              DisplayedTextFamily._allTransitiveDependencies,
          textList: textList,
        );

  DisplayedTextProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.textList,
  }) : super.internal();

  final List<String> textList;

  @override
  String runNotifierBuild(
    covariant DisplayedText notifier,
  ) {
    return notifier.build(
      textList,
    );
  }

  @override
  Override overrideWith(DisplayedText Function() create) {
    return ProviderOverride(
      origin: this,
      override: DisplayedTextProvider._internal(
        () => create()..textList = textList,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        textList: textList,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<DisplayedText, String> createElement() {
    return _DisplayedTextProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DisplayedTextProvider && other.textList == textList;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, textList.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DisplayedTextRef on AutoDisposeNotifierProviderRef<String> {
  /// The parameter `textList` of this provider.
  List<String> get textList;
}

class _DisplayedTextProviderElement
    extends AutoDisposeNotifierProviderElement<DisplayedText, String>
    with DisplayedTextRef {
  _DisplayedTextProviderElement(super.provider);

  @override
  List<String> get textList => (origin as DisplayedTextProvider).textList;
}

String _$charIndexHash() => r'effec90d6b977cfbf9988f7605ec315e96a0ede0';

abstract class _$CharIndex extends BuildlessAutoDisposeNotifier<int> {
  late final String textLength;

  int build(
    String textLength,
  );
}

/// See also [CharIndex].
@ProviderFor(CharIndex)
const charIndexProvider = CharIndexFamily();

/// See also [CharIndex].
class CharIndexFamily extends Family<int> {
  /// See also [CharIndex].
  const CharIndexFamily();

  /// See also [CharIndex].
  CharIndexProvider call(
    String textLength,
  ) {
    return CharIndexProvider(
      textLength,
    );
  }

  @override
  CharIndexProvider getProviderOverride(
    covariant CharIndexProvider provider,
  ) {
    return call(
      provider.textLength,
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
  String? get name => r'charIndexProvider';
}

/// See also [CharIndex].
class CharIndexProvider
    extends AutoDisposeNotifierProviderImpl<CharIndex, int> {
  /// See also [CharIndex].
  CharIndexProvider(
    String textLength,
  ) : this._internal(
          () => CharIndex()..textLength = textLength,
          from: charIndexProvider,
          name: r'charIndexProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$charIndexHash,
          dependencies: CharIndexFamily._dependencies,
          allTransitiveDependencies: CharIndexFamily._allTransitiveDependencies,
          textLength: textLength,
        );

  CharIndexProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.textLength,
  }) : super.internal();

  final String textLength;

  @override
  int runNotifierBuild(
    covariant CharIndex notifier,
  ) {
    return notifier.build(
      textLength,
    );
  }

  @override
  Override overrideWith(CharIndex Function() create) {
    return ProviderOverride(
      origin: this,
      override: CharIndexProvider._internal(
        () => create()..textLength = textLength,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        textLength: textLength,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<CharIndex, int> createElement() {
    return _CharIndexProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CharIndexProvider && other.textLength == textLength;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, textLength.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CharIndexRef on AutoDisposeNotifierProviderRef<int> {
  /// The parameter `textLength` of this provider.
  String get textLength;
}

class _CharIndexProviderElement
    extends AutoDisposeNotifierProviderElement<CharIndex, int>
    with CharIndexRef {
  _CharIndexProviderElement(super.provider);

  @override
  String get textLength => (origin as CharIndexProvider).textLength;
}

String _$typingTimerHash() => r'359c563bd9aa112e044d6c244bbdfcff40b66f1d';

abstract class _$TypingTimer extends BuildlessAutoDisposeNotifier<Timer?> {
  late final Duration typingSpeed;

  Timer? build(
    Duration typingSpeed,
  );
}

/// See also [TypingTimer].
@ProviderFor(TypingTimer)
const typingTimerProvider = TypingTimerFamily();

/// See also [TypingTimer].
class TypingTimerFamily extends Family<Timer?> {
  /// See also [TypingTimer].
  const TypingTimerFamily();

  /// See also [TypingTimer].
  TypingTimerProvider call(
    Duration typingSpeed,
  ) {
    return TypingTimerProvider(
      typingSpeed,
    );
  }

  @override
  TypingTimerProvider getProviderOverride(
    covariant TypingTimerProvider provider,
  ) {
    return call(
      provider.typingSpeed,
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
  String? get name => r'typingTimerProvider';
}

/// See also [TypingTimer].
class TypingTimerProvider
    extends AutoDisposeNotifierProviderImpl<TypingTimer, Timer?> {
  /// See also [TypingTimer].
  TypingTimerProvider(
    Duration typingSpeed,
  ) : this._internal(
          () => TypingTimer()..typingSpeed = typingSpeed,
          from: typingTimerProvider,
          name: r'typingTimerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$typingTimerHash,
          dependencies: TypingTimerFamily._dependencies,
          allTransitiveDependencies:
              TypingTimerFamily._allTransitiveDependencies,
          typingSpeed: typingSpeed,
        );

  TypingTimerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.typingSpeed,
  }) : super.internal();

  final Duration typingSpeed;

  @override
  Timer? runNotifierBuild(
    covariant TypingTimer notifier,
  ) {
    return notifier.build(
      typingSpeed,
    );
  }

  @override
  Override overrideWith(TypingTimer Function() create) {
    return ProviderOverride(
      origin: this,
      override: TypingTimerProvider._internal(
        () => create()..typingSpeed = typingSpeed,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        typingSpeed: typingSpeed,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<TypingTimer, Timer?> createElement() {
    return _TypingTimerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TypingTimerProvider && other.typingSpeed == typingSpeed;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, typingSpeed.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TypingTimerRef on AutoDisposeNotifierProviderRef<Timer?> {
  /// The parameter `typingSpeed` of this provider.
  Duration get typingSpeed;
}

class _TypingTimerProviderElement
    extends AutoDisposeNotifierProviderElement<TypingTimer, Timer?>
    with TypingTimerRef {
  _TypingTimerProviderElement(super.provider);

  @override
  Duration get typingSpeed => (origin as TypingTimerProvider).typingSpeed;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
