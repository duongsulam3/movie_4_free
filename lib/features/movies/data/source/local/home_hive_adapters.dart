import 'package:hive/hive.dart';
import 'package:smoth_movie_app/features/movie_detail/data/model/category.dart';
import 'package:smoth_movie_app/features/movie_detail/data/model/country.dart';
import 'package:smoth_movie_app/features/movies/data/model/recently_update_movies/recently_update_list_item_model.dart';
import 'package:smoth_movie_app/features/movies/data/model/single_movies/movie_item_model.dart';

class CategoryModelAdapter extends TypeAdapter<CategoryModel> {
  @override
  final int typeId = 10;

  @override
  CategoryModel read(BinaryReader reader) {
    return CategoryModel(
      id: reader.readString(),
      name: reader.readString(),
      slug: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, CategoryModel obj) {
    writer
      ..writeString(obj.id)
      ..writeString(obj.name)
      ..writeString(obj.slug);
  }
}

class CountryModelAdapter extends TypeAdapter<CountryModel> {
  @override
  final int typeId = 11;

  @override
  CountryModel read(BinaryReader reader) {
    return CountryModel(
      id: reader.readString(),
      name: reader.readString(),
      slug: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, CountryModel obj) {
    writer
      ..writeString(obj.id)
      ..writeString(obj.name)
      ..writeString(obj.slug);
  }
}

class MovieItemModelAdapter extends TypeAdapter<MovieItemModel> {
  @override
  final int typeId = 12;

  @override
  MovieItemModel read(BinaryReader reader) {
    return MovieItemModel(
      sId: reader.readString(),
      name: reader.readString(),
      slug: reader.readString(),
      originName: reader.readString(),
      posterUrl: reader.readString(),
      thumbUrl: reader.readString(),
      year: reader.readInt(),
      time: reader.readString(),
      episodeCurrent: reader.readString(),
      quality: reader.readString(),
      lang: reader.readString(),
      type: reader.readString(),
      categories: (reader.readList()).cast<CategoryModel>(),
      countries: (reader.readList()).cast<CountryModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, MovieItemModel obj) {
    writer
      ..writeString(obj.sId)
      ..writeString(obj.name)
      ..writeString(obj.slug)
      ..writeString(obj.originName)
      ..writeString(obj.posterUrl)
      ..writeString(obj.thumbUrl)
      ..writeInt(obj.year)
      ..writeString(obj.time)
      ..writeString(obj.episodeCurrent)
      ..writeString(obj.quality)
      ..writeString(obj.lang)
      ..writeString(obj.type)
      ..writeList(obj.categories)
      ..writeList(obj.countries);
  }
}

class RecentlyUpdateListItemModelAdapter
    extends TypeAdapter<RecentlyUpdateListItemModel> {
  @override
  final int typeId = 13;

  @override
  RecentlyUpdateListItemModel read(BinaryReader reader) {
    return RecentlyUpdateListItemModel(
      sId: reader.readString(),
      name: reader.readString(),
      slug: reader.readString(),
      originName: reader.readString(),
      posterUrl: reader.readString(),
      thumbUrl: reader.readString(),
      year: reader.readInt(),
      time: reader.readString(),
      episodeCurrent: reader.readString(),
      quality: reader.readString(),
      lang: reader.readString(),
      type: reader.readString(),
      categories: (reader.readList()).cast<CategoryModel>(),
      countries: (reader.readList()).cast<CountryModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, RecentlyUpdateListItemModel obj) {
    writer
      ..writeString(obj.sId)
      ..writeString(obj.name)
      ..writeString(obj.slug)
      ..writeString(obj.originName)
      ..writeString(obj.posterUrl)
      ..writeString(obj.thumbUrl)
      ..writeInt(obj.year)
      ..writeString(obj.time)
      ..writeString(obj.episodeCurrent)
      ..writeString(obj.quality)
      ..writeString(obj.lang)
      ..writeString(obj.type)
      ..writeList(obj.categories)
      ..writeList(obj.countries);
  }
}
