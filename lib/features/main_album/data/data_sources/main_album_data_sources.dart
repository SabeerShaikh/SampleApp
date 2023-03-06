import 'package:sample_app/core/api_services/api_service.dart';
import 'package:sample_app/features/main_album/data/models/main_album_model.dart';

abstract class MainAlbumDataSources {
  Future<List<MainAlbumModel>> getMainAlbum();
    Future<List<MainAlbumModel>> searchMainAlbum(String title);

}

class MainAlbumDataSourcesImpl extends MainAlbumDataSources {
  final ApiService apiService;
  MainAlbumDataSourcesImpl(this.apiService);

  @override
  Future<List<MainAlbumModel>> getMainAlbum() async {
    final response = await apiService.getMainAlbum();

    return response;
  }

    @override
  Future<List<MainAlbumModel>> searchMainAlbum(String title) async {
    final response = await apiService.searchMainAlbum(title);

    return response;
  }
}
