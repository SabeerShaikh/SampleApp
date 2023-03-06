import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:sample_app/features/album_details/data/models/album_details_model.dart';
import 'package:sample_app/features/main_album/data/models/main_album_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com")
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET("/albums")
  Future<List<MainAlbumModel>> getMainAlbum();

  @GET("/albums")
  Future<List<MainAlbumModel>> searchMainAlbum(@Query("title") String title);

  @GET("/albums/{id}/photos")
  Future<List<AlbumDetailsModel>> getAlbumDetails(@Path("id") int id);
}
