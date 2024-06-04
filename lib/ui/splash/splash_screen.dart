import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storyville_clone/gen/assets.gen.dart';
import 'package:storyville_clone/theme/app_colors.dart';
import 'package:storyville_clone/theme/app_styles.dart';
import 'package:storyville_clone/ui/app_routes.dart';
import 'package:storyville_clone/ui/splash/splash_items.dart';
import 'package:storyville_clone/ui/splash/splash_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController(initialPage: 0);

  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  set pageIndex(int value) {
    if (_pageIndex != value) {
      _pageIndex = value;
      setState(() {});
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => autoScrollPage(),
    );
    super.initState();
  }

  Future<void> autoScrollPage() async {
    for (var i = 1; i < kSPlashItems.length; i++) {
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) {
        _pageController.animateToPage(
          i,
          curve: Curves.linear,
          duration: const Duration(milliseconds: 250),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.sFF1C1F2B,
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 36),
            Assets.images.logoTextLight.image(width: 120),
            Expanded(child: _buildPlashPage(context)),
            _buildPageIndicator(context),
            const SizedBox(height: 26),
            _buildButton(context),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildPlashPage(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      onPageChanged: (value) => pageIndex = value,
      itemCount: kSPlashItems.length,
      itemBuilder: (context, index) => SplashPage(item: kSPlashItems[index]),
    );
  }

  Widget _buildPageIndicator(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildIndicator(context, pageIndex == 0),
        const SizedBox(width: 8),
        _buildIndicator(context, pageIndex == 1),
        const SizedBox(width: 8),
        _buildIndicator(context, pageIndex == 2),
      ],
    );
  }

  Widget _buildIndicator(BuildContext context, bool selected) {
    return Container(
      width: 32,
      height: 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: AppColors.sFFFFFFFF.withOpacity(selected ? 1 : 0.5),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: const Color(0xff735ef4),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              context.goTo(AppRoute.home);
            },
            borderRadius: BorderRadius.circular(28),
            child: Center(
              child: Text(
                "Get started",
                style: AppStyles.bold.copyWith(
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
