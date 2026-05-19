import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/common/error/failure.dart';
import 'package:smoth_movie_app/common/usecase/usecase.dart';
import 'package:smoth_movie_app/features/search/domain/repository/search_history_repository.dart';

class ClearSearchHistory implements UsecaseNoParams<void> {
  final SearchHistoryRepository repository;

  const ClearSearchHistory({required this.repository});

  @override
  Future<Either<Failure, void>> call() async {
    return await repository.clearHistory();
  }
}
