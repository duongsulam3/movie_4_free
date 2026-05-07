// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nguonc_search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NguoncSearchState {
  SearchPageStatus get status;
  int get page;
  String get query;
  List<NguoncMovieItemEntity> get movies;
  bool get isEnd;
  String get typingQuery;
  List<NguoncSearchSuggestionEntity> get suggestions;
  bool get isSuggestionLoading;

  /// Create a copy of NguoncSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NguoncSearchStateCopyWith<NguoncSearchState> get copyWith =>
      _$NguoncSearchStateCopyWithImpl<NguoncSearchState>(
          this as NguoncSearchState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NguoncSearchState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.query, query) || other.query == query) &&
            const DeepCollectionEquality().equals(other.movies, movies) &&
            (identical(other.isEnd, isEnd) || other.isEnd == isEnd) &&
            (identical(other.typingQuery, typingQuery) ||
                other.typingQuery == typingQuery) &&
            const DeepCollectionEquality()
                .equals(other.suggestions, suggestions) &&
            (identical(other.isSuggestionLoading, isSuggestionLoading) ||
                other.isSuggestionLoading == isSuggestionLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      page,
      query,
      const DeepCollectionEquality().hash(movies),
      isEnd,
      typingQuery,
      const DeepCollectionEquality().hash(suggestions),
      isSuggestionLoading);

  @override
  String toString() {
    return 'NguoncSearchState(status: $status, page: $page, query: $query, movies: $movies, isEnd: $isEnd, typingQuery: $typingQuery, suggestions: $suggestions, isSuggestionLoading: $isSuggestionLoading)';
  }
}

/// @nodoc
abstract mixin class $NguoncSearchStateCopyWith<$Res> {
  factory $NguoncSearchStateCopyWith(
          NguoncSearchState value, $Res Function(NguoncSearchState) _then) =
      _$NguoncSearchStateCopyWithImpl;
  @useResult
  $Res call(
      {SearchPageStatus status,
      int page,
      String query,
      List<NguoncMovieItemEntity> movies,
      bool isEnd,
      String typingQuery,
      List<NguoncSearchSuggestionEntity> suggestions,
      bool isSuggestionLoading});
}

