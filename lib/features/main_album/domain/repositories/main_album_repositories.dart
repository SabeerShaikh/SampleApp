import 'package:dartz/dartz.dart';
import 'package:sample_app/core/error/failures.dart';
import 'package:sample_app/features/main_album/domain/entities/man_album_model_entity.dart';

abstract class MainAlbumRepository {
  Future<Either<Failure, List<MainAlbumModelEntity>>> getMainAlbum();

  Future<Either<Failure, List<MainAlbumModelEntity>>> searchMainAlbum(
      String title);
}
