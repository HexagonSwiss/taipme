import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/src/controller/input_error_controller/input_error_controller.dart';
import 'package:taipme_mobile/src/controller/obscure_text_controller/obscure_text_controller.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class InputField extends ConsumerStatefulWidget {
  const InputField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.hintText,
    required this.icon,
    required this.validator,
    this.nextFocusNode,
    this.labelText,
    this.textCapitalization = TextCapitalization.none,
    this.isReadOnly = false,
    this.hasSuffixIcon = false,
    this.hasPrefixIcon = false,
    this.isPassword = false,
    this.isConfirmation = false,
    this.left = 0,
    this.top = 0,
    this.right = 0,
    this.bottom = 0,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
  final String hintText;
  final String? labelText;
  final IconData icon;
  final String? Function(String? value) validator;
  final bool isReadOnly;
  final bool hasSuffixIcon;
  final bool hasPrefixIcon;
  final bool isPassword;
  final bool isConfirmation;
  final double left;
  final double top;
  final double right;
  final double bottom;
  final TextCapitalization textCapitalization;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TextInputState();
}

class _TextInputState extends ConsumerState<InputField> {
  switchToNextFocus() {
    if (widget.nextFocusNode != null) {
      FocusScope.of(context).requestFocus(widget.nextFocusNode);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool obscureText =
        ref.watch(obscureTextControllerProvider(widget.hintText));
    final String? hasError =
        ref.watch(inputErrorControllerProvider(widget.hintText));

    return Padding(
      padding: EdgeInsets.fromLTRB(
        widget.left,
        widget.top,
        widget.right,
        widget.bottom,
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: hasError != null ? 76 : 56,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUnfocus,
          readOnly: widget.isReadOnly,
          focusNode: widget.focusNode,
          controller: widget.controller,
          obscureText: obscureText,
          textCapitalization: widget.textCapitalization,
          validator: ref
              .read(inputErrorControllerProvider(widget.hintText).notifier)
              .validatorWithErrorTracking(widget.validator),
          textInputAction: widget.nextFocusNode != null
              ? TextInputAction.next
              : TextInputAction.done,
          onFieldSubmitted: (String? value) {
            if (widget.nextFocusNode != null) {
              FocusScope.of(context).requestFocus(widget.nextFocusNode);
            } else {
              FocusScope.of(context).unfocus();
            }
          },
          style: TextStyle(
            color: widget.isReadOnly
                ? TaipmeStyle.inputFieldReadOnlyColor
                : TaipmeStyle.primaryColor,
          ),
          decoration: InputDecoration(
            labelText: widget.labelText,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            floatingLabelStyle: TextStyle(
              color: widget.isReadOnly
                  ? TaipmeStyle.inputFieldReadOnlyColor
                  : TaipmeStyle.primaryColor,
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(color: TaipmeStyle.primaryColor),
            prefixIcon: widget.hasPrefixIcon == true
                ? Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Icon(
                      widget.icon,
                      color: TaipmeStyle.primaryColor,
                    ),
                  )
                : null,
            suffixIcon: widget.hasSuffixIcon == true
                ? GestureDetector(
                    onTap: () {
                      if (!widget.isPassword && !widget.isConfirmation) {
                        return;
                      }

                      if (widget.isPassword || widget.isConfirmation) {
                        ref
                            .read(obscureTextControllerProvider(widget.hintText)
                                .notifier)
                            .changeVisibility();
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: hasError != null
                          ? Icon(
                              Icons.info_outline,
                              color: TaipmeStyle.errorColor,
                            )
                          : (widget.isPassword || widget.isConfirmation)
                              ? obscureText
                                  ? Icon(
                                      Icons.visibility,
                                      color: TaipmeStyle.primaryColor,
                                    )
                                  : Icon(
                                      Icons.visibility_off,
                                      color: TaipmeStyle.primaryColor,
                                    )
                              : Icon(
                                  widget.icon,
                                  color: TaipmeStyle.primaryColor,
                                ),
                    ),
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(TaipmeStyle.lightRadius),
              borderSide: BorderSide(color: TaipmeStyle.primaryColor),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(TaipmeStyle.lightRadius),
              borderSide: BorderSide(
                color: TaipmeStyle.errorColor,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(TaipmeStyle.lightRadius),
              borderSide: BorderSide(
                color: TaipmeStyle.primaryColor,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(TaipmeStyle.lightRadius),
              borderSide: BorderSide(color: TaipmeStyle.errorColor),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(TaipmeStyle.lightRadius),
              borderSide: BorderSide(
                color: TaipmeStyle.inputFieldReadOnlyColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
