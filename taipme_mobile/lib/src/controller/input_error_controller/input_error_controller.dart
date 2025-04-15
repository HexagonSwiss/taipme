import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'input_error_controller.g.dart';

@riverpod
class InputErrorController extends _$InputErrorController {
  @override
  String? build(String param) => null;

  String? Function(String?) validatorWithErrorTracking(
    String? Function(String?) originalValidator,
  ) {
    debugPrint('Controller: validatorWithErrorTracking is called');
    return (String? value) {
      debugPrint('Controller: validatorWithErrorTracking value is $value');
      final result = originalValidator(value);
      debugPrint('Controller: validatorWithErrorTracking result is $result');
      state = result;
      return result;
    };
  }
}
