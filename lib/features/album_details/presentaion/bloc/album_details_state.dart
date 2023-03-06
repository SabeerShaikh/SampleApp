part of 'album_details_bloc.dart';

abstract class AlbumDetailsState extends Equatable {
  const AlbumDetailsState();

  @override
  List<Object> get props => [];
}

class MainAlbumInitial extends AlbumDetailsState {}

class LoadingState extends AlbumDetailsState {}

class AlbumDetailsLoadedState extends AlbumDetailsState {
  final List<AlbumDetailsEntity> albumDetailsEntity;

  AlbumDetailsLoadedState({required this.albumDetailsEntity});

  @override
  List<Object> get props => [albumDetailsEntity];
}

class ErrorState extends AlbumDetailsState {
  final String message;

  ErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
