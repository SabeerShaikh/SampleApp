import 'package:dartz/dartz.dart';
import 'package:sample_app/core/error/failures.dart';
import 'package:sample_app/core/usecase/usecase.dart';
import 'package:sample_app/features/main_album/domain/entities/man_album_model_entity.dart';
import 'package:sample_app/features/main_album/domain/repositories/main_album_repositories.dart';

class MainAlbumUseCase
    implements UseCase<List<MainAlbumModelEntity>, NoParams> {
  final MainAlbumRepository mainAlbumRepository;

  MainAlbumUseCase(this.mainAlbumRepository);

  @override
  Future<Either<Failure, List<MainAlbumModelEntity>>> call(
      NoParams params) async {
    return await mainAlbumRepository.getMainAlbum();
  }
}
