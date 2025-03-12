import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/core/bloc/movies_state_status.dart';
import 'package:smoth_movie_app/core/error/error_page.dart';
import 'package:smoth_movie_app/features/home/home_search/presentation/bloc/search_bloc.dart';
import 'package:smoth_movie_app/features/home/home_search/presentation/widgets/search_init_widget.dart';
import 'package:smoth_movie_app/features/home/home_search/presentation/widgets/search_item_widget.dart';

class ListSearchContent extends StatelessWidget {
  final List<String> topSearchList;
  const ListSearchContent({super.key, required this.topSearchList});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        switch (state.status) {
          case MoviesStateStatus.init:
            return SearchInitWidget(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              topSearchList: topSearchList,
            );
          case MoviesStateStatus.error:
            return const ErrorPage();
          case MoviesStateStatus.success:
            return ListView.separated(
              shrinkWrap: true,
              itemCount: state.movies.length,
              itemBuilder: (BuildContext context, int index) {
                return SearchItemWidget(
                  movie: state.movies[index],
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const ResponsiveSizedBox(height: 20);
              },
            );
        }
      },
    );
  }
}

