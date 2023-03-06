import 'package:equatable/equatable.dart';

class AlbumDetailsEntity extends Equatable {
  int? id;
  String? title;

  AlbumDetailsEntity({
    required this.id,
    required this.title,
  });

  @override
  List<Object?> get props => [this.id, this.title,];

  @override
  bool? get stringify => true;
}
