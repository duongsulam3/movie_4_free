import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/common/error/failure.dart';

abstract interface class SearchHistoryRepository {
  Future<Either<Failure, List<String>>> getHistory();
  Future<Either<Failure, void>> saveKeyword(String keyword);
  Future<Either<Failure, void>> deleteKeyword(String keyword);
  Future<Either<Failure, void>> clearHistory();
}
