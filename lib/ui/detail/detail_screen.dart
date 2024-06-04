import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storyville_clone/repository/story.dart';
import 'package:storyville_clone/theme/app_colors.dart';
import 'package:storyville_clone/theme/app_styles.dart';
import 'package:storyville_clone/ui/app_routes.dart';
import 'package:storyville_clone/ui/common/cover_image.dart';

class DetailScreen extends StatefulWidget {
  final Story story;

  const DetailScreen({
    super.key,
    required this.story,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final viewPadding = MediaQuery.viewPaddingOf(context);

    return Material(
      color: AppColors.sFF0E0D0F,
      child: Stack(
        children: [
          Positioned.fill(child: _buildCoverImage(context)),
          Positioned.fill(child: _buildGradientBackground(context)),
          Positioned(
            top: viewPadding.top,
            left: 0,
            child: _buildBackButton(context),
          ),
          Positioned(
            bottom: viewPadding.bottom + 26,
            left: 26,
            right: 26,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildStoryInfo(context),
                const SizedBox(height: 26),
                _buildBottomLayout(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCoverImage(BuildContext context) {
    return Column(
      children: [
        Flexible(
          flex: 6,
          child: CoverImage(coverUrl: widget.story.coverUrl),
        ),
        const Flexible(flex: 4, child: SizedBox.expand()),
      ],
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return SizedBox(
      width: 56,
      height: 56,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            context.pop();
          },
          borderRadius: BorderRadius.circular(28),
          child: const Center(
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: AppColors.sFFFFFFFF,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGradientBackground(BuildContext context) {
    return Column(
      children: [
        const Flexible(flex: 3, child: SizedBox.expand()),
        Flexible(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.sFF0E0D0F,
                  AppColors.sFF0E0D0F.withOpacity(0)
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
        const Flexible(flex: 4, child: SizedBox.expand()),
      ],
    );
  }

  Widget _buildStoryInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.story.title,
            textAlign: TextAlign.center,
            style: AppStyles.extraBold.copyWith(
              fontSize: 32,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            widget.story.summary,
            textAlign: TextAlign.center,
            style: AppStyles.storyMedium.copyWith(
              fontSize: 16,
              color: Colors.white.withOpacity(0.8)
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildButton(
            context: context,
            icon: Icons.menu_book_rounded,
            title: "Read",
            onPressed: () {},
          ),
        ),
        const SizedBox(width: 26),
        Expanded(
          child: _buildButton(
            context: context,
            icon: Icons.multitrack_audio_rounded,
            title: "Listen",
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onPressed,
  }) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.sFF6D6EF3,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(24),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: AppColors.sFFFFFFFF),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(
                    title,
                    style: AppStyles.bold.copyWith(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
