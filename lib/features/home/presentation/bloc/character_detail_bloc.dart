// presentation/bloc/character_detail_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/core/error/failures.dart';
import 'package:rickandmorty/features/home/domain/usecases/get_character_detail_usecase.dart';
import 'character_detail_event.dart';
import 'character_detail_state.dart';

class CharacterDetailBloc extends Bloc<CharacterDetailEvent, CharacterDetailState> {
  final GetCharacterDetailUseCase getCharacterDetailUseCase;

  CharacterDetailBloc({required this.getCharacterDetailUseCase}) : super(CharacterDetailInitial()) {
    on<FetchCharacterDetailEvent>(_onFetchCharacterDetail);
  }

  Future<void> _onFetchCharacterDetail(FetchCharacterDetailEvent event, Emitter<CharacterDetailState> emit) async {
    emit(CharacterDetailLoading());

    // Используем usecase для получения сущности персонажа
    final result = await getCharacterDetailUseCase(event.id);
    result.fold(
      (failure) => emit(CharacterDetailError(_mapFailureToMessage(failure))),
      (character) => emit(CharacterDetailLoaded(character: character)),
    );
  }

  String _mapFailureToMessage(Failure failure) => failure is ServerFailure ? 'Server Failure' : 'Cache Failure';
}
