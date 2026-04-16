// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kho_phim_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KhoPhimPageState {
  KhoPhimPageStatus get status;
  List<KhoPhimCountryEntity> get countries;
  List<KhoPhimCategoryEntity> get categories;
  List<String> get years;
  List<String> get langs;

  /// Create a copy of KhoPhimPageState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $KhoPhimPageStateCopyWith<KhoPhimPageState> get copyWith =>
      _$KhoPhimPageStateCopyWithImpl<KhoPhimPageState>(
          this as KhoPhimPageState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is KhoPhimPageState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.countries, countries) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories) &&
            const DeepCollectionEquality().equals(other.years, years) &&
            const DeepCollectionEquality().equals(other.langs, langs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(countries),
      const DeepCollectionEquality().hash(categories),
      const DeepCollectionEquality().hash(years),
      const DeepCollectionEquality().hash(langs));

  @override
  String toString() {
    return 'KhoPhimPageState(status: $status, countries: $countries, categories: $categories, years: $years, langs: $langs)';
  }
}

/// @nodoc
abstract mixin class $KhoPhimPageStateCopyWith<$Res> {
  factory $KhoPhimPageStateCopyWith(
          KhoPhimPageState value, $Res Function(KhoPhimPageState) _then) =
      _$KhoPhimPageStateCopyWithImpl;
  @useResult
  $Res call(
      {KhoPhimPageStatus status,
      List<KhoPhimCountryEntity> countries,
      List<KhoPhimCategoryEntity> categories,
      List<String> years,
      List<String> langs});
}

/// @nodoc
class _$KhoPhimPageStateCopyWithImpl<$Res>
    implements $KhoPhimPageStateCopyWith<$Res> {
  _$KhoPhimPageStateCopyWithImpl(this._self, this._then);

  final KhoPhimPageState _self;
  final $Res Function(KhoPhimPageState) _then;

  /// Create a copy of KhoPhimPageState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? countries = null,
    Object? categories = null,
    Object? years = null,
    Object? langs = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as KhoPhimPageStatus,
      countries: null == countries
          ? _self.countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<KhoPhimCountryEntity>,
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<KhoPhimCategoryEntity>,
      years: null == years
          ? _self.years
          : years // ignore: cast_nullable_to_non_nullable
              as List<String>,
      langs: null == langs
          ? _self.langs
          : langs // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// Adds pattern-matching-related methods to [KhoPhimPageState].
extension KhoPhimPageStatePatterns on KhoPhimPageState {
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
    TResult Function(_KhoPhimPageState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KhoPhimPageState() when $default != null:
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
    TResult Function(_KhoPhimPageState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KhoPhimPageState():
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
    TResult? Function(_KhoPhimPageState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KhoPhimPageState() when $default != null:
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
            KhoPhimPageStatus status,
            List<KhoPhimCountryEntity> countries,
            List<KhoPhimCategoryEntity> categories,
            List<String> years,
            List<String> langs)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _KhoPhimPageState() when $default != null:
        return $default(_that.status, _that.countries, _that.categories,
            _that.years, _that.langs);
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
            KhoPhimPageStatus status,
            List<KhoPhimCountryEntity> countries,
            List<KhoPhimCategoryEntity> categories,
            List<String> years,
            List<String> langs)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KhoPhimPageState():
        return $default(_that.status, _that.countries, _that.categories,
            _that.years, _that.langs);
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
            KhoPhimPageStatus status,
            List<KhoPhimCountryEntity> countries,
            List<KhoPhimCategoryEntity> categories,
            List<String> years,
            List<String> langs)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _KhoPhimPageState() when $default != null:
        return $default(_that.status, _that.countries, _that.categories,
            _that.years, _that.langs);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _KhoPhimPageState extends KhoPhimPageState {
  const _KhoPhimPageState(
      [this.status = KhoPhimPageStatus.init,
      final List<KhoPhimCountryEntity> countries = const [],
      final List<KhoPhimCategoryEntity> categories = const [],
      final List<String> years = const [],
      final List<String> langs = const []])
      : _countries = countries,
        _categories = categories,
        _years = years,
        _langs = langs,
        super._();

  @override
  @JsonKey()
  final KhoPhimPageStatus status;
  final List<KhoPhimCountryEntity> _countries;
  @override
  @JsonKey()
  List<KhoPhimCountryEntity> get countries {
    if (_countries is EqualUnmodifiableListView) return _countries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_countries);
  }

  final List<KhoPhimCategoryEntity> _categories;
  @override
  @JsonKey()
  List<KhoPhimCategoryEntity> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<String> _years;
  @override
  @JsonKey()
  List<String> get years {
    if (_years is EqualUnmodifiableListView) return _years;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_years);
  }

  final List<String> _langs;
  @override
  @JsonKey()
  List<String> get langs {
    if (_langs is EqualUnmodifiableListView) return _langs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_langs);
  }

  /// Create a copy of KhoPhimPageState
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
            const DeepCollectionEquality()
                .equals(other._countries, _countries) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._years, _years) &&
            const DeepCollectionEquality().equals(other._langs, _langs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_countries),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_years),
      const DeepCollectionEquality().hash(_langs));

  @override
  String toString() {
    return 'KhoPhimPageState(status: $status, countries: $countries, categories: $categories, years: $years, langs: $langs)';
  }
}

/// @nodoc
abstract mixin class _$KhoPhimPageStateCopyWith<$Res>
    implements $KhoPhimPageStateCopyWith<$Res> {
  factory _$KhoPhimPageStateCopyWith(
          _KhoPhimPageState value, $Res Function(_KhoPhimPageState) _then) =
      __$KhoPhimPageStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {KhoPhimPageStatus status,
      List<KhoPhimCountryEntity> countries,
      List<KhoPhimCategoryEntity> categories,
      List<String> years,
      List<String> langs});
}

/// @nodoc
class __$KhoPhimPageStateCopyWithImpl<$Res>
    implements _$KhoPhimPageStateCopyWith<$Res> {
  __$KhoPhimPageStateCopyWithImpl(this._self, this._then);

  final _KhoPhimPageState _self;
  final $Res Function(_KhoPhimPageState) _then;

  /// Create a copy of KhoPhimPageState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? countries = null,
    Object? categories = null,
    Object? years = null,
    Object? langs = null,
  }) {
    return _then(_KhoPhimPageState(
      null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as KhoPhimPageStatus,
      null == countries
          ? _self._countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<KhoPhimCountryEntity>,
      null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<KhoPhimCategoryEntity>,
      null == years
          ? _self._years
          : years // ignore: cast_nullable_to_non_nullable
              as List<String>,
      null == langs
          ? _self._langs
          : langs // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

// dart format on
