import 'package:equatable/equatable.dart';

class MainAlbumModelEntity extends Equatable {
  int? id;
  String? title;
  int? userId;

  MainAlbumModelEntity({
    required this.id,
    required this.title,
    required this.userId,
  });

  @override
  List<Object?> get props => [this.id, this.title, this.userId];

  @override
  bool? get stringify => true;
}
