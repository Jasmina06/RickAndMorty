import 'package:dartz/dartz.dart';
import 'package:rickandmorty/core/error/exeption.dart';
import 'package:rickandmorty/core/error/failures.dart';
import 'package:rickandmorty/features/screen/data/datasources/location_remote_datasource.dart';
import 'package:rickandmorty/features/screen/domain/entities/location_entity.dart';
import 'package:rickandmorty/features/screen/domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDataSource remoteDataSource;

  LocationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, LocationResponseEntity>> fetchLocations(int page) async {
    try {
      // Запрашиваем данные с удаленного источника с параметром page
      final remoteLocations = await remoteDataSource.fetchLocations(page: page);

      // Преобразуем модели данных в сущности для доменного слоя
      final locations = remoteLocations.results
          .map((locationModel) => LocationEntity(
                id: locationModel.id,
                name: locationModel.name,
                type: locationModel.type,
                dimension: locationModel.dimension,
                residents: locationModel.residents,
                url: locationModel.url,
                created: locationModel.created,
              ))
          .toList();

      // Создаем InfoEntity для возвращаемой сущности
      final info = InfoEntity(
        count: remoteLocations.info.count,
        pages: remoteLocations.info.pages,
        next: remoteLocations.info.next,
        prev: remoteLocations.info.prev,
      );

      // Возвращаем результат с использованием сущности LocationResponseEntity
      return Right(LocationResponseEntity(info: info, results: locations));
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }
}
