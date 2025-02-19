import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/features/movies/data/model/single_movies/single_movie_item.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';

part 'movies_bloc_event.dart';
part 'movies_bloc_state.dart';

class MoviesBlocBloc extends Bloc<MoviesBlocEvent, MoviesBlocState> {
  final http.Client httpClient;
  MoviesBlocBloc({required this.httpClient}) : super(const MoviesBlocState()) {
    on<MovieBlocEventFetch>((event, emit) async {
      if (state.hasReachedMax) return;
      try {
        final movies = await _fetchMovies(startPage: state.page);
        if (movies.isEmpty) {
          return emit(state.copyWith(hasReachedMax: true));
        }
        emit(
          state.copyWith(
            status: MovieStatus.success,
            page: state.page + event.page,
            movies: [...state.movies, ...movies],
          ),
        );
      } catch (e) {
        emit(state.copyWith(status: MovieStatus.failure));
      }
    });
  }

  Future<List<MovieItemEntity>> _fetchMovies({required int startPage}) async {
    List<MovieItemEntity> data = [];
    var uri = Uri.parse(
        "https://phimapi.com/v1/api/danh-sach/hoat-hinh?page=$startPage");
    final res = await httpClient.get(uri);
    if (res.statusCode == 200) {
      var jsonResponse = jsonDecode(res.body)["data"]["items"];
      for (var item in jsonResponse) {
        data.add(MovieItemModel.fromJson(item));
      }
      return data;
    } else {
      throw const ServerException("Lỗi khi lấy dữ liệu phim hoạt hình");
    }
  }
}
