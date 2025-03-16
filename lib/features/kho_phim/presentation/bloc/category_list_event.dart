part of 'category_list_bloc.dart';

@immutable
sealed class CategoryListEvent {
  const CategoryListEvent();
}

class GetAllCategories extends CategoryListEvent {
  const GetAllCategories();
}
