// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recently_update_movies_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecentlyUpdateMoviesState {
  MoviesStateStatus get status;
  int get page;
  List<RecentlyUpdateListItemEntity> get movies;

  /// Create a copy of RecentlyUpdateMoviesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RecentlyUpdateMoviesStateCopyWith<RecentlyUpdateMoviesState> get copyWith =>
      _$RecentlyUpdateMoviesStateCopyWithImpl<RecentlyUpdateMoviesState>(
          this as RecentlyUpdateMoviesState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RecentlyUpdateMoviesState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other.movies, movies));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, page, const DeepCollectionEquality().hash(movies));

  @override
  String toString() {
    return 'RecentlyUpdateMoviesState(status: $status, page: $page, movies: $movies)';
  }
}

/// @nodoc
abstract mixin class $RecentlyUpdateMoviesStateCopyWith<$Res> {
  factory $RecentlyUpdateMoviesStateCopyWith(RecentlyUpdateMoviesState value,
          $Res Function(RecentlyUpdateMoviesState) _then) =
      _$RecentlyUpdateMoviesStateCopyWithImpl;
  @useResult
  $Res call(
      {MoviesStateStatus status,
      int page,
      List<RecentlyUpdateListItemEntity> movies});
}

/// @nodoc
class _$RecentlyUpdateMoviesStateCopyWithImpl<$Res>
    implements $RecentlyUpdateMoviesStateCopyWith<$Res> {
  _$RecentlyUpdateMoviesStateCopyWithImpl(this._self, this._then);

  final RecentlyUpdateMoviesState _self;
  final $Res Function(RecentlyUpdateMoviesState) _then;

  /// Create a copy of RecentlyUpdateMoviesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? page = null,
    Object? movies = null,
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
              as List<RecentlyUpdateListItemEntity>,
    ));
  }
}

/// @nodoc

class _RecentlyUpdateMoviesState extends RecentlyUpdateMoviesState {
  const _RecentlyUpdateMoviesState(
      [this.status = MoviesStateStatus.init,
      this.page = 1,
      final List<RecentlyUpdateListItemEntity> movies = const []])
      : _movies = movies,
        super._();

  @override
  @JsonKey()
  final MoviesStateStatus status;
  @override
  @JsonKey()
  final int page;
  final List<RecentlyUpdateListItemEntity> _movies;
  @override
  @JsonKey()
  List<RecentlyUpdateListItemEntity> get movies {
    if (_movies is EqualUnmodifiableListView) return _movies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  /// Create a copy of RecentlyUpdateMoviesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RecentlyUpdateMoviesStateCopyWith<_RecentlyUpdateMoviesState>
      get copyWith =>
          __$RecentlyUpdateMoviesStateCopyWithImpl<_RecentlyUpdateMoviesState>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecentlyUpdateMoviesState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._movies, _movies));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, page, const DeepCollectionEquality().hash(_movies));

  @override
  String toString() {
    return 'RecentlyUpdateMoviesState(status: $status, page: $page, movies: $movies)';
  }
}

/// @nodoc
abstract mixin class _$RecentlyUpdateMoviesStateCopyWith<$Res>
    implements $RecentlyUpdateMoviesStateCopyWith<$Res> {
  factory _$RecentlyUpdateMoviesStateCopyWith(_RecentlyUpdateMoviesState value,
          $Res Function(_RecentlyUpdateMoviesState) _then) =
      __$RecentlyUpdateMoviesStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {MoviesStateStatus status,
      int page,
      List<RecentlyUpdateListItemEntity> movies});
}

/// @nodoc
class __$RecentlyUpdateMoviesStateCopyWithImpl<$Res>
    implements _$RecentlyUpdateMoviesStateCopyWith<$Res> {
  __$RecentlyUpdateMoviesStateCopyWithImpl(this._self, this._then);

  final _RecentlyUpdateMoviesState _self;
  final $Res Function(_RecentlyUpdateMoviesState) _then;

  /// Create a copy of RecentlyUpdateMoviesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? page = null,
    Object? movies = null,
  }) {
    return _then(_RecentlyUpdateMoviesState(
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
              as List<RecentlyUpdateListItemEntity>,
    ));
  }
}

// dart format on
