// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'countries_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CountriesState {
  CountriesStateStatus get status;
  List<KhoPhimCountryEntity> get countries;

  /// Create a copy of CountriesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CountriesStateCopyWith<CountriesState> get copyWith =>
      _$CountriesStateCopyWithImpl<CountriesState>(
          this as CountriesState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CountriesState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.countries, countries));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(countries));

  @override
  String toString() {
    return 'CountriesState(status: $status, countries: $countries)';
  }
}

/// @nodoc
abstract mixin class $CountriesStateCopyWith<$Res> {
  factory $CountriesStateCopyWith(
          CountriesState value, $Res Function(CountriesState) _then) =
      _$CountriesStateCopyWithImpl;
  @useResult
  $Res call(
      {CountriesStateStatus status, List<KhoPhimCountryEntity> countries});
}

/// @nodoc
class _$CountriesStateCopyWithImpl<$Res>
    implements $CountriesStateCopyWith<$Res> {
  _$CountriesStateCopyWithImpl(this._self, this._then);

  final CountriesState _self;
  final $Res Function(CountriesState) _then;

  /// Create a copy of CountriesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? countries = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CountriesStateStatus,
      countries: null == countries
          ? _self.countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<KhoPhimCountryEntity>,
    ));
  }
}

/// Adds pattern-matching-related methods to [CountriesState].
extension CountriesStatePatterns on CountriesState {
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
    TResult Function(_CountriesState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CountriesState() when $default != null:
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
    TResult Function(_CountriesState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CountriesState():
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
    TResult? Function(_CountriesState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CountriesState() when $default != null:
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
            CountriesStateStatus status, List<KhoPhimCountryEntity> countries)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CountriesState() when $default != null:
        return $default(_that.status, _that.countries);
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
            CountriesStateStatus status, List<KhoPhimCountryEntity> countries)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CountriesState():
        return $default(_that.status, _that.countries);
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
            CountriesStateStatus status, List<KhoPhimCountryEntity> countries)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CountriesState() when $default != null:
        return $default(_that.status, _that.countries);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CountriesState extends CountriesState {
  const _CountriesState(
      [this.status = CountriesStateStatus.init,
      final List<KhoPhimCountryEntity> countries = const []])
      : _countries = countries,
        super._();

  @override
  @JsonKey()
  final CountriesStateStatus status;
  final List<KhoPhimCountryEntity> _countries;
  @override
  @JsonKey()
  List<KhoPhimCountryEntity> get countries {
    if (_countries is EqualUnmodifiableListView) return _countries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_countries);
  }

  /// Create a copy of CountriesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CountriesStateCopyWith<_CountriesState> get copyWith =>
      __$CountriesStateCopyWithImpl<_CountriesState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CountriesState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._countries, _countries));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_countries));

  @override
  String toString() {
    return 'CountriesState(status: $status, countries: $countries)';
  }
}

/// @nodoc
abstract mixin class _$CountriesStateCopyWith<$Res>
    implements $CountriesStateCopyWith<$Res> {
  factory _$CountriesStateCopyWith(
          _CountriesState value, $Res Function(_CountriesState) _then) =
      __$CountriesStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {CountriesStateStatus status, List<KhoPhimCountryEntity> countries});
}

/// @nodoc
class __$CountriesStateCopyWithImpl<$Res>
    implements _$CountriesStateCopyWith<$Res> {
  __$CountriesStateCopyWithImpl(this._self, this._then);

  final _CountriesState _self;
  final $Res Function(_CountriesState) _then;

  /// Create a copy of CountriesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? countries = null,
  }) {
    return _then(_CountriesState(
      null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CountriesStateStatus,
      null == countries
          ? _self._countries
          : countries // ignore: cast_nullable_to_non_nullable
              as List<KhoPhimCountryEntity>,
    ));
  }
}

// dart format on
