
import 'package:dartz/dartz.dart';
import 'package:rickandmorty/core/error/failures.dart';
import 'package:rickandmorty/features/home/domain/entities/character.dart';
import 'package:rickandmorty/features/home/domain/repositories/character_repository.dart';

class GetCharactersUseCase {
  final CharacterRepository repository;

  GetCharactersUseCase(this.repository);

  Future<Either<Failure, List<CharacterEntity>>> call({String? status, int page = 1}) {
    return repository.fetchCharacters(status: status, page: page);
  }
}
