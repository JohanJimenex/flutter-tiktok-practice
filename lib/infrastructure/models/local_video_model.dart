import 'package:toktik/domain/entities/video_post.dart';

class LocalVideoModel {
  final String name;
  final String videoUrl;
  int likes;
  int views;

  LocalVideoModel(
      {required this.name,
      required this.videoUrl,
      this.likes = 0,
      this.views = 0});

  factory LocalVideoModel.fromJson(Map<String, dynamic> jsonObj) {
    return LocalVideoModel(
      name: jsonObj["name"] ?? "",
      videoUrl: jsonObj["videoUrl"],
      likes: jsonObj["likes"] ?? 0,
      views: jsonObj["views"] ?? 0,
    );
  }

  VideoPost toVideoPostEntitie() {
    return VideoPost(
        caption: name, videoUrl: videoUrl, likes: likes, views: views);
  }
}
