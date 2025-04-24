// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getAllMessagesHash() => r'86477871e4c9e03f550d1ae205a91dc07da5a7af';

/// See also [getAllMessages].
@ProviderFor(getAllMessages)
final getAllMessagesProvider =
    AutoDisposeFutureProvider<List<MessageModel>>.internal(
  getAllMessages,
  name: r'getAllMessagesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getAllMessagesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetAllMessagesRef = AutoDisposeFutureProviderRef<List<MessageModel>>;
String _$messageControllerHash() => r'ca5d0e19b800140f6e2cc373639c98c1b774ee58';

/// See also [MessageController].
@ProviderFor(MessageController)
final messageControllerProvider =
    NotifierProvider<MessageController, List<MessageModel>>.internal(
  MessageController.new,
  name: r'messageControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$messageControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MessageController = Notifier<List<MessageModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
