import 'dart:async';
import 'package:flutter/material.dart';

class TypingText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final bool autoStart;
  final TextAlign? textAlign;
  final TypingTextController controller;

  TypingText(
      this.text, {
        Key? key,
        required this.style,
        this.autoStart = true,
        this.textAlign,
        TypingTextController? controller,
      })  : controller = controller ?? TypingTextController(),
        super(key: key);

  @override
  State<TypingText> createState() => _TypingTextState();
}

class _TypingTextState extends State<TypingText>
    with SingleTickerProviderStateMixin {
  late Timer _typingTimer;
  late Timer _cursorTimer;
  String _displayedText = '';
  int _currentIndex = 0;
  bool _isCursorVisible = false;

  @override
  void initState() {
    super.initState();
    if (widget.autoStart) {
      _startTyping();
    }
    widget.controller._setState(this);
  }

  void _startTyping() {
    setState(() {
      _isCursorVisible = true; // Start cursor visibility when typing starts
    });
    _typingTimer = Timer.periodic(widget.controller.typingSpeed, (Timer timer) {
      if (_currentIndex < widget.text.length) {
        setState(() {
          _displayedText = widget.text.substring(0, _currentIndex + 1);
          _currentIndex++;
        });
      } else {
        timer.cancel();
        widget.controller._onStopTyping?.call();
        _stopCursorBlink(); // Ensure cursor stops blinking when typing ends
      }
    });
    _startCursorBlink(); // Start cursor blinking
  }

  void _startCursorBlink() {
    _cursorTimer = Timer.periodic(const Duration(milliseconds: 500), (Timer timer) {
      if (_isCursorVisible) {
        setState(() {
          _displayedText = _displayedText.endsWith('|')
              ? _displayedText.substring(0, _displayedText.length - 1)
              : _displayedText + '|';
        });
      }
    });
  }

  void _stopCursorBlink() {
    _cursorTimer.cancel();
    setState(() {
      _isCursorVisible = false; // Stop cursor visibility when typing stops
      if (_displayedText.endsWith('|')) {
        _displayedText = _displayedText.substring(0, _displayedText.length - 1);
      }
    });
  }

  void _stopTyping() {
    _typingTimer.cancel();
    _stopCursorBlink();
  }

  @override
  void dispose() {
    _typingTimer.cancel();
    _cursorTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _displayedText,
      style: widget.style,
      textAlign: widget.textAlign,
    );
  }
}

class TypingTextController {
  final Duration typingSpeed;
  Function? _onStopTyping;
  _TypingTextState? _typingTextState;

  TypingTextController({
    this.typingSpeed = const Duration(milliseconds: 60),
  });

  void _setState(_TypingTextState state) {
    _typingTextState = state;
  }

  void startAnimation() {
    _typingTextState?._startTyping();
  }

  void stopAnimation() {
    _typingTextState?._stopTyping();
  }

  void onStopTyping(Function onStopTyping) {
    _onStopTyping = onStopTyping;
  }
}
