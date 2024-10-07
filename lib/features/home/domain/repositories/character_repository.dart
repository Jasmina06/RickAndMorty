// domain/repositories/character_repository.dart

import 'package:dartz/dartz.dart';
import 'package:rickandmorty/core/error/failures.dart';
import 'package:rickandmorty/features/home/domain/entities/character.dart';


abstract interface class CharacterRepository {
  Future<Either<Failure, List<CharacterEntity>>> fetchCharacters({String? status, int page = 1});
  Future<Either<Failure, CharacterEntity>> getCharacter(int id);
}
