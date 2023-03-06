part of 'main_album_bloc.dart';

abstract class MainAlbumEvent extends Equatable {
  const MainAlbumEvent();

  @override
  List<Object> get props => [];
}

class MainAlbumUpdateEvent extends MainAlbumEvent {

  MainAlbumUpdateEvent();

  @override
  List<Object> get props => [];
}

class SearchAlbumEvent extends MainAlbumEvent {
  String title;
  SearchAlbumEvent({required this.title});

  @override
  List<Object> get props => [title];
}
