import 'package:sample_app/core/error/exceptions.dart';
import 'package:sample_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:sample_app/features/main_album/data/data_sources/main_album_data_sources.dart';
import 'package:sample_app/features/main_album/domain/entities/man_album_model_entity.dart';
import 'package:sample_app/features/main_album/domain/repositories/main_album_repositories.dart';

class MainAlbumRepositoriesImpl implements MainAlbumRepository {
  final MainAlbumDataSources mainAlbumDataSources;

  MainAlbumRepositoriesImpl({
    required this.mainAlbumDataSources,
  });

  @override
  Future<Either<Failure, List<MainAlbumModelEntity>>> getMainAlbum() async {
    try {
      final remoteData = await mainAlbumDataSources.getMainAlbum();
      return Right(remoteData);
    } on ServerException {
      return Left(ServerFailure());
    } on ApiException catch (e) {
      return Left(ApiFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<MainAlbumModelEntity>>> searchMainAlbum(String title) async {
    try {
      final remoteData = await mainAlbumDataSources.searchMainAlbum(title);
      return Right(remoteData);
    } on ServerException {
      return Left(ServerFailure());
    } on ApiException catch (e) {
      return Left(ApiFailure(e.message));
    }
  }
}
