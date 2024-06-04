import 'package:flutter/material.dart';
import 'package:storyville_clone/theme/app_styles.dart';

class HomeErrorContent extends StatelessWidget {
  const HomeErrorContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.wifi_tethering_error,
              size: 96,
            ),
            const SizedBox(height: 36),
            Text(
              "Something error, please try again!!!",
              style: AppStyles.bold.copyWith(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
