import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:sample_app/core/const/string_constant.dart';
import 'package:sample_app/core/error/failures.dart';
import 'package:sample_app/core/usecase/usecase.dart';
import 'package:sample_app/features/main_album/domain/entities/man_album_model_entity.dart';
import 'package:sample_app/features/main_album/domain/usecase/main_album_use_case.dart';
import 'package:sample_app/features/main_album/domain/usecase/search_album_use_case.dart';

part 'main_album_event.dart';

part 'main_album_state.dart';

class MainAlbumBloc extends Bloc<MainAlbumEvent, MainAlbumState> {
  final MainAlbumUseCase mainAlbumUseCase;
  final SearchAlbumUseCase searchAlbumUseCase;

  MainAlbumBloc({
    required this.mainAlbumUseCase,
    required this.searchAlbumUseCase,
  }) : super(MainAlbumInitial());

  MainAlbumInitial get initialState => MainAlbumInitial();

  @override
  Stream<MainAlbumState> mapEventToState(
    MainAlbumEvent event,
  ) async* {
    if (event is SearchAlbumEvent) {
      final result =
          await searchAlbumUseCase(AlbumTitleParam(title: event.title));

      yield result.fold(
          (failure) => ErrorState(message: _mapFailureToMessage(failure)),
          (mainAlbumModelEntity) =>
              SearchAlbumState(mainAlbumModelEntity: mainAlbumModelEntity));
    }
    if (event is MainAlbumUpdateEvent) {
      yield LoadingState();
      final result = await mainAlbumUseCase(NoParams());

      yield result.fold(
          (failure) => ErrorState(message: _mapFailureToMessage(failure)),
          (mainAlbumModelEntity) =>
              MainAlbumLoadedState(mainAlbumModelEntity: mainAlbumModelEntity));
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
