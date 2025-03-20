// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kho_phim_movies_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KhoPhimMoviesState {
  KhoPhimMoviesStateStatus get status;
  int get page;
  String get countrySlug;
  String get categorySlug;
  String get langSlug;
  String get yearSlug;
  List<MovieItemEntity> get movies;
  bool get isEnd;

  /// Create a copy of KhoPhimMoviesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $KhoPhimMoviesStateCopyWith<KhoPhimMoviesState> get copyWith =>
      _$KhoPhimMoviesStateCopyWithImpl<KhoPhimMoviesState>(
          this as KhoPhimMoviesState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is KhoPhimMoviesState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.countrySlug, countrySlug) ||
                other.countrySlug == countrySlug) &&
            (identical(other.categorySlug, categorySlug) ||
                other.categorySlug == categorySlug) &&
            (identical(other.langSlug, langSlug) ||
                other.langSlug == langSlug) &&
            (identical(other.yearSlug, yearSlug) ||
                other.yearSlug == yearSlug) &&
            const DeepCollectionEquality().equals(other.movies, movies) &&
            (identical(other.isEnd, isEnd) || other.isEnd == isEnd));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      page,
      countrySlug,
      categorySlug,
      langSlug,
      yearSlug,
      const DeepCollectionEquality().hash(movies),
      isEnd);

  @override
  String toString() {
    return 'KhoPhimMoviesState(status: $status, page: $page, countrySlug: $countrySlug, categorySlug: $categorySlug, langSlug: $langSlug, yearSlug: $yearSlug, movies: $movies, isEnd: $isEnd)';
  }
}

/// @nodoc
abstract mixin class $KhoPhimMoviesStateCopyWith<$Res> {
  factory $KhoPhimMoviesStateCopyWith(
          KhoPhimMoviesState value, $Res Function(KhoPhimMoviesState) _then) =
      _$KhoPhimMoviesStateCopyWithImpl;
  @useResult
  $Res call(
      {KhoPhimMoviesStateStatus status,
      int page,
      String countrySlug,
      String categorySlug,
      String langSlug,
      String yearSlug,
      List<MovieItemEntity> movies,
      bool isEnd});
}

/// @nodoc
class _$KhoPhimMoviesStateCopyWithImpl<$Res>
    implements $KhoPhimMoviesStateCopyWith<$Res> {
  _$KhoPhimMoviesStateCopyWithImpl(this._self, this._then);

  final KhoPhimMoviesState _self;
  final $Res Function(KhoPhimMoviesState) _then;

  /// Create a copy of KhoPhimMoviesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? page = null,
    Object? countrySlug = null,
    Object? categorySlug = null,
    Object? langSlug = null,
    Object? yearSlug = null,
    Object? movies = null,
    Object? isEnd = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as KhoPhimMoviesStateStatus,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      countrySlug: null == countrySlug
          ? _self.countrySlug
          : countrySlug // ignore: cast_nullable_to_non_nullable
              as String,
      categorySlug: null == categorySlug
          ? _self.categorySlug
          : categorySlug // ignore: cast_nullable_to_non_nullable
              as String,
      langSlug: null == langSlug
          ? _self.langSlug
          : langSlug // ignore: cast_nullable_to_non_nullable
              as String,
      yearSlug: null == yearSlug
          ? _self.yearSlug
          : yearSlug // ignore: cast_nullable_to_non_nullable
              as String,
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

class _KhoPhimPageState extends KhoPhimMoviesState {
  const _KhoPhimPageState(
      [this.status = KhoPhimMoviesStateStatus.init,
      this.page = 1,
      this.countrySlug = "",
      this.categorySlug = "",
      this.langSlug = "",
      this.yearSlug = "",
      final List<MovieItemEntity> movies = const [],
      this.isEnd = false])
      : _movies = movies,
        super._();

  @override
  @JsonKey()
  final KhoPhimMoviesStateStatus status;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final String countrySlug;
  @override
  @JsonKey()
  final String categorySlug;
  @override
  @JsonKey()
  final String langSlug;
  @override
  @JsonKey()
  final String yearSlug;
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

  /// Create a copy of KhoPhimMoviesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$KhoPhimPageStateCopyWith<_KhoPhimPageState> get copyWith =>
      __$KhoPhimPageStateCopyWithImpl<_KhoPhimPageState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KhoPhimPageState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.countrySlug, countrySlug) ||
                other.countrySlug == countrySlug) &&
            (identical(other.categorySlug, categorySlug) ||
                other.categorySlug == categorySlug) &&
            (identical(other.langSlug, langSlug) ||
                other.langSlug == langSlug) &&
            (identical(other.yearSlug, yearSlug) ||
                other.yearSlug == yearSlug) &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            (identical(other.isEnd, isEnd) || other.isEnd == isEnd));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      page,
      countrySlug,
      categorySlug,
      langSlug,
      yearSlug,
      const DeepCollectionEquality().hash(_movies),
      isEnd);

  @override
  String toString() {
    return 'KhoPhimMoviesState(status: $status, page: $page, countrySlug: $countrySlug, categorySlug: $categorySlug, langSlug: $langSlug, yearSlug: $yearSlug, movies: $movies, isEnd: $isEnd)';
  }
}

/// @nodoc
abstract mixin class _$KhoPhimPageStateCopyWith<$Res>
    implements $KhoPhimMoviesStateCopyWith<$Res> {
  factory _$KhoPhimPageStateCopyWith(
          _KhoPhimPageState value, $Res Function(_KhoPhimPageState) _then) =
      __$KhoPhimPageStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {KhoPhimMoviesStateStatus status,
      int page,
      String countrySlug,
      String categorySlug,
      String langSlug,
      String yearSlug,
      List<MovieItemEntity> movies,
      bool isEnd});
}

/// @nodoc
class __$KhoPhimPageStateCopyWithImpl<$Res>
    implements _$KhoPhimPageStateCopyWith<$Res> {
  __$KhoPhimPageStateCopyWithImpl(this._self, this._then);

  final _KhoPhimPageState _self;
  final $Res Function(_KhoPhimPageState) _then;

  /// Create a copy of KhoPhimMoviesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? page = null,
    Object? countrySlug = null,
    Object? categorySlug = null,
    Object? langSlug = null,
    Object? yearSlug = null,
    Object? movies = null,
    Object? isEnd = null,
  }) {
    return _then(_KhoPhimPageState(
      null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as KhoPhimMoviesStateStatus,
      null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      null == countrySlug
          ? _self.countrySlug
          : countrySlug // ignore: cast_nullable_to_non_nullable
              as String,
      null == categorySlug
          ? _self.categorySlug
          : categorySlug // ignore: cast_nullable_to_non_nullable
              as String,
      null == langSlug
          ? _self.langSlug
          : langSlug // ignore: cast_nullable_to_non_nullable
              as String,
      null == yearSlug
          ? _self.yearSlug
          : yearSlug // ignore: cast_nullable_to_non_nullable
              as String,
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
