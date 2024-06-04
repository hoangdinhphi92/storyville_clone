import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storyville_clone/repository/story_group.dart';
import 'package:storyville_clone/ui/home/%20state/content/story_group_title.dart';
import 'package:storyville_clone/ui/home/%20state/content/story_item_widget.dart';
import 'package:storyville_clone/ui/home/home_view_model.dart';

const double kItemRatio = 3 / 2;
const double kBigItemWidth = 256;
const double kSmallItemWidth = 160;
const double kItemBorderRadius = 24;

class HomeSuccessContent extends StatefulWidget {
  const HomeSuccessContent({super.key});

  @override
  State<HomeSuccessContent> createState() => _HomeSuccessContentState();
}

class _HomeSuccessContentState extends State<HomeSuccessContent> {
  @override
  Widget build(BuildContext context) {
    final data = context.select((HomeViewModel vm) => vm.data);
    final viewPadding = MediaQuery.viewPaddingOf(context);

    return ListView.separated(
      padding: EdgeInsets.only(
        top: viewPadding.top + 26,
        bottom: viewPadding.bottom + 16,
      ),
      itemCount: data.length,
      separatorBuilder: (context, index) => const SizedBox(height: 36),
      itemBuilder: (context, index) {
        return _buildGroupItem(
          context: context,
          group: data[index],
          bigStyle: index == 0,
        );
      },
    );
  }

  Widget _buildGroupItem({
    required BuildContext context,
    required StoryGroup group,
    required bool bigStyle,
  }) {
    final width = bigStyle ? kBigItemWidth : kSmallItemWidth;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StoryGroupTitle(
          title: group.title,
          name: group.name,
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: width * kItemRatio,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: group.stories.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) => SizedBox(
              width: width,
              height: width * kItemRatio,
              child: StoryItemWidget(
                story: group.stories[index],
                bigStyle: bigStyle,
              ),
            ),
          ),
        )
      ],
    );
  }
}
