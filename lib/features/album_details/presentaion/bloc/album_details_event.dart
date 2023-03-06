part of 'album_details_bloc.dart';

abstract class AlbumDetailsEvent extends Equatable {
  const AlbumDetailsEvent();

  @override
  List<Object> get props => [];
}

class AlbumDetailsEventUpdateEvent extends AlbumDetailsEvent {
  final int albumId;

  AlbumDetailsEventUpdateEvent(this.albumId);

  @override
  List<Object> get props => [albumId];
}
