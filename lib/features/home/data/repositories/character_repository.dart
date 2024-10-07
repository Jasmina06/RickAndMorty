// data/repositories/character_repository_impl.dart

import 'package:dartz/dartz.dart';
import 'package:rickandmorty/core/error/exeption.dart';
import 'package:rickandmorty/core/error/failures.dart';
import 'package:rickandmorty/features/home/data/datasources/character_local_datasource.dart';
import 'package:rickandmorty/features/home/data/datasources/character_remote_datasource.dart';
import 'package:rickandmorty/features/home/domain/entities/character.dart';
import 'package:rickandmorty/features/home/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterRemoteDataSource remoteDataSource;
  final CharacterLocalDataSource localDataSource;

  CharacterRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<CharacterEntity>>> fetchCharacters({
    String? status,
    int page = 1,
  }) async {
    try {
      // Получаем список сущностей персонажей напрямую из удаленного источника
      final characterEntities = await remoteDataSource.getCharacters(status: status, page: page);
      
      // Возвращаем список сущностей
      return Right(characterEntities);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, CharacterEntity>> getCharacter(int id) async {
    try {
      // Получаем сущность персонажа напрямую из удаленного источника
      final characterEntity = await remoteDataSource.getCharacter(id);
      return Right(characterEntity);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }
}
