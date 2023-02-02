import 'package:flutter/material.dart';
import 'package:insta_gram_riverpod/views/components/animations/animations.dart';

class EmptyContentWithTextView extends StatelessWidget {
  final String text;
  const EmptyContentWithTextView({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(
              text,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white54,
                  ),
            ),
          ),
          const EmptyAnimationView(),
        ],
      ),
    );
  }
}
