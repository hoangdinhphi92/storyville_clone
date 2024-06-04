import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';
import 'package:storyville_clone/ui/home/%20state/home_success_content.dart';

class HomeLoadingContent extends StatelessWidget {
  const HomeLoadingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade500,
          highlightColor: Colors.grey.shade200,
          enabled: true,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.viewPaddingOf(context).top),
                const SizedBox(height: 36),
                _buildLoadingGroup(context, kBigItemWidth * 2 / 3, kBigItemWidth),
                _buildLoadingGroup(context, kSmallItemWidth, kSmallItemWidth),
                _buildLoadingGroup(context, kSmallItemWidth, kSmallItemWidth),
                _buildLoadingGroup(context, kSmallItemWidth, kSmallItemWidth),
                _buildLoadingGroup(context, kSmallItemWidth, kSmallItemWidth),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildLoadingGroup(BuildContext context, double titleWidth, double itemWidth) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(context, titleWidth),
        const SizedBox(height: 16),
        _buildRowItem(context, itemWidth),
        const SizedBox(height: 36),
      ],
    );
  }

  Widget _buildTitle(BuildContext context, double width) {
    return Container(
      width: width,
      height: 28,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(14),
      ),
    );
  }

  Widget _buildRowItem(BuildContext context, double width) {
    return SizedBox(
      height: width * kItemRatio,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 100,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) => _buildItem(context, width),
      ),
    );
  }

  Widget _buildItem(BuildContext context, double width) {
    return SizedBox(
      width: width,
      height: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(kItemBorderRadius),
        ),
      ),
    );
  }
}
