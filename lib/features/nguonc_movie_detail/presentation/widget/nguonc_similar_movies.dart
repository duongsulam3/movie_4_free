import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/core/utils/secret/app_secret.dart';
import 'package:smoth_movie_app/features/nguonc_categories/domain/entity/nguonc_category_item_entity.dart';
import 'package:smoth_movie_app/features/nguonc_categories/presentation/bloc/movies_by_category_bloc.dart';
import 'package:smoth_movie_app/features/nguonc_categories/presentation/widget/nguonc_movies_by_cate.dart';
import 'package:smoth_movie_app/init_dependencies.dart';

class NguoncSimilarMovies extends StatefulWidget {
  const NguoncSimilarMovies({
    super.key,
    required this.category,
    required this.watchingMovieSlug,
  });

  final String category;
  final String watchingMovieSlug;

  @override
  State<NguoncSimilarMovies> createState() => _NguoncSimilarMoviesState();
}

class _NguoncSimilarMoviesState extends State<NguoncSimilarMovies> {
  List<NguoncCategoryItemEntity> categories = const [];
  String slug = "";

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getCategories() async {
    final jsonString = await rootBundle.loadString(
      AppSecret.nguoncCategoriesJson,
    );
    categories = await Helper.parseNguoncCategories(jsonString);
  }

  void compareCategories() {
    if (categories.isEmpty) return;
    for (int i = 0; i < categories.length; i++) {
      if (widget.category.contains(categories[i].name)) {
        slug = categories[i].slug;
        return;
      }
    }
  }

  void init() async {
    await getCategories();
    compareCategories();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return categories.isEmpty
        ? const SizedBox.shrink()
        : BlocProvider<MoviesByCategoryBloc>(
            create: (context) => serviceLocator(),
            child: NguoncMoviesByCate(
              slug: slug,
              watchingMovieSlug: widget.watchingMovieSlug,
            ),
          );
  }
}
