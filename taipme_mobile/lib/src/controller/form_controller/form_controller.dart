import 'package:taipme_mobile/route/route.dart';
import 'package:taipme_mobile/src/model/data_model/result_model/result_model.dart';
import 'package:taipme_mobile/src/util/service/snackbar_service/snackbar_service.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'form_controller.g.dart';

@riverpod
class FormController extends _$FormController {
  @override
  bool build() => true;

  void setStateToLoading() => state = false; // loading
  void setStateToAvailable() => state = true; // available

  bool isEmail(String input) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(input);
  }

  String? comparePasswords(String? firstPassword, String? secondPassword, BuildContext context) {
    debugPrint('Controller: comparePasswords firstPassword is $firstPassword, secondPassword is $secondPassword');
    if (firstPassword == null || secondPassword == null) return AppLocalizations.of(context)!.passwordValidatorMandatory;
    if (firstPassword.isEmpty || secondPassword.isEmpty) return AppLocalizations.of(context)!.passwordValidatorMandatory;
    if (firstPassword != secondPassword) return AppLocalizations.of(context)!.passwordValidatorMatch;
    return null;
  }

  String? validateEmail(String? value, BuildContext context) {
    debugPrint('Controller: validateEmail is $value');
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.emailIsMandatory;
    } else if (!ref.read(formControllerProvider.notifier).isEmail(value)) {
      setStateToLoading();
      return AppLocalizations.of(context)!.emailValidator;
    }
    return null;
  }

  String? validatePassword(String? value, BuildContext context) {
    debugPrint('first password is $value');
    if (value == null) {
      setStateToLoading();
      return AppLocalizations.of(context)!.passwordValidatorMandatory;
    } else if (value.trim().length < 6) {
      return AppLocalizations.of(context)!.passwordValidatorMandatory;
    }
    return null;
  }

  String? validateDate(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.birthDateFieldIsMandatory;
    }

    final RegExp dateRegExp = RegExp(
      r'^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/(19|20)\d\d$',
    );

    if (!dateRegExp.hasMatch(value)) {
      return AppLocalizations.of(context)!.birthDayFormatIsDDMMYYYY;
    }

    return null;
  }

  String? validateEmptyOrNull(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      setStateToLoading();
      return AppLocalizations.of(context)!.fieldIsMandatory;
    }
    return null;
  }

  String? validateOptionalField(String? value) => null;

  String? validateGender(String? value, BuildContext context) {
    String? lowerStringValue;
    if (value != null) {
      lowerStringValue = value.toLowerCase();
    } else {
      lowerStringValue = value;
    }
    if (lowerStringValue == 'uomo' || lowerStringValue == 'donna' || lowerStringValue == 'terapista' || lowerStringValue == 'terapista') {
      return null;
    } else {
      return AppLocalizations.of(context)!.genderFieldIsMandatory;
    }
  }

  Future<void> handleForm({
    List<Function()>? actions,
    List<Function()>? onEnd,
    List<Function()>? onFail,
    String? route,
    required GlobalKey<FormState> globalKey,
    required BuildContext context,
  }) async {
    try {
      setStateToLoading();
      debugPrint('Controller: handleForm loading state is $state, trying to validate form');
      final isValid = globalKey.currentState!.validate();
      debugPrint('Controller: handleForm value of isValid is $isValid');

      if (!isValid) {
        ref.read(snackBarServiceProvider(text: AppLocalizations.of(context)!.formControllerFormValidator));
        setStateToAvailable();
        return;
      }
      globalKey.currentState!.save();
      debugPrint('Controller: handleForm form is validated');

      if (actions == null || actions.isEmpty) {
        debugPrint('Controller: handleForm navigating without action');
        setStateToAvailable();
        if (route != null) ref.read(goRouterProvider).go(route);
        return;
      }

      for (var action in actions) {
        final ResultModel<dynamic> actionResult = await action();
        if (actionResult.error != null) {
          if (context.mounted) ref.read(snackBarServiceProvider(text: actionResult.error!).future);

          setStateToAvailable();

          if (onFail != null) {
            for (var action in onFail) {
              action();
            }
          }
          return;
        }
      }

      debugPrint('Controller: handleForm main functions executed, moving to onEnd');

      if (onEnd != null) {
        for (var action in onEnd) {
          action();
        }
      }

      debugPrint('Controller: handleForm about to navigate');
      setStateToAvailable();
      if (route != null) ref.read(goRouterProvider).go(route);
    } catch (error) {
      if (context.mounted) ref.read(snackBarServiceProvider(text: AppLocalizations.of(context)!.formError));
      debugPrint('Controller: handleForm error is $error');
      setStateToAvailable();
    }
  }
}
