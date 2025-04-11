// ignore_for_file: avoid_build_context_in_providers
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:taipme_mobile/src/theme/styles.dart';
import 'package:taipme_mobile/src/util/key/key.dart';

part 'snackbar.g.dart';

@riverpod
FutureOr<SnackBarClosedReason?> snackBar(
  Ref ref, {
  required String text,
  Duration duration = const Duration(seconds: 3),
  bool successOrFail = false,
  BuildContext? contextFromParameter,
}) {
  debugPrint('Service: snackBar text is: $text');
  BuildContext? context;

  if (contextFromParameter == null) {
    context = ref.read(navigatorKeyProvider).currentContext;
  } else {
    context = contextFromParameter;
  }

  if (context == null) return null;

  final messenger = ScaffoldMessenger.of(context);

  final snackBar = SnackBar(
    width: MediaQuery.of(context).size.width * 0.7,
    backgroundColor:
        successOrFail == true ? TaipmeStyle.primaryColor : Colors.red,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    behavior: SnackBarBehavior.floating,
    content: Text(text),
    duration: duration,
  );

  final result = messenger.showSnackBar(snackBar);

  return result.closed;
}
