// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchState {
  SearchPageStatus get status;
  int get page;
  String get query;
  List<MovieItemEntity> get movies;
  bool get isEnd;
  String get typingQuery;
  List<SearchSuggestionEntity> get suggestions;
  bool get isSuggestionLoading;
  bool get showSuggestions;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchStateCopyWith<SearchState> get copyWith =>
      _$SearchStateCopyWithImpl<SearchState>(this as SearchState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchState &&
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
                other.isSuggestionLoading == isSuggestionLoading) &&
            (identical(other.showSuggestions, showSuggestions) ||
                other.showSuggestions == showSuggestions));
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
      isSuggestionLoading,
      showSuggestions);

  @override
  String toString() {
    return 'SearchState(status: $status, page: $page, query: $query, movies: $movies, isEnd: $isEnd, typingQuery: $typingQuery, suggestions: $suggestions, isSuggestionLoading: $isSuggestionLoading, showSuggestions: $showSuggestions)';
  }
}

/// @nodoc
abstract mixin class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) _then) =
      _$SearchStateCopyWithImpl;
  @useResult
  $Res call(
      {SearchPageStatus status,
      int page,
      String query,
      List<MovieItemEntity> movies,
      bool isEnd,
      String typingQuery,
      List<SearchSuggestionEntity> suggestions,
      bool isSuggestionLoading,
      bool showSuggestions});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res> implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._self, this._then);

  final SearchState _self;
  final $Res Function(SearchState) _then;

  /// Create a copy of SearchState
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
    Object? showSuggestions = null,
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
              as List<MovieItemEntity>,
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
              as List<SearchSuggestionEntity>,
      isSuggestionLoading: null == isSuggestionLoading
          ? _self.isSuggestionLoading
          : isSuggestionLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      showSuggestions: null == showSuggestions
          ? _self.showSuggestions
          : showSuggestions // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
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
    TResult Function(_SearchState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchState() when $default != null:
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
    TResult Function(_SearchState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchState():
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
    TResult? Function(_SearchState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchState() when $default != null:
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
            List<MovieItemEntity> movies,
            bool isEnd,
            String typingQuery,
            List<SearchSuggestionEntity> suggestions,
            bool isSuggestionLoading,
            bool showSuggestions)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SearchState() when $default != null:
        return $default(
            _that.status,
            _that.page,
            _that.query,
            _that.movies,
            _that.isEnd,
            _that.typingQuery,
            _that.suggestions,
            _that.isSuggestionLoading,
            _that.showSuggestions);
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
            List<MovieItemEntity> movies,
            bool isEnd,
            String typingQuery,
            List<SearchSuggestionEntity> suggestions,
            bool isSuggestionLoading,
            bool showSuggestions)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchState():
        return $default(
            _that.status,
            _that.page,
            _that.query,
            _that.movies,
            _that.isEnd,
            _that.typingQuery,
            _that.suggestions,
            _that.isSuggestionLoading,
            _that.showSuggestions);
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
            List<MovieItemEntity> movies,
            bool isEnd,
            String typingQuery,
            List<SearchSuggestionEntity> suggestions,
            bool isSuggestionLoading,
            bool showSuggestions)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SearchState() when $default != null:
        return $default(
            _that.status,
            _that.page,
            _that.query,
            _that.movies,
            _that.isEnd,
            _that.typingQuery,
            _that.suggestions,
            _that.isSuggestionLoading,
            _that.showSuggestions);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SearchState extends SearchState {
  const _SearchState(
      [this.status = SearchPageStatus.init,
      this.page = 1,
      this.query = "",
      final List<MovieItemEntity> movies = const [],
      this.isEnd = false,
      this.typingQuery = "",
      final List<SearchSuggestionEntity> suggestions = const [],
      this.isSuggestionLoading = false,
      this.showSuggestions = false])
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
  @override
  @JsonKey()
  final String typingQuery;
  final List<SearchSuggestionEntity> _suggestions;
  @override
  @JsonKey()
  List<SearchSuggestionEntity> get suggestions {
    if (_suggestions is EqualUnmodifiableListView) return _suggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestions);
  }

  @override
  @JsonKey()
  final bool isSuggestionLoading;
  @override
  @JsonKey()
  final bool showSuggestions;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchStateCopyWith<_SearchState> get copyWith =>
      __$SearchStateCopyWithImpl<_SearchState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchState &&
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
                other.isSuggestionLoading == isSuggestionLoading) &&
            (identical(other.showSuggestions, showSuggestions) ||
                other.showSuggestions == showSuggestions));
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
      isSuggestionLoading,
      showSuggestions);

  @override
  String toString() {
    return 'SearchState(status: $status, page: $page, query: $query, movies: $movies, isEnd: $isEnd, typingQuery: $typingQuery, suggestions: $suggestions, isSuggestionLoading: $isSuggestionLoading, showSuggestions: $showSuggestions)';
  }
}

/// @nodoc
abstract mixin class _$SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$SearchStateCopyWith(
          _SearchState value, $Res Function(_SearchState) _then) =
      __$SearchStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {SearchPageStatus status,
      int page,
      String query,
      List<MovieItemEntity> movies,
      bool isEnd,
      String typingQuery,
      List<SearchSuggestionEntity> suggestions,
      bool isSuggestionLoading,
      bool showSuggestions});
}

/// @nodoc
class __$SearchStateCopyWithImpl<$Res> implements _$SearchStateCopyWith<$Res> {
  __$SearchStateCopyWithImpl(this._self, this._then);

  final _SearchState _self;
  final $Res Function(_SearchState) _then;

  /// Create a copy of SearchState
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
    Object? showSuggestions = null,
  }) {
    return _then(_SearchState(
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
              as List<MovieItemEntity>,
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
              as List<SearchSuggestionEntity>,
      null == isSuggestionLoading
          ? _self.isSuggestionLoading
          : isSuggestionLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      null == showSuggestions
          ? _self.showSuggestions
          : showSuggestions // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
