
import 'package:flutter/cupertino.dart';
import 'package:storyville_clone/repository/story_group.dart';
import 'package:storyville_clone/repository/story_repository.dart';

enum HomeScreenState {
  loading,
  error,
  success,
}

class HomeViewModel extends ChangeNotifier {
  HomeScreenState _screenState = HomeScreenState.loading;

  HomeScreenState get screenState => _screenState;

  set screenState(HomeScreenState value) {
    if(screenState != value) {
      _screenState = value;
      notifyListeners();
    }
  }

  List<StoryGroup> _data = List.empty();

  List<StoryGroup> get data => _data;

  set data(List<StoryGroup> value) {
    _data = value;
    notifyListeners();
  }

  HomeViewModel() {
    load();
  }

  Future<void> load() async {
    screenState = HomeScreenState.loading;
    try {
      data = await StoryRepository.loadStories();
    } catch(e) {
      screenState = HomeScreenState.error;
    } finally {
      screenState = HomeScreenState.success;
    }
  }

}