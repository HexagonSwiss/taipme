import 'package:flutter/material.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

enum IconPosition { left, right }

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final IconData icon;
  final bool isValid;
  final VoidCallback onFocusLost;
  final IconPosition iconPosition;

  const TextInput({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.hintText,
    required this.icon,
    required this.isValid,
    required this.onFocusLost,
    this.iconPosition = IconPosition.left, // Posizione di default a sinistra
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Quando tocchi fuori dal campo, la tastiera viene nascosta
      onTap: () {
        FocusScope.of(context).unfocus(); // Rimuove il focus dalla tastiera
      },
      child: Focus(
        focusNode: focusNode,
        onFocusChange: (hasFocus) {
          if (!hasFocus) onFocusLost();
        },
        child: TextField(
          controller: controller,
          style: TextStyle(color: Colors.white), // Impostiamo il testo bianco
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white), // Colore del testo di suggerimento
            // Aggiungi padding per l'icona a sinistra o a destra
            prefixIcon: iconPosition == IconPosition.left
                ? Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Icon(icon, color: TaipmeStyle.borderInput), // Icona a sinistra
                  )
                : null,
            suffixIcon: iconPosition == IconPosition.right
                ? Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Icon(icon, color: TaipmeStyle.borderInput), // Icona a destra
                  )
                : null,
            suffixIconConstraints: const BoxConstraints(minWidth: 0), // Impedisce espansione dell'icona
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
      ),
    );
  }
}
