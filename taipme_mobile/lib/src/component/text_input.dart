import 'package:flutter/material.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final IconData icon;
  final bool isValid;
  final VoidCallback onFocusLost;

  const TextInput({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.hintText,
    required this.icon,
    required this.isValid,
    required this.onFocusLost,
  });

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: focusNode,
      onFocusChange: (hasFocus) {
        if (!hasFocus) onFocusLost();
      },
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(icon, color: TaipmeStyle.borderInput),
          suffixIcon: isValid
              ? null
              : const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: isValid ? TaipmeStyle.borderInput : TaipmeStyle.errorColor,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: isValid ? Colors.blue : TaipmeStyle.errorColor,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
