import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/features/search/domain/repository/search_movies_repository.dart';
import 'package:smoth_movie_app/features/search/domain/usecase/get_search_movies.dart';

import '../../fixtures/movie_item_fixtures.dart';

class MockSearchMoviesRepository extends Mock implements SearchMoviesRepository {}

void main() {
  late MockSearchMoviesRepository repository;
  late GetSearchMovies useCase;

  setUpAll(() {
    registerFallbackValue(
      const SearchParams(query: '', page: 1, limit: 10),
    );
  });

  setUp(() {
    repository = MockSearchMoviesRepository();
    useCase = GetSearchMovies(searchMoviesRepository: repository);
  });

  group('GetSearchMovies', () {
    test('forwards query, page, and limit to repository', () async {
      const params = SearchParams(query: 'batman', page: 2, limit: 20);
      final items = fakeMovieItems(1);
      when(
        () => repository.getSearchMovies(
          query: any(named: 'query'),
          page: any(named: 'page'),
          limit: any(named: 'limit'),
        ),
      ).thenAnswer((_) async => Right(items));

      await useCase.call(params);

      verify(
        () => repository.getSearchMovies(
          query: 'batman',
          page: 2,
          limit: 20,
        ),
      ).called(1);
    });

    test('returns Right with list from repository', () async {
      const params = SearchParams(query: 'q', page: 1, limit: 10);
      final items = fakeMovieItems(2);
      when(
        () => repository.getSearchMovies(
          query: any(named: 'query'),
          page: any(named: 'page'),
          limit: any(named: 'limit'),
        ),
      ).thenAnswer((_) async => Right(items));

      final result = await useCase.call(params);

      expect(result, Right<Failure, dynamic>(items));
    });

    test('returns Left when repository returns failure', () async {
      const params = SearchParams(query: 'q', page: 1, limit: 10);
      const failure = Failure('network');
      when(
        () => repository.getSearchMovies(
          query: any(named: 'query'),
          page: any(named: 'page'),
          limit: any(named: 'limit'),
        ),
      ).thenAnswer((_) async => const Left(failure));

      final result = await useCase.call(params);

      expect(result, const Left<Failure, dynamic>(failure));
    });
  });
}
