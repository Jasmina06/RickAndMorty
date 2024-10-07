import 'package:dartz/dartz.dart';
import 'package:rickandmorty/core/error/failures.dart';
import 'package:rickandmorty/features/screen/domain/entities/location_entity.dart';
import 'package:rickandmorty/features/screen/domain/repositories/location_repository.dart';

class GetLocationsUseCase {
  final LocationRepository repository;

  GetLocationsUseCase(this.repository);

  // Используем Params для передачи номера страницы
  Future<Either<Failure, LocationResponseEntity>> call(Params params) async {
    return await repository.fetchLocations(params.page);
  }
}

// Вспомогательный класс Params для передачи параметра `page`
class Params {
  final int page;

  const Params({required this.page});
}
