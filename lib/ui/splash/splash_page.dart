import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:storyville_clone/theme/app_styles.dart';
import 'package:storyville_clone/ui/splash/splash_items.dart';

class SplashPage extends StatelessWidget {
  final SplashItem item;
  
  const SplashPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {

        final double minSize = math.min(constraints.maxWidth, constraints.maxHeight) - 72;
        final double iconSize = math.max(minSize, 512);

        return Column(
          children: [
            const SizedBox(height: 16),
            item.icon.image(
                width: iconSize,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                item.title,
                textAlign: TextAlign.center,
                style: AppStyles.bold.copyWith(
                  fontSize: item.fontSize,
                ),
              ),
            )
          ],
        );
      }
    );
  }
}
