// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'episode_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InfoModel _$InfoModelFromJson(Map<String, dynamic> json) {
  return _InfoModel.fromJson(json);
}

/// @nodoc
mixin _$InfoModel {
  int get count => throw _privateConstructorUsedError;
  int get pages => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError; // Может быть null
  String? get prev => throw _privateConstructorUsedError;

  /// Serializes this InfoModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InfoModelCopyWith<InfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfoModelCopyWith<$Res> {
  factory $InfoModelCopyWith(InfoModel value, $Res Function(InfoModel) then) =
      _$InfoModelCopyWithImpl<$Res, InfoModel>;
  @useResult
  $Res call({int count, int pages, String? next, String? prev});
}

/// @nodoc
class _$InfoModelCopyWithImpl<$Res, $Val extends InfoModel>
    implements $InfoModelCopyWith<$Res> {
  _$InfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? pages = null,
    Object? next = freezed,
    Object? prev = freezed,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InfoModelImplCopyWith<$Res>
    implements $InfoModelCopyWith<$Res> {
  factory _$$InfoModelImplCopyWith(
          _$InfoModelImpl value, $Res Function(_$InfoModelImpl) then) =
      __$$InfoModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, int pages, String? next, String? prev});
}

/// @nodoc
class __$$InfoModelImplCopyWithImpl<$Res>
    extends _$InfoModelCopyWithImpl<$Res, _$InfoModelImpl>
    implements _$$InfoModelImplCopyWith<$Res> {
  __$$InfoModelImplCopyWithImpl(
      _$InfoModelImpl _value, $Res Function(_$InfoModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of InfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? pages = null,
    Object? next = freezed,
    Object? prev = freezed,
  }) {
    return _then(_$InfoModelImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InfoModelImpl implements _InfoModel {
  const _$InfoModelImpl(
      {required this.count, required this.pages, this.next, this.prev});

  factory _$InfoModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InfoModelImplFromJson(json);

  @override
  final int count;
  @override
  final int pages;
  @override
  final String? next;
// Может быть null
  @override
  final String? prev;

  @override
  String toString() {
    return 'InfoModel(count: $count, pages: $pages, next: $next, prev: $prev)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InfoModelImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.prev, prev) || other.prev == prev));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, count, pages, next, prev);

  /// Create a copy of InfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InfoModelImplCopyWith<_$InfoModelImpl> get copyWith =>
      __$$InfoModelImplCopyWithImpl<_$InfoModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InfoModelImplToJson(
      this,
    );
  }
}

abstract class _InfoModel implements InfoModel {
  const factory _InfoModel(
      {required final int count,
      required final int pages,
      final String? next,
      final String? prev}) = _$InfoModelImpl;

  factory _InfoModel.fromJson(Map<String, dynamic> json) =
      _$InfoModelImpl.fromJson;

  @override
  int get count;
  @override
  int get pages;
  @override
  String? get next; // Может быть null
  @override
  String? get prev;

  /// Create a copy of InfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InfoModelImplCopyWith<_$InfoModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EpisodeModel _$EpisodeModelFromJson(Map<String, dynamic> json) {
  return _EpisodeModel.fromJson(json);
}

/// @nodoc
mixin _$EpisodeModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'air_date')
  String? get airDate =>
      throw _privateConstructorUsedError; // Поле может быть null
  String get episode => throw _privateConstructorUsedError;
  List<String> get characters => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  DateTime get created => throw _privateConstructorUsedError;

  /// Serializes this EpisodeModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EpisodeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EpisodeModelCopyWith<EpisodeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodeModelCopyWith<$Res> {
  factory $EpisodeModelCopyWith(
          EpisodeModel value, $Res Function(EpisodeModel) then) =
      _$EpisodeModelCopyWithImpl<$Res, EpisodeModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'air_date') String? airDate,
      String episode,
      List<String> characters,
      String url,
      DateTime created});
}

