class RecentlyUpdateListItemEntity {
  // Modified? modified;
  final String sId;
  final String name;
  final String slug;
  final String originName;
  final String posterUrl;
  final String thumbUrl;
  final int year;

  RecentlyUpdateListItemEntity({
    required this.sId,
    required this.name,
    required this.slug,
    required this.originName,
    required this.posterUrl,
    required this.thumbUrl,
    required this.year,
  });
}
