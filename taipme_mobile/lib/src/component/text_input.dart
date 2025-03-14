import 'package:flutter/material.dart';
import 'package:taipme_mobile/src/theme/styles.dart';

enum IconPosition { left, right }

class TextInput extends StatefulWidget {
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
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool _obscureText = true; // Variabile per gestire la visibilità del testo

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Quando tocchi fuori dal campo, la tastiera viene nascosta
      onTap: () {
        FocusScope.of(context).unfocus(); // Rimuove il focus dalla tastiera
      },
      child: Focus(
        focusNode: widget.focusNode,
        onFocusChange: (hasFocus) {
          if (!hasFocus) widget.onFocusLost();
        },
        child: TextField(
          controller: widget.controller,
          focusNode: widget.focusNode, // Aggiunto focusNode
          obscureText: _obscureText, // Qui viene applicato il parametro
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.white),
            prefixIcon: widget.iconPosition == IconPosition.left
                ? Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Icon(widget.icon, color: TaipmeStyle.primaryColor),
                  )
                : null,
            suffixIcon: widget.iconPosition == IconPosition.right
                ? Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText; // Alterna la visibilità
                        });
                      },
                      child: Icon(
                        _obscureText
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: TaipmeStyle.primaryColor,
                      ),
                    ),
                  )
                : null,
            suffixIconConstraints: const BoxConstraints(minWidth: 0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.isValid
                    ? TaipmeStyle.borderInput
                    : TaipmeStyle.errorColor,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.isValid ? Colors.blue : TaipmeStyle.errorColor,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
