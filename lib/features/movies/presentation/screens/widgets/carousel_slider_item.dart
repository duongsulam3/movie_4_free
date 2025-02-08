import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/model/movie_detail_param_model.dart';
import 'package:smoth_movie_app/features/movies/domain/entities/currently_update_movies/recently_update_list_item.dart';

class CarouselSliderItem extends StatelessWidget {
  const CarouselSliderItem({
    super.key,
    required this.items,
    required this.itemIndex,
  });

  final List<RecentlyUpdateListItemEntity> items;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    //
    final sHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        "movie_detail",
        arguments: MovieDetailParamModel(slug: items[itemIndex].slug),
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
            BoxShadow(
              color: Colors.grey,
              blurRadius: 4,
              offset: Offset(2, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(sHeight / (sHeight / 20)),
          image: DecorationImage(
            image: NetworkImage(items[itemIndex].posterUrl),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