/// @nodoc
class _$NguoncSearchStateCopyWithImpl<$Res>
    implements $NguoncSearchStateCopyWith<$Res> {
  _$NguoncSearchStateCopyWithImpl(this._self, this._then);

  final NguoncSearchState _self;
  final $Res Function(NguoncSearchState) _then;

  /// Create a copy of NguoncSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? page = null,
    Object? query = null,
    Object? movies = null,
    Object? isEnd = null,
    Object? typingQuery = null,
    Object? suggestions = null,
    Object? isSuggestionLoading = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as SearchPageStatus,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      query: null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      movies: null == movies
          ? _self.movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<NguoncMovieItemEntity>,
      isEnd: null == isEnd
          ? _self.isEnd
          : isEnd // ignore: cast_nullable_to_non_nullable
              as bool,
      typingQuery: null == typingQuery
          ? _self.typingQuery
          : typingQuery // ignore: cast_nullable_to_non_nullable
              as String,
      suggestions: null == suggestions
          ? _self.suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<NguoncSearchSuggestionEntity>,
      isSuggestionLoading: null == isSuggestionLoading
          ? _self.isSuggestionLoading
          : isSuggestionLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [NguoncSearchState].
extension NguoncSearchStatePatterns on NguoncSearchState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_NguoncSearchState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NguoncSearchState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_NguoncSearchState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NguoncSearchState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_NguoncSearchState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NguoncSearchState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            SearchPageStatus status,
            int page,
            String query,
            List<NguoncMovieItemEntity> movies,
            bool isEnd,
            String typingQuery,
            List<NguoncSearchSuggestionEntity> suggestions,
            bool isSuggestionLoading)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _NguoncSearchState() when $default != null:
        return $default(
            _that.status,
            _that.page,
            _that.query,
            _that.movies,
            _that.isEnd,
            _that.typingQuery,
            _that.suggestions,
            _that.isSuggestionLoading);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            SearchPageStatus status,
            int page,
            String query,
            List<NguoncMovieItemEntity> movies,
            bool isEnd,
            String typingQuery,
            List<NguoncSearchSuggestionEntity> suggestions,
            bool isSuggestionLoading)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NguoncSearchState():
        return $default(
            _that.status,
            _that.page,
            _that.query,
            _that.movies,
            _that.isEnd,
            _that.typingQuery,
            _that.suggestions,
            _that.isSuggestionLoading);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            SearchPageStatus status,
            int page,
            String query,
            List<NguoncMovieItemEntity> movies,
            bool isEnd,
            String typingQuery,
            List<NguoncSearchSuggestionEntity> suggestions,
            bool isSuggestionLoading)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _NguoncSearchState() when $default != null:
        return $default(
            _that.status,
            _that.page,
            _that.query,
            _that.movies,
            _that.isEnd,
            _that.typingQuery,
            _that.suggestions,
            _that.isSuggestionLoading);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _NguoncSearchState extends NguoncSearchState {
  const _NguoncSearchState(
      [this.status = SearchPageStatus.init,
      this.page = 1,
      this.query = "",
      final List<NguoncMovieItemEntity> movies = const [],
      this.isEnd = false,
      this.typingQuery = "",
      final List<NguoncSearchSuggestionEntity> suggestions = const [],
      this.isSuggestionLoading = false])
      : _movies = movies,
        _suggestions = suggestions,
        super._();

  @override
  @JsonKey()
  final SearchPageStatus status;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final String query;
  final List<NguoncMovieItemEntity> _movies;
  @override
  @JsonKey()
  List<NguoncMovieItemEntity> get movies {
    if (_movies is EqualUnmodifiableListView) return _movies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  @override
  @JsonKey()
  final bool isEnd;
  @override
  @JsonKey()
  final String typingQuery;
  final List<NguoncSearchSuggestionEntity> _suggestions;
  @override
  @JsonKey()
  List<NguoncSearchSuggestionEntity> get suggestions {
    if (_suggestions is EqualUnmodifiableListView) return _suggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestions);
  }

  @override
  @JsonKey()
  final bool isSuggestionLoading;

  /// Create a copy of NguoncSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NguoncSearchStateCopyWith<_NguoncSearchState> get copyWith =>
      __$NguoncSearchStateCopyWithImpl<_NguoncSearchState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NguoncSearchState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.query, query) || other.query == query) &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            (identical(other.isEnd, isEnd) || other.isEnd == isEnd) &&
            (identical(other.typingQuery, typingQuery) ||
                other.typingQuery == typingQuery) &&
            const DeepCollectionEquality()
                .equals(other._suggestions, _suggestions) &&
            (identical(other.isSuggestionLoading, isSuggestionLoading) ||
                other.isSuggestionLoading == isSuggestionLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      page,
      query,
      const DeepCollectionEquality().hash(_movies),
      isEnd,
      typingQuery,
      const DeepCollectionEquality().hash(_suggestions),
      isSuggestionLoading);

  @override
  String toString() {
    return 'NguoncSearchState(status: $status, page: $page, query: $query, movies: $movies, isEnd: $isEnd, typingQuery: $typingQuery, suggestions: $suggestions, isSuggestionLoading: $isSuggestionLoading)';
  }
}

/// @nodoc
abstract mixin class _$NguoncSearchStateCopyWith<$Res>
    implements $NguoncSearchStateCopyWith<$Res> {
  factory _$NguoncSearchStateCopyWith(
          _NguoncSearchState value, $Res Function(_NguoncSearchState) _then) =
      __$NguoncSearchStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {SearchPageStatus status,
      int page,
      String query,
      List<NguoncMovieItemEntity> movies,
      bool isEnd,
      String typingQuery,
      List<NguoncSearchSuggestionEntity> suggestions,
      bool isSuggestionLoading});
}

/// @nodoc
class __$NguoncSearchStateCopyWithImpl<$Res>
    implements _$NguoncSearchStateCopyWith<$Res> {
  __$NguoncSearchStateCopyWithImpl(this._self, this._then);

  final _NguoncSearchState _self;
  final $Res Function(_NguoncSearchState) _then;

  /// Create a copy of NguoncSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? page = null,
    Object? query = null,
    Object? movies = null,
    Object? isEnd = null,
    Object? typingQuery = null,
    Object? suggestions = null,
    Object? isSuggestionLoading = null,
  }) {
    return _then(_NguoncSearchState(
      null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as SearchPageStatus,
      null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      null == movies
          ? _self._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<NguoncMovieItemEntity>,
      null == isEnd
          ? _self.isEnd
          : isEnd // ignore: cast_nullable_to_non_nullable
              as bool,
      null == typingQuery
          ? _self.typingQuery
          : typingQuery // ignore: cast_nullable_to_non_nullable
              as String,
      null == suggestions
          ? _self._suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<NguoncSearchSuggestionEntity>,
      null == isSuggestionLoading
          ? _self.isSuggestionLoading
          : isSuggestionLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
