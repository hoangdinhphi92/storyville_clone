import 'package:storyville_clone/repository/story.dart';

class StoryGroup {
  final String title;
  final String? name;
  final List<Story> stories;

  StoryGroup({required this.title, this.name, required this.stories});
}