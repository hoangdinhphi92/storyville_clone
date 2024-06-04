import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/services.dart';
import 'package:storyville_clone/repository/story.dart';
import 'package:storyville_clone/repository/story_group.dart';
import 'package:storyville_clone/utils/utils.dart';

const kMaxLatestStories = 4;

class StoryRepository {
  static Future<List<StoryGroup>> loadStories() async {
    await Future.delayed(const Duration(seconds: 2));

    final stories = await loadStoriesFromAssets();

    final myStories = stories.where((e) => e.isCustom);
    final suggestStories = stories.where((e) => !e.isCustom);

    // Create story groups
    List<StoryGroup> groups = List.empty(growable: true);

    // Create latest group
    final List<Story> latestStories = List.from(myStories);
    latestStories.addAll(suggestStories.take(kMaxLatestStories));
    groups.add(
      StoryGroup(
        title: "Latest stories for",
        name: "Phi",
        stories: latestStories,
      ),
    );

    // Create free group
    final List<Story> freeStories = suggestStories
        .where(
          (e) => !e.isPremium,
        )
        .toList();
    groups.add(
      StoryGroup(
        title: "Stories you can enjoy for",
        name: "free",
        stories: freeStories,
      ),
    );

    // Create group by genre
    final genres = groupStoriesByGenre(stories);
    groups.addAll(genres.entries.map(
      (e) => StoryGroup(title: e.key.capitalize(), stories: e.value),
    ));

    return groups;
  }

  static Map<String, List<Story>> groupStoriesByGenre(List<Story> stories) {
    Map<String, List<Story>> genreMap = {};

    for (var story in stories) {
      if (!genreMap.containsKey(story.genre)) {
        genreMap[story.genre] = [];
      }
      genreMap[story.genre]!.add(story);
    }

    return genreMap;
  }

  static Future<List<Story>> loadStoriesFromAssets() async {
    // Load the JSON string from the assets
    String jsonString = await rootBundle.loadString('assets/data/stories.json');

    // Decode the JSON string into a list of dynamic objects
    List<dynamic> decodedJson = await Isolate.run(
      () => json.decode(jsonString),
    );

    // Convert the list of dynamic objects to a list of Story objects
    List<Story> stories = await Isolate.run(
      () => decodedJson.map((json) => Story.fromJson(json)).toList(),
    );

    return stories;
  }
}
