part of 'main_album_bloc.dart';

abstract class MainAlbumState extends Equatable {
  const MainAlbumState();

  @override
  List<Object> get props => [];
}

class MainAlbumInitial extends MainAlbumState {}

class LoadingState extends MainAlbumState {}

class MainAlbumLoadedState extends MainAlbumState {
  final List<MainAlbumModelEntity> mainAlbumModelEntity;

  MainAlbumLoadedState({required this.mainAlbumModelEntity});

  @override
  List<Object> get props => [mainAlbumModelEntity];
}

class SearchAlbumState extends MainAlbumState {
  final List<MainAlbumModelEntity> mainAlbumModelEntity;

  SearchAlbumState({required this.mainAlbumModelEntity});

  @override
  List<Object> get props => [mainAlbumModelEntity];
}

class ErrorState extends MainAlbumState {
  final String message;

  ErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
