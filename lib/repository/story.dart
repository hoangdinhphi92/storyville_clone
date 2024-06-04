
class Story {
  final int id;
  final String title;
  final List<Content> content;
  final String coverImage;
  final int wordLength;
  final String summary;
  final bool isPrivate;
  final bool isPremium;
  final bool isCustom;
  final String genre;

  Story({
    required this.id,
    required this.title,
    required this.content,
    required this.coverImage,
    required this.wordLength,
    required this.summary,
    required this.isPrivate,
    required this.isPremium,
    required this.isCustom,
    required this.genre,
  });

  factory Story.fromJson(Map<String, dynamic> json) {
    var contentList = json['content'] as List;
    List<Content> contentItems =
        contentList.map((i) => Content.fromJson(i)).toList();

    return Story(
      id: json['id'],
      title: json['title'],
      content: contentItems,
      coverImage: json['coverImage'],
      wordLength: json['wordLength'],
      summary: json['summary'],
      isPrivate: json['isPrivate'],
      isPremium: json['isPremium'],
      isCustom: json['isCustom'],
      genre: json['genre'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content.map((e) => e.toJson()).toList(),
      'coverImage': coverImage,
      'wordLength': wordLength,
      'summary': summary,
      'isPrivate': isPrivate,
      'isPremium': isPremium,
      'isCustom': isCustom,
      'genre': genre,
    };
  }
}

class Content {
  final Audio audio;
  final String content;
  final int pageNumber;

  Content({
    required this.audio,
    required this.content,
    required this.pageNumber,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      audio: Audio.fromJson(json['audio']),
      content: json['content'],
      pageNumber: json['pageNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'audio': audio.toJson(),
      'content': content,
      'pageNumber': pageNumber,
    };
  }
}

class Audio {
  final String key;
  final int duration;

  Audio({
    required this.key,
    required this.duration,
  });

  factory Audio.fromJson(Map<String, dynamic> json) {
    return Audio(
      key: json['key'],
      duration: json['duration'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'duration': duration,
    };
  }
}

String kBaseSourceUrl = "https://images.storyville.workers.dev/";

extension StoryUrl on Story {
  String get coverUrl => kBaseSourceUrl + coverImage;
}

extension AudioUrl on Audio {
  String get audioUrl => kBaseSourceUrl + key;
}
