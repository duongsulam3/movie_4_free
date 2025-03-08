import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/features/home/home_search/presentation/bloc/search_bloc.dart';
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
        if (state is SearchLoadingState) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (state is SearchSuccessState) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return SearchItemWidget(
                movie: state.movies[index],
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: screenHeight / (screenHeight / 20),
              );
            },
            itemCount: state.movies.length,
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ResponsiveText(
                text: "Tìm kiếm nhiều nhất",
                fontSize: 24,
              ),
              SizedBox(height: screenHeight / (screenHeight / 20)),
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  return Row(
                    children: [
                      const Icon(
                        CupertinoIcons.bolt_horizontal_circle,
                        size: 16,
                      ),
                      SizedBox(width: screenWidth / (screenWidth / 10)),
                      ResponsiveText(
                        text: topSearchList[i],
                        fontSize: 16,
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, i) {
                  return SizedBox(height: screenHeight / (screenHeight / 10));
                },
                itemCount: topSearchList.length,
              ),
            ],
          );
        }
      },
    );
  }
}
