import 'package:flutter/material.dart';
import 'package:toktik/config/helpers/number_formater.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:video_player/video_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videosPosts;

  const VideoScrollableView({super.key, required this.videosPosts});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: videosPosts.length,
      itemBuilder: (context, index) {
        VideoPost videoPost = videosPosts[index];

        return Stack(
          children: [
            _VideoPlayer(
              videoPost: videoPost,
            ),
            Positioned(
                bottom: 40,
                right: 10,
                child: _VideoButtons(videoPost: videoPost))
          ],
        );
      },
    );
  }
}

class _VideoButtons extends StatelessWidget {
  final VideoPost videoPost;
  const _VideoButtons({required this.videoPost});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomButton(
          icon: Icons.favorite,
          iconColor: Colors.red,
          value: videoPost.likes,
        ),
        _CustomButton(
          icon: Icons.remove_red_eye_outlined,
          iconColor: Colors.white,
          value: videoPost.views,
        ),
        _CustomButton(
          icon: Icons.bookmark_add_outlined,
          iconColor: Colors.white,
          value: (videoPost.likes / 20).round(),
        ),
      ],
    );
  }
}

class _CustomButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final int value;

  const _CustomButton(
      {required this.icon, required this.iconColor, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              size: 40,
              icon,
              color: iconColor,
            )),
        // Text((value > 1000) ? "${value.toString()[0]}k" : value.toString())
        Text(NumberFormater.formarToCompactNumber(value))
      ],
    );
  }
}

class _VideoPlayer extends StatefulWidget {
  final VideoPost videoPost;

  const _VideoPlayer({required this.videoPost});

  @override
  State<_VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<_VideoPlayer> {
  late VideoPlayerController controller;
  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(widget.videoPost.videoUrl);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GestureDetector(
        onTap: () {
          controller.value.isPlaying ? controller.pause() : controller.play();
        },
        child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: VideoPlayer(controller),
        ),
      ),
      const Positioned.fill(
        child: DecoratedBox(
            decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(0, 198, 198, 198),
              Colors.transparent,
              Color.fromARGB(151, 0, 0, 0)
            ],
            stops: [0.0, 0.5, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        )),
      ),

      //Gradiente

      //Caption
      Positioned(left: 20, bottom: 40, child: Text(widget.videoPost.caption))
    ]);
  }
}
