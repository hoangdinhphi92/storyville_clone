import 'package:flutter/material.dart';
import 'package:storyville_clone/theme/app_styles.dart';

class StoryGroupTitle extends StatelessWidget {
  final String title;
  final String? name;

  const StoryGroupTitle({
    super.key,
    required this.title,
    this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: RichText(
          text: TextSpan(
            text: title,
            style: AppStyles.bold.copyWith(fontSize: 20),
            children: [
              if (name != null)
                TextSpan(
                  text: ' $name',
                  style: const TextStyle(
                    color: Color(0xff6d6ef3),
                  ),
                ),
            ],
          ),
        ));
  }
}
