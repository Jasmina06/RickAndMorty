
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rickandmorty/features/home/domain/entities/character.dart';

part 'character_model.freezed.dart';
part 'character_model.g.dart';

@freezed
class CharacterModel with _$CharacterModel {
  const factory CharacterModel({
    required int id,
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
    required OriginModel origin,
    required LocationModel location,
    required String image,
    required List<String> episode,
    required String url,
    required DateTime created,
  }) = _CharacterModel;

  factory CharacterModel.fromJson(Map<String, dynamic> json) => _$CharacterModelFromJson(json);
}

@freezed
class OriginModel with _$OriginModel {
  const factory OriginModel({
    required String name,
    required String url,
  }) = _OriginModel;

  factory OriginModel.fromJson(Map<String, dynamic> json) => _$OriginModelFromJson(json);
}

@freezed
class LocationModel with _$LocationModel {
  const factory LocationModel({
    required String name,
    required String url,
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);
}

@freezed
class InfoModel with _$InfoModel {
  const factory InfoModel({
    required int count,
    required int pages,
    String? next,
    String? prev,
  }) = _InfoModel;

  factory InfoModel.fromJson(Map<String, dynamic> json) => _$InfoModelFromJson(json);
}

@freezed
class RickAndMortyResponseModel with _$RickAndMortyResponseModel {
  const factory RickAndMortyResponseModel({
    required InfoModel info,
    required List<CharacterModel> results,
  }) = _RickAndMortyResponseModel;

  factory RickAndMortyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RickAndMortyResponseModelFromJson(json);
}

// Create a method to convert CharacterModel to CharacterEntity
extension CharacterModelExtension on CharacterModel {
  CharacterEntity toEntity() {
    return CharacterEntity(
      id: id,
      name: name,
      status: status,
      species: species,
      gender: gender,
      image: image,
      origin: origin.name,
      location: location.name,
    );
  }
}
