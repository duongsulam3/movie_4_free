import 'package:smoth_movie_app/features/movie_detail/data/model/category.dart';
import 'package:smoth_movie_app/features/movie_detail/data/model/country.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/category.dart';
import 'package:smoth_movie_app/features/movie_detail/domain/entities/country.dart';
import 'package:smoth_movie_app/features/movies/data/model/single_movies/movie_item_model.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';

/// Minimal valid [MovieItemEntity] for search feature unit tests.
MovieItemEntity fakeMovieItem({String? sId, String? name}) {
  return MovieItemEntity(
    sId: sId ?? 'id1',
    name: name ?? 'Movie',
    slug: 'slug',
    originName: 'origin',
    posterUrl: '',
    thumbUrl: '',
    episodeCurrent: '1',
    quality: 'HD',
    lang: 'vi',
    time: '120',
    year: 2024,
    type: 'movie',
    categories: const <CategoryEntity>[],
    countries: const <CountryEnity>[],
  );
}

/// [MovieItemModel] aligned with [fakeMovieItem] for repository/datasource tests.
MovieItemModel fakeMovieItemModel({String? sId, String? name}) {
  return MovieItemModel(
    sId: sId ?? 'id1',
    name: name ?? 'Movie',
    slug: 'slug',
    originName: 'origin',
    posterUrl: '',
    thumbUrl: '',
    episodeCurrent: '1',
    quality: 'HD',
    lang: 'vi',
    time: '120',
    year: 2024,
    type: 'movie',
    categories: <CategoryModel>[],
    countries: <CountryModel>[],
  );
}

List<MovieItemEntity> fakeMovieItems(int count) {
  return List<MovieItemEntity>.generate(
    count,
    (i) => fakeMovieItem(sId: 'id$i', name: 'M$i'),
  );
}

List<MovieItemModel> fakeMovieItemModels(int count) {
  return List<MovieItemModel>.generate(
    count,
    (i) => fakeMovieItemModel(sId: 'id$i', name: 'M$i'),
  );
}
