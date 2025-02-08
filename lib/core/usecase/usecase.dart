import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/failure.dart';

abstract interface class Usecase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

abstract interface class UsecaseNoParams<SuccessType> {
  Future<Either<Failure, SuccessType>> call();
}
