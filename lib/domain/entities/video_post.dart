class VideoPost {
  final String caption;
  final String videoUrl;
  int likes;
  int views;

  VideoPost(
      {required this.caption,
      required this.videoUrl,
      this.likes = 0,
      this.views = 0});
}
