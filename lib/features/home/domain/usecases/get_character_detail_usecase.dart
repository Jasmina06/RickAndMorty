import 'package:dartz/dartz.dart';
import 'package:rickandmorty/core/error/failures.dart';
import 'package:rickandmorty/features/home/domain/entities/character.dart';
import 'package:rickandmorty/features/home/domain/repositories/character_repository.dart';

class GetCharacterDetailUseCase {
  final CharacterRepository repository;

  GetCharacterDetailUseCase(this.repository);

  Future<Either<Failure, CharacterEntity>> call(int id) {
    return repository.getCharacter(id);
  }
}
