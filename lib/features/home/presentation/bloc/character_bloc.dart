// presentation/bloc/character_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/core/error/failures.dart';
import 'package:rickandmorty/features/home/domain/entities/character.dart';
import 'package:rickandmorty/features/home/domain/usecases/get_character_detail_usecase.dart';
import 'package:rickandmorty/features/home/domain/usecases/get_characters_usecase.dart';
import 'character_event.dart';
import 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetCharactersUseCase getCharactersUseCase;

  CharacterBloc({required this.getCharactersUseCase, required GetCharacterDetailUseCase getCharacterDetailUseCase}) : super(CharacterInitial()) {
    on<FetchCharactersEvent>(_onFetchCharacters);
    on<ClearCharactersEvent>((_, emit) => emit(CharacterInitial()));
  }

  Future<void> _onFetchCharacters(FetchCharactersEvent event, Emitter<CharacterState> emit) async {
    if (state is CharacterLoading) return;

    final characters = state is CharacterLoaded ? (state as CharacterLoaded).characters : <CharacterEntity>[];
    final selectedStatus = event.status ?? (state is CharacterLoaded ? (state as CharacterLoaded).selectedStatus : 'All');
    final filterStatus = selectedStatus == 'All' ? null : selectedStatus;

    emit(CharacterLoading(
      characters: characters,
      selectedStatus: selectedStatus,
      isMoreLoading: event.page > 1,
    ));

    final eitherResponse = await getCharactersUseCase(status: filterStatus, page: event.page);
    eitherResponse.fold(
      (failure) => emit(CharacterError(_mapFailureToMessage(failure))),
      (characterEntities) => emit(CharacterLoaded(
        characters: [...characters, ...characterEntities],
        hasReachedMax: characterEntities.isEmpty,
        selectedStatus: selectedStatus,
      )),
    );
  }

  String _mapFailureToMessage(Failure failure) => failure is ServerFailure
      ? 'Failed to connect to the server.'
      : failure is CacheFailure
          ? 'Failed to load characters from cache.'
          : 'Unexpected error.';
}
