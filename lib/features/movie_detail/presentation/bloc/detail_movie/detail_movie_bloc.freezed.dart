// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_movie_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DetailMovieState {
  DetailMovieStatus get status;
  MovieDetailEntity? get movie;
  String get passingUrl;
  String get passingEpisode;

  /// Create a copy of DetailMovieState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DetailMovieStateCopyWith<DetailMovieState> get copyWith =>
      _$DetailMovieStateCopyWithImpl<DetailMovieState>(
          this as DetailMovieState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DetailMovieState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.movie, movie) || other.movie == movie) &&
            (identical(other.passingUrl, passingUrl) ||
                other.passingUrl == passingUrl) &&
            (identical(other.passingEpisode, passingEpisode) ||
                other.passingEpisode == passingEpisode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, movie, passingUrl, passingEpisode);

  @override
  String toString() {
    return 'DetailMovieState(status: $status, movie: $movie, passingUrl: $passingUrl, passingEpisode: $passingEpisode)';
  }
}

/// @nodoc
abstract mixin class $DetailMovieStateCopyWith<$Res> {
  factory $DetailMovieStateCopyWith(
          DetailMovieState value, $Res Function(DetailMovieState) _then) =
      _$DetailMovieStateCopyWithImpl;
  @useResult
  $Res call(
      {DetailMovieStatus status,
      MovieDetailEntity? movie,
      String passingUrl,
      String passingEpisode});
}

/// @nodoc
class _$DetailMovieStateCopyWithImpl<$Res>
    implements $DetailMovieStateCopyWith<$Res> {
  _$DetailMovieStateCopyWithImpl(this._self, this._then);

  final DetailMovieState _self;
  final $Res Function(DetailMovieState) _then;

  /// Create a copy of DetailMovieState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? movie = freezed,
    Object? passingUrl = null,
    Object? passingEpisode = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as DetailMovieStatus,
      movie: freezed == movie
          ? _self.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as MovieDetailEntity?,
      passingUrl: null == passingUrl
          ? _self.passingUrl
          : passingUrl // ignore: cast_nullable_to_non_nullable
              as String,
      passingEpisode: null == passingEpisode
          ? _self.passingEpisode
          : passingEpisode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _DetailMovieState extends DetailMovieState {
  const _DetailMovieState(
      [this.status = DetailMovieStatus.init,
      this.movie = null,
      this.passingUrl = "",
      this.passingEpisode = ""])
      : super._();

  @override
  @JsonKey()
  final DetailMovieStatus status;
  @override
  @JsonKey()
  final MovieDetailEntity? movie;
  @override
  @JsonKey()
  final String passingUrl;
  @override
  @JsonKey()
  final String passingEpisode;

  /// Create a copy of DetailMovieState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DetailMovieStateCopyWith<_DetailMovieState> get copyWith =>
      __$DetailMovieStateCopyWithImpl<_DetailMovieState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DetailMovieState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.movie, movie) || other.movie == movie) &&
            (identical(other.passingUrl, passingUrl) ||
                other.passingUrl == passingUrl) &&
            (identical(other.passingEpisode, passingEpisode) ||
                other.passingEpisode == passingEpisode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, movie, passingUrl, passingEpisode);

  @override
  String toString() {
    return 'DetailMovieState(status: $status, movie: $movie, passingUrl: $passingUrl, passingEpisode: $passingEpisode)';
  }
}

/// @nodoc
abstract mixin class _$DetailMovieStateCopyWith<$Res>
    implements $DetailMovieStateCopyWith<$Res> {
  factory _$DetailMovieStateCopyWith(
          _DetailMovieState value, $Res Function(_DetailMovieState) _then) =
      __$DetailMovieStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {DetailMovieStatus status,
      MovieDetailEntity? movie,
      String passingUrl,
      String passingEpisode});
}

/// @nodoc
class __$DetailMovieStateCopyWithImpl<$Res>
    implements _$DetailMovieStateCopyWith<$Res> {
  __$DetailMovieStateCopyWithImpl(this._self, this._then);

  final _DetailMovieState _self;
  final $Res Function(_DetailMovieState) _then;

  /// Create a copy of DetailMovieState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? movie = freezed,
    Object? passingUrl = null,
    Object? passingEpisode = null,
  }) {
    return _then(_DetailMovieState(
      null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as DetailMovieStatus,
      freezed == movie
          ? _self.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as MovieDetailEntity?,
      null == passingUrl
          ? _self.passingUrl
          : passingUrl // ignore: cast_nullable_to_non_nullable
              as String,
      null == passingEpisode
          ? _self.passingEpisode
          : passingEpisode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
