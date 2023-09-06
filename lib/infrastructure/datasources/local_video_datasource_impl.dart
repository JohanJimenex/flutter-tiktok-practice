import 'package:toktik/domain/datasources/video_post_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_post.dart';

//Esta es una de las cuentes y pueden ser diferentes por ejemplo OnlineDatasource se crearia otra clase?
//pero todas deben implementar o extends (heredar) de la clase abstracta generica que es VideoPostDatasourcre
class LocalVideoDatasource implements VideoPostDatasource {
  @override
  Future<List<VideoPost>> getTrendingVideos() async {
    //Aquí es que va el codigo que buscara los videos en el local que será difernete al datasource que llama los videos online
    await Future.delayed(const Duration(seconds: 1));
    List<VideoPost> videosLoaded = videoPosts
        .map((resp) => LocalVideoModel.fromJson(resp).toVideoPostEntitie())
        .toList();

    return videosLoaded;
  }
}
