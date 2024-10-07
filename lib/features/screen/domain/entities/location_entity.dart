// location_entity.dart
import 'package:equatable/equatable.dart';

// Основная сущность Location для представления данных на уровне бизнес-логики.
class LocationEntity extends Equatable {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<String> residents;
  final String url;
  final DateTime created;

  const LocationEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
    required this.created,
  });

  @override
  List<Object?> get props => [id, name, type, dimension, residents, url, created];
}

// Сущность для представления информации о страницах и навигации.
class InfoEntity extends Equatable {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  const InfoEntity({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  @override
  List<Object?> get props => [count, pages, next, prev];
}

// Сущность для представления общего ответа с локациями и информацией о страницах.
class LocationResponseEntity extends Equatable {
  final InfoEntity info;
  final List<LocationEntity> results;

  const LocationResponseEntity({
    required this.info,
    required this.results,
  });

  @override
  List<Object?> get props => [info, results];
}
