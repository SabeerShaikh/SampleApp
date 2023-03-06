import 'package:sample_app/core/api_services/api_service.dart';
import 'package:sample_app/features/album_details/data/models/album_details_model.dart';

abstract class AlbumDetailsDataSource {
  Future<List<AlbumDetailsModel>> getAlbumDetails(int id);
}

class AlbumDetailsDataSourceImpl implements AlbumDetailsDataSource {
  final ApiService apiService;
  AlbumDetailsDataSourceImpl(this.apiService);

  @override
  Future<List<AlbumDetailsModel>> getAlbumDetails(int id) async {
    final response = await apiService.getAlbumDetails(id);
    return response;
  }
}
