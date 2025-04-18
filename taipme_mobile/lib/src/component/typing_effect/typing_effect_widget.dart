import 'package:flutter/material.dart';
import 'dart:async'; // Per Timer

class TypingEffectWidget extends StatefulWidget {
  const TypingEffectWidget({
    super.key,
    required this.fullText,
    this.onTypingComplete,
    this.typingSpeed = const Duration(milliseconds: 90),
    this.textAlign = TextAlign.center,
    this.textStyle = const TextStyle(color: Colors.white, fontSize: 14),
  });

  final String fullText;
  final TextAlign textAlign;
  final TextStyle textStyle;
  final Duration typingSpeed;
  final VoidCallback? onTypingComplete;

  @override
  State<TypingEffectWidget> createState() => _TypingEffectWidgetState();
}

class _TypingEffectWidgetState extends State<TypingEffectWidget> {
  Timer? _timer;
  int charIndex = 0;

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  void _startTyping() {
    _timer = Timer.periodic(widget.typingSpeed, (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      if (charIndex < widget.fullText.length) {
        setState(() => charIndex++);
      } else {
        timer.cancel();
        if (widget.onTypingComplete != null) {
          widget.onTypingComplete!();
        }
      }
    });
  }

  void _completeTyping() {
    if (_timer != null) {
      _timer?.cancel();
      setState(() => charIndex = widget.fullText.length);
      if (widget.onTypingComplete != null) {
        widget.onTypingComplete!();
      }
    }
  }

  @override
  void dispose() {
    _timer?.cancel(); // Annulla il timer quando il widget viene smontato
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _completeTyping, // Quando l'utente clicca, termina la scrittura
      child: Text(
        widget.fullText.substring(0, charIndex),
        textAlign: widget.textAlign,
        style: widget.textStyle,
      ),
    );
  }
}
