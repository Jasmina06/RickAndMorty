
import 'package:dartz/dartz.dart';
import 'package:rickandmorty/core/error/failures.dart';
import 'package:rickandmorty/features/screen/domain/entities/location_entity.dart';

// Объявление абстрактного репозитория для локаций
abstract class LocationRepository {
  // Указываем корректную сигнатуру метода с единственным параметром page
  Future<Either<Failure, LocationResponseEntity>> fetchLocations(int page);
}
