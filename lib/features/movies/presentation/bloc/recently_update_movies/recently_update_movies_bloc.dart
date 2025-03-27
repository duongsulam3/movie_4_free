import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smoth_movie_app/core/utils/enum/movies_state_status.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/currently_update_movies/recently_update_list_item.dart';
import 'package:smoth_movie_app/features/movies/domain/usecase/get_recently_movies.dart';

part 'recently_update_movies_event.dart';
part 'recently_update_movies_state.dart';
part 'recently_update_movies_bloc.freezed.dart';

class RecentlyUpdateMoviesBloc
    extends Bloc<RecentlyUpdateMoviesEvent, RecentlyUpdateMoviesState> {
  final GetRecentlyMovies getRecentlyMovies;
  RecentlyUpdateMoviesBloc(this.getRecentlyMovies)
      : super(const RecentlyUpdateMoviesState()) {
    on<GetRecentlyUpdateMovies>((event, emit) async {
      List<RecentlyUpdateListItemEntity> movies = [];
      final res = await getRecentlyMovies.call(const GetRecentlyMoviesParams());
      res.fold(
        (err) => emit(state.copyWith(status: MoviesStateStatus.error)),
        (data) {
          movies = data;
          emit(state.copyWith(
            status: MoviesStateStatus.success,
            movies: movies,
          ));
        },
      );
    });
  }
}
