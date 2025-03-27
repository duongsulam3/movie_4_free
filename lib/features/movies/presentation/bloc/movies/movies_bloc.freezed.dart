// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movies_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MoviesState {
  MoviesStateStatus get status;
  int get page;
  List<MovieItemEntity> get movies;
  bool get isEnd;

  /// Create a copy of MoviesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MoviesStateCopyWith<MoviesState> get copyWith =>
      _$MoviesStateCopyWithImpl<MoviesState>(this as MoviesState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MoviesState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other.movies, movies) &&
            (identical(other.isEnd, isEnd) || other.isEnd == isEnd));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, page,
      const DeepCollectionEquality().hash(movies), isEnd);

  @override
  String toString() {
    return 'MoviesState(status: $status, page: $page, movies: $movies, isEnd: $isEnd)';
  }
}

/// @nodoc
abstract mixin class $MoviesStateCopyWith<$Res> {
  factory $MoviesStateCopyWith(
          MoviesState value, $Res Function(MoviesState) _then) =
      _$MoviesStateCopyWithImpl;
  @useResult
  $Res call(
      {MoviesStateStatus status,
      int page,
      List<MovieItemEntity> movies,
      bool isEnd});
}

/// @nodoc
class _$MoviesStateCopyWithImpl<$Res> implements $MoviesStateCopyWith<$Res> {
  _$MoviesStateCopyWithImpl(this._self, this._then);

  final MoviesState _self;
  final $Res Function(MoviesState) _then;

  /// Create a copy of MoviesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? page = null,
    Object? movies = null,
    Object? isEnd = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as MoviesStateStatus,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      movies: null == movies
          ? _self.movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<MovieItemEntity>,
      isEnd: null == isEnd
          ? _self.isEnd
          : isEnd // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _MoviesState extends MoviesState {
  const _MoviesState(
      [this.status = MoviesStateStatus.init,
      this.page = 1,
      final List<MovieItemEntity> movies = const [],
      this.isEnd = false])
      : _movies = movies,
        super._();

  @override
  @JsonKey()
  final MoviesStateStatus status;
  @override
  @JsonKey()
  final int page;
  final List<MovieItemEntity> _movies;
  @override
  @JsonKey()
  List<MovieItemEntity> get movies {
    if (_movies is EqualUnmodifiableListView) return _movies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  @override
  @JsonKey()
  final bool isEnd;

  /// Create a copy of MoviesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MoviesStateCopyWith<_MoviesState> get copyWith =>
      __$MoviesStateCopyWithImpl<_MoviesState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MoviesState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            (identical(other.isEnd, isEnd) || other.isEnd == isEnd));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, page,
      const DeepCollectionEquality().hash(_movies), isEnd);

  @override
  String toString() {
    return 'MoviesState(status: $status, page: $page, movies: $movies, isEnd: $isEnd)';
  }
}

/// @nodoc
abstract mixin class _$MoviesStateCopyWith<$Res>
    implements $MoviesStateCopyWith<$Res> {
  factory _$MoviesStateCopyWith(
          _MoviesState value, $Res Function(_MoviesState) _then) =
      __$MoviesStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {MoviesStateStatus status,
      int page,
      List<MovieItemEntity> movies,
      bool isEnd});
}

/// @nodoc
class __$MoviesStateCopyWithImpl<$Res> implements _$MoviesStateCopyWith<$Res> {
  __$MoviesStateCopyWithImpl(this._self, this._then);

  final _MoviesState _self;
  final $Res Function(_MoviesState) _then;

  /// Create a copy of MoviesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? page = null,
    Object? movies = null,
    Object? isEnd = null,
  }) {
    return _then(_MoviesState(
      null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as MoviesStateStatus,
      null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      null == movies
          ? _self._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<MovieItemEntity>,
      null == isEnd
          ? _self.isEnd
          : isEnd // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
