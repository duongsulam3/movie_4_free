import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/exception.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/features/kho_phim/data/source/remote/countries_remote_data_source.dart';
import 'package:smoth_movie_app/features/kho_phim/domain/entity/kho_phim_country_entity.dart';
import 'package:smoth_movie_app/features/kho_phim/domain/repository/countries_repository.dart';

class CountriesRepositoryImpl implements CountriesRepository {
  final CountriesRemoteDataSource countriesRemoteDataSource;
  const CountriesRepositoryImpl(this.countriesRemoteDataSource);
  @override
  Future<Either<Failure, List<KhoPhimCountryEntity>>> getCountries() async {
    try {
      final res = await countriesRemoteDataSource.getCountries();
      return Right(res);
    } on ServerException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
