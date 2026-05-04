import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:smoth_movie_app/common/core/error/exception.dart';
import 'package:smoth_movie_app/features/search/data/repository/search_movies_repository_impl.dart';
import 'package:smoth_movie_app/features/search/data/source/remote/search_movie_remote_datasource.dart';

import '../../fixtures/movie_item_fixtures.dart';

class MockSearchMovieRemoteDataSource extends Mock
    implements SearchMovieRemoteDataSource {}

void main() {
  late MockSearchMovieRemoteDataSource remote;
  late SearchMoviesRepositoryImpl repository;

  setUp(() {
    remote = MockSearchMovieRemoteDataSource();
    repository = SearchMoviesRepositoryImpl(remoteDatasource: remote);
  });

  group('SearchMoviesRepositoryImpl', () {
    test('returns Right with remote data on success', () async {
      final models = fakeMovieItemModels(2);
      when(
        () => remote.getSearchMovies(
          query: any(named: 'query'),
          page: any(named: 'page'),
          limit: any(named: 'limit'),
        ),
      ).thenAnswer((_) async => models);

      final result = await repository.getSearchMovies(
        query: 'a',
        page: 1,
        limit: 10,
      );

      expect(result.isRight(), isTrue);
      result.fold(
        (_) => fail('expected Right'),
        (list) {
          expect(list.length, 2);
          expect(list.first.sId, models.first.sId);
        },
      );
    });

    test('returns Left Failure when remote throws ServerException', () async {
      when(
        () => remote.getSearchMovies(
          query: any(named: 'query'),
          page: any(named: 'page'),
          limit: any(named: 'limit'),
        ),
      ).thenThrow(const ServerException('server down'));

      final result = await repository.getSearchMovies(
        query: 'a',
        page: 1,
        limit: 10,
      );

      expect(result.isLeft(), isTrue);
      expect(
        result.fold((l) => l.message, (_) => ''),
        'server down',
      );
    });
  });
}
