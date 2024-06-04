import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storyville_clone/theme/app_colors.dart';
import 'package:storyville_clone/ui/home/%20state/home_error_content.dart';
import 'package:storyville_clone/ui/home/%20state/home_loading_content.dart';
import 'package:storyville_clone/ui/home/%20state/home_success_content.dart';
import 'package:storyville_clone/ui/home/home_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.sFF1C1F2B,
      child: ChangeNotifierProvider(
        create: (context) => HomeViewModel(),
        builder: (context, child) {
          final state = context.select(
            (HomeViewModel vm) => vm.screenState,
          );
          switch (state) {
            case HomeScreenState.loading:
              return const HomeLoadingContent();
            case HomeScreenState.error:
              return const HomeErrorContent();
            case HomeScreenState.success:
              return const HomeSuccessContent();
          }
        },
      ),
    );
  }
}
