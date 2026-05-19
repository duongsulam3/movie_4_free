import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/common/error/failure.dart';
import 'package:smoth_movie_app/common/usecase/usecase.dart';
import 'package:smoth_movie_app/features/search/domain/repository/search_history_repository.dart';

class SaveSearchKeyword implements Usecase<void, SaveSearchKeywordParams> {
  final SearchHistoryRepository repository;

  const SaveSearchKeyword({required this.repository});

  @override
  Future<Either<Failure, void>> call(SaveSearchKeywordParams params) async {
    return await repository.saveKeyword(params.keyword);
  }
}

class SaveSearchKeywordParams {
  final String keyword;

  const SaveSearchKeywordParams({required this.keyword});
}
