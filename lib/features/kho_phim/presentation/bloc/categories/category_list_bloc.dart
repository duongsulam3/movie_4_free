import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:smoth_movie_app/core/utils/enum/kho_phim/categories_state_status.dart';
import 'package:smoth_movie_app/features/kho_phim/domain/entity/kho_phim_category_entity.dart';
import 'package:smoth_movie_app/features/kho_phim/domain/usecase/get_categories.dart';

part 'category_list_event.dart';
part 'category_list_state.dart';
part 'category_list_bloc.freezed.dart';

class CategoryListBloc extends Bloc<CategoryListEvent, CategoryListState> {
  final GetCategories getCategories;
  CategoryListBloc(this.getCategories) : super(const CategoryListState()) {
    on<GetAllCategories>((event, emit) async {
      emit(state.copyWith(status: CategoriesStateStatus.loading));
      List<KhoPhimCategoryEntity> categories = const [];
      final res = await getCategories.call();
      res.fold(
        (err) => emit(state.copyWith(status: CategoriesStateStatus.error)),
        (data) {
          categories = data;
          emit(state.copyWith(
            status: CategoriesStateStatus.success,
            categories: categories,
          ));
        },
      );
    });
  }
}
