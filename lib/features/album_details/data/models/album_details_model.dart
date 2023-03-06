import 'package:sample_app/features/album_details/domain/entity/album_details_entity.dart';

class AlbumDetailsModel extends AlbumDetailsEntity {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  AlbumDetailsModel(
      {this.albumId, this.id, this.title, this.url, this.thumbnailUrl})
      : super(id: id, title: title);

  factory AlbumDetailsModel.fromJson(Map<String, dynamic> json) {
    return AlbumDetailsModel(
      id: json['id'],
      albumId: json['albumId'],
      title: json['title'],
      url: json['url'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}
