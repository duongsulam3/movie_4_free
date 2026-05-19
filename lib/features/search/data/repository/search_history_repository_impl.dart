import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/common/error/exception.dart';
import 'package:smoth_movie_app/common/error/failure.dart';
import 'package:smoth_movie_app/features/search/data/source/local/search_history_local_data_source.dart';
import 'package:smoth_movie_app/features/search/domain/repository/search_history_repository.dart';

class SearchHistoryRepositoryImpl implements SearchHistoryRepository {
  SearchHistoryRepositoryImpl({required this.localDataSource});

  final SearchHistoryLocalDataSource localDataSource;

  @override
  Future<Either<Failure, List<String>>> getHistory() async {
    try {
      final result = await localDataSource.getHistory();
      return Right(result);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> saveKeyword(String keyword) async {
    try {
      await localDataSource.saveKeyword(keyword);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteKeyword(String keyword) async {
    try {
      await localDataSource.deleteKeyword(keyword);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> clearHistory() async {
    try {
      await localDataSource.clearHistory();
      return const Right(null);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
