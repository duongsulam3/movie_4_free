// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_shell_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeShellState {
  int get currentBottomIndex;
  Set<int> get initializedTopTabs;

  /// Create a copy of HomeShellState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeShellStateCopyWith<HomeShellState> get copyWith =>
      _$HomeShellStateCopyWithImpl<HomeShellState>(
          this as HomeShellState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeShellState &&
            (identical(other.currentBottomIndex, currentBottomIndex) ||
                other.currentBottomIndex == currentBottomIndex) &&
            const DeepCollectionEquality()
                .equals(other.initializedTopTabs, initializedTopTabs));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentBottomIndex,
      const DeepCollectionEquality().hash(initializedTopTabs));

  @override
  String toString() {
    return 'HomeShellState(currentBottomIndex: $currentBottomIndex, initializedTopTabs: $initializedTopTabs)';
  }
}

/// @nodoc
abstract mixin class $HomeShellStateCopyWith<$Res> {
  factory $HomeShellStateCopyWith(
          HomeShellState value, $Res Function(HomeShellState) _then) =
      _$HomeShellStateCopyWithImpl;
  @useResult
  $Res call({int currentBottomIndex, Set<int> initializedTopTabs});
}

/// @nodoc
class _$HomeShellStateCopyWithImpl<$Res>
    implements $HomeShellStateCopyWith<$Res> {
  _$HomeShellStateCopyWithImpl(this._self, this._then);

  final HomeShellState _self;
  final $Res Function(HomeShellState) _then;

  /// Create a copy of HomeShellState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentBottomIndex = null,
    Object? initializedTopTabs = null,
  }) {
    return _then(_self.copyWith(
      currentBottomIndex: null == currentBottomIndex
          ? _self.currentBottomIndex
          : currentBottomIndex // ignore: cast_nullable_to_non_nullable
              as int,
      initializedTopTabs: null == initializedTopTabs
          ? _self.initializedTopTabs
          : initializedTopTabs // ignore: cast_nullable_to_non_nullable
              as Set<int>,
    ));
  }
}

/// Adds pattern-matching-related methods to [HomeShellState].
extension HomeShellStatePatterns on HomeShellState {
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
    TResult Function(_HomeShellState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeShellState() when $default != null:
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
    TResult Function(_HomeShellState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeShellState():
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
    TResult? Function(_HomeShellState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeShellState() when $default != null:
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
    TResult Function(int currentBottomIndex, Set<int> initializedTopTabs)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeShellState() when $default != null:
        return $default(_that.currentBottomIndex, _that.initializedTopTabs);
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
    TResult Function(int currentBottomIndex, Set<int> initializedTopTabs)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeShellState():
        return $default(_that.currentBottomIndex, _that.initializedTopTabs);
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
    TResult? Function(int currentBottomIndex, Set<int> initializedTopTabs)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeShellState() when $default != null:
        return $default(_that.currentBottomIndex, _that.initializedTopTabs);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _HomeShellState extends HomeShellState {
  const _HomeShellState(
      {this.currentBottomIndex = 0,
      final Set<int> initializedTopTabs = const {0}})
      : _initializedTopTabs = initializedTopTabs,
        super._();

  @override
  @JsonKey()
  final int currentBottomIndex;
  final Set<int> _initializedTopTabs;
  @override
  @JsonKey()
  Set<int> get initializedTopTabs {
    if (_initializedTopTabs is EqualUnmodifiableSetView)
      return _initializedTopTabs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_initializedTopTabs);
  }

  /// Create a copy of HomeShellState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeShellStateCopyWith<_HomeShellState> get copyWith =>
      __$HomeShellStateCopyWithImpl<_HomeShellState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeShellState &&
            (identical(other.currentBottomIndex, currentBottomIndex) ||
                other.currentBottomIndex == currentBottomIndex) &&
            const DeepCollectionEquality()
                .equals(other._initializedTopTabs, _initializedTopTabs));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentBottomIndex,
      const DeepCollectionEquality().hash(_initializedTopTabs));

  @override
  String toString() {
    return 'HomeShellState(currentBottomIndex: $currentBottomIndex, initializedTopTabs: $initializedTopTabs)';
  }
}

/// @nodoc
abstract mixin class _$HomeShellStateCopyWith<$Res>
    implements $HomeShellStateCopyWith<$Res> {
  factory _$HomeShellStateCopyWith(
          _HomeShellState value, $Res Function(_HomeShellState) _then) =
      __$HomeShellStateCopyWithImpl;
  @override
  @useResult
  $Res call({int currentBottomIndex, Set<int> initializedTopTabs});
}

/// @nodoc
class __$HomeShellStateCopyWithImpl<$Res>
    implements _$HomeShellStateCopyWith<$Res> {
  __$HomeShellStateCopyWithImpl(this._self, this._then);

  final _HomeShellState _self;
  final $Res Function(_HomeShellState) _then;

  /// Create a copy of HomeShellState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentBottomIndex = null,
    Object? initializedTopTabs = null,
  }) {
    return _then(_HomeShellState(
      currentBottomIndex: null == currentBottomIndex
          ? _self.currentBottomIndex
          : currentBottomIndex // ignore: cast_nullable_to_non_nullable
              as int,
      initializedTopTabs: null == initializedTopTabs
          ? _self._initializedTopTabs
          : initializedTopTabs // ignore: cast_nullable_to_non_nullable
              as Set<int>,
    ));
  }
}

// dart format on
