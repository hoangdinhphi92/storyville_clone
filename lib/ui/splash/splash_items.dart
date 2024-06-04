import 'package:storyville_clone/gen/assets.gen.dart';

final kSPlashItems = [
  SplashItem(
    Assets.images.splashIcon1,
    "Personalized bedtime stories for your kids",
    24,
  ),
  SplashItem(
    Assets.images.splashIcon2,
    "With the power of Al, you can create unique bedtime stories centered around your child.",
    20,
  ),
  SplashItem(
    Assets.images.splashIcon3,
    "Each story focuses on teaching your kids about a specific theme, such asm being kind to others.",
    20,
  ),
];

class SplashItem {
  final AssetGenImage icon;
  final String title;
  final double fontSize;

  const SplashItem(this.icon, this.title, this.fontSize);
}
