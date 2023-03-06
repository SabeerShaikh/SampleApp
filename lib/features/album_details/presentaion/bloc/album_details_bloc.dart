import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:sample_app/core/const/string_constant.dart';
import 'package:sample_app/core/error/failures.dart';
import 'package:sample_app/features/album_details/domain/entity/album_details_entity.dart';
import 'package:sample_app/features/album_details/domain/usecase/album_details_use_case.dart';

part 'album_details_event.dart';

part 'album_details_state.dart';

class AlbumDetailsBloc extends Bloc<AlbumDetailsEvent, AlbumDetailsState> {
  final AlbumDetailsUseCase detailsUseCase;

  AlbumDetailsBloc({
    required this.detailsUseCase,
  }) : super(MainAlbumInitial());

  MainAlbumInitial get initialState => MainAlbumInitial();

  @override
  Stream<AlbumDetailsState> mapEventToState(
    AlbumDetailsEvent event,
  ) async* {
    if (event is AlbumDetailsEventUpdateEvent) {
      yield LoadingState();
      // print(event);
      final result = await detailsUseCase(AlbumIdParam(albumId: event.albumId));

      yield result.fold(
          (failure) => ErrorState(message: _mapFailureToMessage(failure)),
          (albumDetailsEntity) =>
              AlbumDetailsLoadedState(albumDetailsEntity: albumDetailsEntity));
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return STRING_SERVER_FAILURE_MESSAGE;
      case ApiFailure:
        return (failure as ApiFailure).message;
      default:
        return STRING_GENERAL_UNEXPECCTED_ERROR;
    }
  }
}