/// @nodoc
class _$EpisodeModelCopyWithImpl<$Res, $Val extends EpisodeModel>
    implements $EpisodeModelCopyWith<$Res> {
  _$EpisodeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EpisodeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? airDate = freezed,
    Object? episode = null,
    Object? characters = null,
    Object? url = null,
    Object? created = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      airDate: freezed == airDate
          ? _value.airDate
          : airDate // ignore: cast_nullable_to_non_nullable
              as String?,
      episode: null == episode
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as String,
      characters: null == characters
          ? _value.characters
          : characters // ignore: cast_nullable_to_non_nullable
              as List<String>,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EpisodeModelImplCopyWith<$Res>
    implements $EpisodeModelCopyWith<$Res> {
  factory _$$EpisodeModelImplCopyWith(
          _$EpisodeModelImpl value, $Res Function(_$EpisodeModelImpl) then) =
      __$$EpisodeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'air_date') String? airDate,
      String episode,
      List<String> characters,
      String url,
      DateTime created});
}

/// @nodoc
class __$$EpisodeModelImplCopyWithImpl<$Res>
    extends _$EpisodeModelCopyWithImpl<$Res, _$EpisodeModelImpl>
    implements _$$EpisodeModelImplCopyWith<$Res> {
  __$$EpisodeModelImplCopyWithImpl(
      _$EpisodeModelImpl _value, $Res Function(_$EpisodeModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EpisodeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? airDate = freezed,
    Object? episode = null,
    Object? characters = null,
    Object? url = null,
    Object? created = null,
  }) {
    return _then(_$EpisodeModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      airDate: freezed == airDate
          ? _value.airDate
          : airDate // ignore: cast_nullable_to_non_nullable
              as String?,
      episode: null == episode
          ? _value.episode
          : episode // ignore: cast_nullable_to_non_nullable
              as String,
      characters: null == characters
          ? _value._characters
          : characters // ignore: cast_nullable_to_non_nullable
              as List<String>,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EpisodeModelImpl implements _EpisodeModel {
  const _$EpisodeModelImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'air_date') this.airDate,
      required this.episode,
      required final List<String> characters,
      required this.url,
      required this.created})
      : _characters = characters;

  factory _$EpisodeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EpisodeModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'air_date')
  final String? airDate;
// Поле может быть null
  @override
  final String episode;
  final List<String> _characters;
  @override
  List<String> get characters {
    if (_characters is EqualUnmodifiableListView) return _characters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_characters);
  }

  @override
  final String url;
  @override
  final DateTime created;

  @override
  String toString() {
    return 'EpisodeModel(id: $id, name: $name, airDate: $airDate, episode: $episode, characters: $characters, url: $url, created: $created)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EpisodeModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.airDate, airDate) || other.airDate == airDate) &&
            (identical(other.episode, episode) || other.episode == episode) &&
            const DeepCollectionEquality()
                .equals(other._characters, _characters) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.created, created) || other.created == created));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, airDate, episode,
      const DeepCollectionEquality().hash(_characters), url, created);

  /// Create a copy of EpisodeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EpisodeModelImplCopyWith<_$EpisodeModelImpl> get copyWith =>
      __$$EpisodeModelImplCopyWithImpl<_$EpisodeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EpisodeModelImplToJson(
      this,
    );
  }
}

abstract class _EpisodeModel implements EpisodeModel {
  const factory _EpisodeModel(
      {required final int id,
      required final String name,
      @JsonKey(name: 'air_date') final String? airDate,
      required final String episode,
      required final List<String> characters,
      required final String url,
      required final DateTime created}) = _$EpisodeModelImpl;

  factory _EpisodeModel.fromJson(Map<String, dynamic> json) =
      _$EpisodeModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'air_date')
  String? get airDate; // Поле может быть null
  @override
  String get episode;
  @override
  List<String> get characters;
  @override
  String get url;
  @override
  DateTime get created;

  /// Create a copy of EpisodeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EpisodeModelImplCopyWith<_$EpisodeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

