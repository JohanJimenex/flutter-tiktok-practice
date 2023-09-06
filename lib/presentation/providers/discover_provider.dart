import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_post_repository.dart';
 

class DiscoverProvider extends ChangeNotifier {
  bool loading = true;
  List<VideoPost> listVideos = [];

  VideoPostRepository videoPostRepository;

  DiscoverProvider({required this.videoPostRepository});

  //Aplicaremos un princiop de arquitectura limpia que es el crear la fuente de los datos aparte
  //para separar de donde esta funcion va a tomar video
  Future<void> loadNextPage() async {
    //Antes
    //  List<VideoPost> videosLoaded = videoPosts
    //         .map((resp) => LocalVideoModel.fromJson(resp).toVideoPostEntitie())
    //         .toList();

    //Ahora
    List<VideoPost> videosLoaded =
        await videoPostRepository.getTrendingVideos();

    listVideos.addAll(videosLoaded);

    loading = false;

    notifyListeners();
  }
}
