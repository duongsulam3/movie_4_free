// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nguonc_movie_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NguoncMovieDetailState {
  DetailMovieStatus get status;
  NguoncMovieEntity? get movie;
  String get passingUrl;
  String get passingEpisode;

  /// Create a copy of NguoncMovieDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NguoncMovieDetailStateCopyWith<NguoncMovieDetailState> get copyWith =>
      _$NguoncMovieDetailStateCopyWithImpl<NguoncMovieDetailState>(
          this as NguoncMovieDetailState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NguoncMovieDetailState &&
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
    return 'NguoncMovieDetailState(status: $status, movie: $movie, passingUrl: $passingUrl, passingEpisode: $passingEpisode)';
  }
}

/// @nodoc
abstract mixin class $NguoncMovieDetailStateCopyWith<$Res> {
  factory $NguoncMovieDetailStateCopyWith(NguoncMovieDetailState value,
          $Res Function(NguoncMovieDetailState) _then) =
      _$NguoncMovieDetailStateCopyWithImpl;
  @useResult
  $Res call(
      {DetailMovieStatus status,
      NguoncMovieEntity? movie,
      String passingUrl,
      String passingEpisode});
}

/// @nodoc
class _$NguoncMovieDetailStateCopyWithImpl<$Res>
    implements $NguoncMovieDetailStateCopyWith<$Res> {
  _$NguoncMovieDetailStateCopyWithImpl(this._self, this._then);

  final NguoncMovieDetailState _self;
  final $Res Function(NguoncMovieDetailState) _then;

  /// Create a copy of NguoncMovieDetailState
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
              as NguoncMovieEntity?,
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

class _NguoncMovieDetailState extends NguoncMovieDetailState {
  const _NguoncMovieDetailState(
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
  final NguoncMovieEntity? movie;
  @override
  @JsonKey()
  final String passingUrl;
  @override
  @JsonKey()
  final String passingEpisode;

  /// Create a copy of NguoncMovieDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NguoncMovieDetailStateCopyWith<_NguoncMovieDetailState> get copyWith =>
      __$NguoncMovieDetailStateCopyWithImpl<_NguoncMovieDetailState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NguoncMovieDetailState &&
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
    return 'NguoncMovieDetailState(status: $status, movie: $movie, passingUrl: $passingUrl, passingEpisode: $passingEpisode)';
  }
}

/// @nodoc
abstract mixin class _$NguoncMovieDetailStateCopyWith<$Res>
    implements $NguoncMovieDetailStateCopyWith<$Res> {
  factory _$NguoncMovieDetailStateCopyWith(_NguoncMovieDetailState value,
          $Res Function(_NguoncMovieDetailState) _then) =
      __$NguoncMovieDetailStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {DetailMovieStatus status,
      NguoncMovieEntity? movie,
      String passingUrl,
      String passingEpisode});
}

/// @nodoc
class __$NguoncMovieDetailStateCopyWithImpl<$Res>
    implements _$NguoncMovieDetailStateCopyWith<$Res> {
  __$NguoncMovieDetailStateCopyWithImpl(this._self, this._then);

  final _NguoncMovieDetailState _self;
  final $Res Function(_NguoncMovieDetailState) _then;

  /// Create a copy of NguoncMovieDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? movie = freezed,
    Object? passingUrl = null,
    Object? passingEpisode = null,
  }) {
    return _then(_NguoncMovieDetailState(
      null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as DetailMovieStatus,
      freezed == movie
          ? _self.movie
          : movie // ignore: cast_nullable_to_non_nullable
              as NguoncMovieEntity?,
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
