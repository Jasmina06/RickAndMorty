import 'package:freezed_annotation/freezed_annotation.dart';

part 'episode_model.freezed.dart';
part 'episode_model.g.dart';

@freezed
class InfoModel with _$InfoModel {
  const factory InfoModel({
    required int count,
    required int pages,
    String? next, 
    String? prev, 
  }) = _InfoModel;

  factory InfoModel.fromJson(Map<String, Object?> json) =>
      _$InfoModelFromJson(json);
}

@freezed
class EpisodeModel with _$EpisodeModel {
  const factory EpisodeModel({
    required int id,
    required String name,
    @JsonKey(name: 'air_date') String? airDate,
    required String episode,
    required List<String> characters,
    required String url,
    required DateTime created,
  }) = _EpisodeModel;

  factory EpisodeModel.fromJson(Map<String, Object?> json) =>
      _$EpisodeModelFromJson(json);
}

@freezed
class EpisodeResponseModel with _$EpisodeResponseModel {
  const factory EpisodeResponseModel({
    required InfoModel info,
    required List<EpisodeModel> results,
  }) = _EpisodeResponseModel;

  factory EpisodeResponseModel.fromJson(Map<String, Object?> json) =>
      _$EpisodeResponseModelFromJson(json);
}
