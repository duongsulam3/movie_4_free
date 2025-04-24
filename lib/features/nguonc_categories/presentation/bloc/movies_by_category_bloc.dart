import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smoth_movie_app/core/utils/enum/movies_state_status.dart';
import 'package:smoth_movie_app/features/nguonc_categories/domain/entity/nguonc_movies_by_category_item_entity.dart';
import 'package:smoth_movie_app/features/nguonc_categories/domain/usecase/nguonc_get_movies_by_cate.dart';

part 'movies_by_category_event.dart';
part 'movies_by_category_state.dart';
part 'movies_by_category_bloc.freezed.dart';

class MoviesByCategoryBloc
    extends Bloc<MoviesByCategoryEvent, MoviesByCategoryState> {
  final NguoncGetMoviesByCate usecase;
  MoviesByCategoryBloc(this.usecase) : super(const MoviesByCategoryState()) {
    on<GetMoviesByCategory>((event, emit) async {
      log(event.slug);
      final res = await usecase.call(NguoncGetMoviesByCateParams(
        slug: event.slug,
        page: event.page,
      ));
      res.fold(
        (err) => emit(state.copyWith(status: MoviesStateStatus.error)),
        (data) {
          if (data.isEmpty) return;
          emit(state.copyWith(
            status: MoviesStateStatus.success,
            movies: data,
          ));
        },
      );
    });
  }
}
