
import 'package:sample_app/features/main_album/domain/entities/man_album_model_entity.dart';

class MainAlbumModel extends MainAlbumModelEntity {
  int? userId;
  int? id;
  String? title;

  MainAlbumModel({this.userId, this.id, this.title})
      : super(id: id, title: title, userId: userId);

  factory MainAlbumModel.fromJson(dynamic json) {
    return MainAlbumModel(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
    );
  }
}
