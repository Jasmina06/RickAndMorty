import 'package:equatable/equatable.dart';

// Базовый класс для всех событий Location
abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object?> get props => [];
}

// Событие для получения списка локаций с использованием номера страницы
class FetchLocationsEvent extends LocationEvent {
  final int page;

  // Обязательно используем именованный параметр и добавляем проверку assert
  const FetchLocationsEvent({required this.page}) : assert(page > 0, 'Page number must be greater than 0');

  @override
  List<Object?> get props => [page];
}
