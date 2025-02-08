class TmdbEntity {
  dynamic type;
  dynamic id;
  dynamic season;
  // int voteAverage;
  int voteCount;
  

  TmdbEntity({
    this.type,
    this.id,
    this.season,
    // required this.voteAverage,
    required this.voteCount,
  });
}
