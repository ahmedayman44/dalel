import 'package:dalel/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({super.key, required this.slidingAnimation});

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: Text(
            'Dalel',
            textAlign: TextAlign.center,
            style: Styles.pacifico400style33,
          ),
        );
      },
    );
  }
}
