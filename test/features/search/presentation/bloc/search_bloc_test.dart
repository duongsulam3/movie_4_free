import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smoth_movie_app/common/core/error/failure.dart';
import 'package:smoth_movie_app/common/core/utils/enum/search/search_page_status.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/movies_page/movie_item.dart';
import 'package:smoth_movie_app/features/search/domain/usecase/get_search_movies.dart';
import 'package:smoth_movie_app/features/search/domain/usecase/get_search_suggestions.dart';
import 'package:smoth_movie_app/features/search/presentation/bloc/search_bloc.dart';

import '../../fixtures/movie_item_fixtures.dart';

class MockGetSearchMovies extends Mock implements GetSearchMovies {}

class MockGetSearchSuggestions extends Mock implements GetSearchSuggestions {}

void main() {
  late MockGetSearchMovies getSearchMovies;
  late MockGetSearchSuggestions getSearchSuggestions;

  setUpAll(() {
    registerFallbackValue(
      const SearchParams(query: '', page: 1, limit: 10),
    );
  });

  setUp(() {
    getSearchMovies = MockGetSearchMovies();
    getSearchSuggestions = MockGetSearchSuggestions();
  });

  group('SearchBloc', () {
    blocTest<SearchBloc, SearchState>(
      'emits loading then error when use case returns Left',
      build: () {
        when(() => getSearchMovies.call(any())).thenAnswer(
          (_) async => const Left(Failure('e')),
        );
        return SearchBloc(
          getSearchMovies: getSearchMovies,
          getSearchSuggestions: getSearchSuggestions,
        );
      },
      act: (bloc) => bloc.add(GetSearchMoviesEvent(query: 'x', limit: 10)),
      expect: () => [
        const SearchState(
          SearchPageStatus.loading,
          1,
          '',
          <MovieItemEntity>[],
          false,
        ),
        const SearchState(
          SearchPageStatus.error,
          1,
          '',
          <MovieItemEntity>[],
          false,
        ),
      ],
    );

    blocTest<SearchBloc, SearchState>(
      'emits loading then success with isEnd when result length is less than limit',
      build: () {
        when(() => getSearchMovies.call(any())).thenAnswer(
          (_) async => Right(fakeMovieItems(3)),
        );
        return SearchBloc(
          getSearchMovies: getSearchMovies,
          getSearchSuggestions: getSearchSuggestions,
        );
      },
      act: (bloc) => bloc.add(GetSearchMoviesEvent(query: 'a', limit: 10)),
      expect: () => [
        const SearchState(
          SearchPageStatus.loading,
          1,
          '',
          <MovieItemEntity>[],
          false,
        ),
        predicate<SearchState>(
          (s) =>
              s.status == SearchPageStatus.success &&
              s.page == 1 &&
              s.query == 'a' &&
              s.movies.length == 3 &&
              s.isEnd == true,
        ),
      ],
    );

    blocTest<SearchBloc, SearchState>(
      'emits loading then success and increments page when result length equals limit',
      build: () {
        when(() => getSearchMovies.call(any())).thenAnswer(
          (_) async => Right(fakeMovieItems(10)),
        );
        return SearchBloc(
          getSearchMovies: getSearchMovies,
          getSearchSuggestions: getSearchSuggestions,
        );
      },
      act: (bloc) => bloc.add(GetSearchMoviesEvent(query: 'b', limit: 10)),
      expect: () => [
        const SearchState(
          SearchPageStatus.loading,
          1,
          '',
          <MovieItemEntity>[],
          false,
        ),
        predicate<SearchState>(
          (s) =>
              s.status == SearchPageStatus.success &&
              s.page == 2 &&
              s.query == 'b' &&
              s.movies.length == 10 &&
              s.isEnd == false,
        ),
      ],
    );

    blocTest<SearchBloc, SearchState>(
      'appends movies for same query on next page',
      build: () {
        when(() => getSearchMovies.call(any())).thenAnswer((invocation) async {
          final params = invocation.positionalArguments.first as SearchParams;
          if (params.page == 1) {
            return Right(fakeMovieItems(10));
          }
          return Right(fakeMovieItems(3));
        });
        return SearchBloc(
          getSearchMovies: getSearchMovies,
          getSearchSuggestions: getSearchSuggestions,
        );
      },
      act: (bloc) async {
        bloc.add(GetSearchMoviesEvent(query: 'a', limit: 10));
        await bloc.stream.firstWhere(
          (s) =>
              s.status == SearchPageStatus.success &&
              s.movies.length == 10 &&
              s.page == 2,
        );
        bloc.add(GetSearchMoviesEvent(query: 'a', limit: 10));
      },
      expect: () => [
        const SearchState(
          SearchPageStatus.loading,
          1,
          '',
          <MovieItemEntity>[],
          false,
        ),
        predicate<SearchState>(
          (s) =>
              s.status == SearchPageStatus.success &&
              s.page == 2 &&
              s.query == 'a' &&
              s.movies.length == 10 &&
              s.isEnd == false,
        ),
        predicate<SearchState>(
          (s) =>
              s.status == SearchPageStatus.success &&
              s.page == 2 &&
              s.query == 'a' &&
              s.movies.length == 13 &&
              s.isEnd == true,
        ),
      ],
    );

    blocTest<SearchBloc, SearchState>(
      'when isEnd is true, emits success with isEnd false then appends on same query',
      build: () {
        when(() => getSearchMovies.call(any())).thenAnswer(
          (_) async => Right(fakeMovieItems(1)),
        );
        return SearchBloc(
          getSearchMovies: getSearchMovies,
          getSearchSuggestions: getSearchSuggestions,
        );
      },
      seed: () => SearchState(
        SearchPageStatus.success,
        1,
        'a',
        fakeMovieItems(1),
        true,
      ),
      act: (bloc) => bloc.add(GetSearchMoviesEvent(query: 'a', limit: 10)),
      expect: () => [
        predicate<SearchState>(
          (s) =>
              s.status == SearchPageStatus.success &&
              s.page == 1 &&
              s.query == 'a' &&
              s.movies.length == 1 &&
              s.isEnd == false,
        ),
        predicate<SearchState>(
          (s) =>
              s.status == SearchPageStatus.success &&
              s.page == 1 &&
              s.query == 'a' &&
              s.movies.length == 2 &&
              s.isEnd == true,
        ),
      ],
    );
  });
}
