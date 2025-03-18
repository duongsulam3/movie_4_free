import 'package:dartz/dartz.dart';
import 'package:smoth_movie_app/core/error/failure.dart';
import 'package:smoth_movie_app/core/usecase/usecase.dart';
import 'package:smoth_movie_app/features/kho_phim/domain/entity/kho_phim_country_entity.dart';
import 'package:smoth_movie_app/features/kho_phim/domain/repository/countries_repository.dart';

class GetCountries implements UsecaseNoParams {
  final CountriesRepository countriesRepository;
  const GetCountries(this.countriesRepository);
  @override
  Future<Either<Failure, List<KhoPhimCountryEntity>>> call() async {
    return await countriesRepository.getCountries();
  }
}
