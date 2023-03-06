import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sample_app/core/error/failures.dart';
import 'package:sample_app/core/usecase/usecase.dart';
import 'package:sample_app/features/main_album/domain/entities/man_album_model_entity.dart';
import 'package:sample_app/features/main_album/domain/repositories/main_album_repositories.dart';

class SearchAlbumUseCase
    implements UseCase<List<MainAlbumModelEntity>, AlbumTitleParam> {
  final MainAlbumRepository mainAlbumRepository;

  SearchAlbumUseCase(this.mainAlbumRepository);

  @override
  Future<Either<Failure, List<MainAlbumModelEntity>>> call(
      AlbumTitleParam params) async {
    return await mainAlbumRepository.searchMainAlbum(params.title);
  }
}

class AlbumTitleParam extends Equatable {
  final String title;
  AlbumTitleParam({required this.title});

  @override
  // TODO: implement props
  List<Object?> get props => [title];
}
