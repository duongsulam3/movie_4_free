import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/common/error/failure.dart';
import 'package:smoth_movie_app/common/usecase/usecase.dart';
import 'package:smoth_movie_app/features/search/domain/repository/search_history_repository.dart';

class DeleteSearchKeyword implements Usecase<void, DeleteSearchKeywordParams> {
  final SearchHistoryRepository repository;

  const DeleteSearchKeyword({required this.repository});

  @override
  Future<Either<Failure, void>> call(DeleteSearchKeywordParams params) async {
    return await repository.deleteKeyword(params.keyword);
  }
}

class DeleteSearchKeywordParams {
  final String keyword;

  const DeleteSearchKeywordParams({required this.keyword});
}
