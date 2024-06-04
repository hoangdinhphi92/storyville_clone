import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:storyville_clone/repository/story.dart';
import 'package:storyville_clone/theme/app_colors.dart';
import 'package:storyville_clone/theme/app_styles.dart';
import 'package:storyville_clone/ui/app_routes.dart';
import 'package:storyville_clone/ui/common/cover_image.dart';
import 'package:storyville_clone/ui/home/%20state/home_success_content.dart';

class StoryItemWidget extends StatelessWidget {
  final Story story;
  final bool bigStyle;

  const StoryItemWidget({
    super.key,
    required this.story,
    this.bigStyle = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kItemBorderRadius),
      child: Stack(
        children: [
          Positioned.fill(child: CoverImage(coverUrl: story.coverUrl)),
          Positioned.fill(child: _buildGradientBackground(context)),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildStoryInfo(context),
          ),
          Positioned.fill(child: _buildOverlayClickable(context)),
        ],
      ),
    );
  }

  Widget _buildStoryInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (bigStyle)
            Text(
              story.genre.toUpperCase(),
              style: AppStyles.bold.copyWith(
                fontSize: 12,
                color: AppColors.sFFFFFFFF.withOpacity(0.6),
              ),
            ),
          Text(
            story.title,
            style: AppStyles.extraBold.copyWith(
              fontSize: bigStyle ? 22 : 14,
              color: AppColors.sFFFFFFFF,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGradientBackground(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: SizedBox.expand()),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.sFF1C1F2B,
                  AppColors.sFF1C1F2B.withOpacity(0.9),
                  AppColors.sFF1C1F2B.withOpacity(0)
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildOverlayClickable(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          context.pushTo(AppRoute.detail, arguments: story);
        },
        borderRadius: BorderRadius.circular(kItemBorderRadius),
        child: const SizedBox.expand(),
      ),
    );
  }
}
