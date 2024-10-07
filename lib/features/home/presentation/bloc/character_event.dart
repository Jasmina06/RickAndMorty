// character_event.dart
import 'package:equatable/equatable.dart';

abstract class CharacterEvent extends Equatable {
  const CharacterEvent();

  @override
  List<Object?> get props => [];
}

class FetchCharactersEvent extends CharacterEvent {
  final String? status;
  final int page;

  const FetchCharactersEvent({this.status, this.page = 1});

  @override
  List<Object?> get props => [status, page];
}

class ClearCharactersEvent extends CharacterEvent {}
