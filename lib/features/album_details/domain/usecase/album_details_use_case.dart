import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sample_app/core/error/failures.dart';
import 'package:sample_app/core/usecase/usecase.dart';
import 'package:sample_app/features/album_details/domain/entity/album_details_entity.dart';
import 'package:sample_app/features/album_details/domain/repositories/album_details_repository.dart';

class AlbumDetailsUseCase
    implements UseCase<List<AlbumDetailsEntity>, AlbumIdParam> {
  final AlbumDetailsRepository albumDetailsRepository;

  AlbumDetailsUseCase(this.albumDetailsRepository);

  @override
  Future<Either<Failure, List<AlbumDetailsEntity>>> call(
      AlbumIdParam params) async {
    return await albumDetailsRepository.albumDeatails(params.albumId);
  }
}

class AlbumIdParam extends Equatable {
  final int albumId;
  AlbumIdParam({required this.albumId});

  @override
  // TODO: implement props
  List<Object?> get props => [albumId];
}