EpisodeResponseModel _$EpisodeResponseModelFromJson(Map<String, dynamic> json) {
  return _EpisodeResponseModel.fromJson(json);
}

/// @nodoc
mixin _$EpisodeResponseModel {
  InfoModel get info => throw _privateConstructorUsedError;
  List<EpisodeModel> get results => throw _privateConstructorUsedError;

  /// Serializes this EpisodeResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EpisodeResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EpisodeResponseModelCopyWith<EpisodeResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpisodeResponseModelCopyWith<$Res> {
  factory $EpisodeResponseModelCopyWith(EpisodeResponseModel value,
          $Res Function(EpisodeResponseModel) then) =
      _$EpisodeResponseModelCopyWithImpl<$Res, EpisodeResponseModel>;
  @useResult
  $Res call({InfoModel info, List<EpisodeModel> results});

  $InfoModelCopyWith<$Res> get info;
}

/// @nodoc
class _$EpisodeResponseModelCopyWithImpl<$Res,
        $Val extends EpisodeResponseModel>
    implements $EpisodeResponseModelCopyWith<$Res> {
  _$EpisodeResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EpisodeResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as InfoModel,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<EpisodeModel>,
    ) as $Val);
  }

  /// Create a copy of EpisodeResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InfoModelCopyWith<$Res> get info {
    return $InfoModelCopyWith<$Res>(_value.info, (value) {
      return _then(_value.copyWith(info: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EpisodeResponseModelImplCopyWith<$Res>
    implements $EpisodeResponseModelCopyWith<$Res> {
  factory _$$EpisodeResponseModelImplCopyWith(_$EpisodeResponseModelImpl value,
          $Res Function(_$EpisodeResponseModelImpl) then) =
      __$$EpisodeResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({InfoModel info, List<EpisodeModel> results});

  @override
  $InfoModelCopyWith<$Res> get info;
}

/// @nodoc
class __$$EpisodeResponseModelImplCopyWithImpl<$Res>
    extends _$EpisodeResponseModelCopyWithImpl<$Res, _$EpisodeResponseModelImpl>
    implements _$$EpisodeResponseModelImplCopyWith<$Res> {
  __$$EpisodeResponseModelImplCopyWithImpl(_$EpisodeResponseModelImpl _value,
      $Res Function(_$EpisodeResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EpisodeResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? info = null,
    Object? results = null,
  }) {
    return _then(_$EpisodeResponseModelImpl(
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as InfoModel,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<EpisodeModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EpisodeResponseModelImpl implements _EpisodeResponseModel {
  const _$EpisodeResponseModelImpl(
      {required this.info, required final List<EpisodeModel> results})
      : _results = results;

  factory _$EpisodeResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$EpisodeResponseModelImplFromJson(json);

  @override
  final InfoModel info;
  final List<EpisodeModel> _results;
  @override
  List<EpisodeModel> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'EpisodeResponseModel(info: $info, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EpisodeResponseModelImpl &&
            (identical(other.info, info) || other.info == info) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, info, const DeepCollectionEquality().hash(_results));

  /// Create a copy of EpisodeResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EpisodeResponseModelImplCopyWith<_$EpisodeResponseModelImpl>
      get copyWith =>
          __$$EpisodeResponseModelImplCopyWithImpl<_$EpisodeResponseModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EpisodeResponseModelImplToJson(
      this,
    );
  }
}

abstract class _EpisodeResponseModel implements EpisodeResponseModel {
  const factory _EpisodeResponseModel(
      {required final InfoModel info,
      required final List<EpisodeModel> results}) = _$EpisodeResponseModelImpl;

  factory _EpisodeResponseModel.fromJson(Map<String, dynamic> json) =
      _$EpisodeResponseModelImpl.fromJson;

  @override
  InfoModel get info;
  @override
  List<EpisodeModel> get results;

  /// Create a copy of EpisodeResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EpisodeResponseModelImplCopyWith<_$EpisodeResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
