import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/list_movie_item_bloc/list_movie_item_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/widgets/custom_carousel_slider.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<ListMovieItemBloc, ListMovieItemBlocState>(
      bloc: context.read<ListMovieItemBloc>()
        ..add(GetRecentlyUpdateMovieList()),
      buildWhen: (previous, current) =>
          current is GetListRecentlyUpdateMovieStateSuccess,
      builder: (context, state) {
        if (state is GetListRecentlyUpdateMovieStateSuccess) {
          final items = state.movies;
          return CustomCarouselSliderWidget(sHeight: sHeight, items: items);
        } else {
          return SizedBox(
            height: sHeight / (sHeight / 350),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}


