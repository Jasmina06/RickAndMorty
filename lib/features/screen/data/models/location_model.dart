import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

@freezed
class LocationModel with _$LocationModel {
  const factory LocationModel({
    required int id,
    required String name,
    required String type,
    required String dimension,
    required List<String> residents,
    required String url,
    required DateTime created,
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
    required List<LocationModel> results,
  }) = _RickAndMortyResponseModel;

  factory RickAndMortyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RickAndMortyResponseModelFromJson(json);
}
