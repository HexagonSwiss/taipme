import 'package:flutter/material.dart';
import 'dart:async'; // Per Timer

class TypingEffectWidget extends StatefulWidget {
  final String fullText;
  final TextAlign textAlign;
  final TextStyle textStyle;
  final Duration typingSpeed;
  final VoidCallback onTypingComplete; // Aggiungi il parametro per il callback

  const TypingEffectWidget({
    super.key,
    required this.fullText,
    required this.textAlign,
    required this.textStyle,
    required this.typingSpeed,
    required this.onTypingComplete, // Parametro aggiunto
  });

  @override
  State<TypingEffectWidget> createState() => _TypingEffectWidgetState();
}

class _TypingEffectWidgetState extends State<TypingEffectWidget> {
  late String displayedText;
  int charIndex = 0;

  @override
  void initState() {
    super.initState();
    displayedText = '';
    _startTyping();
  }

  void _startTyping() {
    Future.delayed(widget.typingSpeed, _typeCharacter);
  }

  void _typeCharacter() {
    if (charIndex < widget.fullText.length) {
      setState(() {
        displayedText += widget.fullText[charIndex];
        charIndex++;
      });
      Future.delayed(widget.typingSpeed, _typeCharacter);
    } else {
      // Quando il testo è completamente scritto, chiama il callback
      widget.onTypingComplete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      displayedText,
      textAlign: widget.textAlign,
      style: widget.textStyle,
    );
  }
}
