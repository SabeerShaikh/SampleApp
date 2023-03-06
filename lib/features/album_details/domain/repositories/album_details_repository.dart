import 'package:dartz/dartz.dart';
import 'package:sample_app/core/error/failures.dart';
import 'package:sample_app/features/album_details/domain/entity/album_details_entity.dart';

abstract class AlbumDetailsRepository {
  Future<Either<Failure, List<AlbumDetailsEntity>>> albumDeatails(int id);
}