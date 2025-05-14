// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isFirstTimeHash() => r'4e437d9883cb1bce2c8b251720d2bc6a4ba889da';

/// See also [isFirstTime].
@ProviderFor(isFirstTime)
final isFirstTimeProvider = AutoDisposeFutureProvider<bool>.internal(
  isFirstTime,
  name: r'isFirstTimeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isFirstTimeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef IsFirstTimeRef = AutoDisposeFutureProviderRef<bool>;
String _$userControllerHash() => r'278d932ab8e443aea2efe8d40f75f948fb9bdda8';

/// See also [UserController].
@ProviderFor(UserController)
final userControllerProvider =
    NotifierProvider<UserController, UserModel?>.internal(
  UserController.new,
  name: r'userControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserController = Notifier<UserModel?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
