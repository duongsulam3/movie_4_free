import 'package:smoth_movie_app/features/movies/domain/entities/currently_update_movies/recently_update_list_item.dart';

class RecentlyUpdateListItemModel extends RecentlyUpdateListItemEntity {
  RecentlyUpdateListItemModel({
    required super.sId,
    required super.name,
    required super.slug,
    required super.originName,
    required super.posterUrl,
    required super.thumbUrl,
    required super.year,
  });

  // Map<String, dynamic> toJson() => {
  //       // 'modified': modified,
  //       '_id': sId,
  //       'name': name,
  //       'slug': slug,
  //       'origin_name': originName,
  //       'poster_url': posterUrl,
  //       'thumb_url': thumbUrl,
  //       'year': year,
  //     };

  factory RecentlyUpdateListItemModel.fromJson(Map<String, dynamic> json) {
    return RecentlyUpdateListItemModel(
      sId: json['_id'],
      name: json['name'],
      slug: json['slug'],
      originName: json['origin_name'],
      posterUrl: json['poster_url'],
      thumbUrl: json['thumb_url'],
      year: json['year'],
      // modified: json['modified'] != null
      //     ? new Modified.fromJson(json['modified'])
      //     : null
    );
  }
}
