import 'package:dartz/dartz.dart';
import 'package:sample_app/core/error/exceptions.dart';
import 'package:sample_app/core/error/failures.dart';
import 'package:sample_app/features/album_details/data/data_sources/album_details_data_source.dart';
import 'package:sample_app/features/album_details/domain/entity/album_details_entity.dart';
import 'package:sample_app/features/album_details/domain/repositories/album_details_repository.dart';

class AlbumDetailsRepositoryImpl implements AlbumDetailsRepository {
  final AlbumDetailsDataSource albumDetailsDataSource;
  AlbumDetailsRepositoryImpl({required this.albumDetailsDataSource});

  @override
  Future<Either<Failure, List<AlbumDetailsEntity>>> albumDeatails(
      int id) async {
    try {
      final remoteData = await albumDetailsDataSource.getAlbumDetails(id);
      return Right(remoteData);
    } on ServerException {
      return Left(ServerFailure());
    } on ApiException catch (e) {
      return Left(ApiFailure(e.message));
    }
  }
}
