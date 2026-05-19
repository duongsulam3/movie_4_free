import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/common/error/failure.dart';
import 'package:smoth_movie_app/common/usecase/usecase.dart';
import 'package:smoth_movie_app/features/search/domain/repository/search_history_repository.dart';

class GetSearchHistory implements UsecaseNoParams<List<String>> {
  final SearchHistoryRepository repository;

  const GetSearchHistory({required this.repository});

  @override
  Future<Either<Failure, List<String>>> call() async {
    return await repository.getHistory();
  }
}
