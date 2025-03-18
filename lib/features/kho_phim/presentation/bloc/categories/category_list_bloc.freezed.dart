// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CategoryListState {
  CategoriesStateStatus get status;
  List<KhoPhimCategoryEntity> get categories;

  /// Create a copy of CategoryListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CategoryListStateCopyWith<CategoryListState> get copyWith =>
      _$CategoryListStateCopyWithImpl<CategoryListState>(
          this as CategoryListState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CategoryListState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other.categories, categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(categories));

  @override
  String toString() {
    return 'CategoryListState(status: $status, categories: $categories)';
  }
}

/// @nodoc
abstract mixin class $CategoryListStateCopyWith<$Res> {
  factory $CategoryListStateCopyWith(
          CategoryListState value, $Res Function(CategoryListState) _then) =
      _$CategoryListStateCopyWithImpl;
  @useResult
  $Res call(
      {CategoriesStateStatus status, List<KhoPhimCategoryEntity> categories});
}

/// @nodoc
class _$CategoryListStateCopyWithImpl<$Res>
    implements $CategoryListStateCopyWith<$Res> {
  _$CategoryListStateCopyWithImpl(this._self, this._then);

  final CategoryListState _self;
  final $Res Function(CategoryListState) _then;

  /// Create a copy of CategoryListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? categories = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CategoriesStateStatus,
      categories: null == categories
          ? _self.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<KhoPhimCategoryEntity>,
    ));
  }
}

/// @nodoc

class _CategoryListState extends CategoryListState {
  const _CategoryListState(
      [this.status = CategoriesStateStatus.init,
      final List<KhoPhimCategoryEntity> categories = const []])
      : _categories = categories,
        super._();

  @override
  @JsonKey()
  final CategoriesStateStatus status;
  final List<KhoPhimCategoryEntity> _categories;
  @override
  @JsonKey()
  List<KhoPhimCategoryEntity> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  /// Create a copy of CategoryListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CategoryListStateCopyWith<_CategoryListState> get copyWith =>
      __$CategoryListStateCopyWithImpl<_CategoryListState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CategoryListState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_categories));

  @override
  String toString() {
    return 'CategoryListState(status: $status, categories: $categories)';
  }
}

/// @nodoc
abstract mixin class _$CategoryListStateCopyWith<$Res>
    implements $CategoryListStateCopyWith<$Res> {
  factory _$CategoryListStateCopyWith(
          _CategoryListState value, $Res Function(_CategoryListState) _then) =
      __$CategoryListStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {CategoriesStateStatus status, List<KhoPhimCategoryEntity> categories});
}

/// @nodoc
class __$CategoryListStateCopyWithImpl<$Res>
    implements _$CategoryListStateCopyWith<$Res> {
  __$CategoryListStateCopyWithImpl(this._self, this._then);

  final _CategoryListState _self;
  final $Res Function(_CategoryListState) _then;

  /// Create a copy of CategoryListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? categories = null,
  }) {
    return _then(_CategoryListState(
      null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CategoriesStateStatus,
      null == categories
          ? _self._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<KhoPhimCategoryEntity>,
    ));
  }
}

// dart format on
