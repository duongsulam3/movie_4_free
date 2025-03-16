part of 'category_list_bloc.dart';

@freezed
abstract class CategoryListState with _$CategoryListState {
  const CategoryListState._();
  const factory CategoryListState([
    @Default(CategoriesStateStatus.init) CategoriesStateStatus status,
    @Default([]) List<KhoPhimCategoryEntity> categories,
  ]) = _CategoryListState;
}