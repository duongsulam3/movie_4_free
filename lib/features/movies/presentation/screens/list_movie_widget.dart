import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/responsive_sized_box.dart';
import 'package:smoth_movie_app/features/home/presentation/widgets/row_title_and_more.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/list_movie_item_bloc/list_movie_item_bloc.dart';
import 'package:smoth_movie_app/features/movie_detail/presentation/widgets/list_movie_item_widget.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/infinite_movie_page.dart';
// import 'package:smoth_movie_app/features/movies/presentation/screens/infinite_movie_page.dart';

class ListMovieWidget extends StatelessWidget {
  final String title;
  const ListMovieWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    final sWidth = MediaQuery.of(context).size.width;
    switch (title) {
      case "TV Shows":
        return Padding(
          padding: EdgeInsets.all(sHeight / (sHeight / 10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RowTitleAndMore(
                title: title,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InfiniteMoviePage(title: title),
                  ),
                ),
              ),
              // SizedBox(height: sHeight / (sHeight / 20)),
              const ResponsiveSizedBox(height: 20),
              ResponsiveSizedBox(
                height: 200,
                //!TV SHOWS
                child: BlocBuilder<ListMovieItemBloc, ListMovieItemBlocState>(
                  bloc: context.read<ListMovieItemBloc>()
                    ..add(GetTvShowsList()),
                  buildWhen: (previous, current) =>
                      current is GetTvShowsSuccess,
                  builder: (context, state) {
                    if (state is GetTvShowsSuccess) {
                      final items = state.movies;
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        itemBuilder: (context, i) {
                          return ListMovieItemWidget(
                            movie: items[i],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: sWidth / (sWidth / 10));
                        },
                      );
                    } else {
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        );
      case "Hoạt hình":
        return Padding(
          padding: EdgeInsets.all(sHeight / (sHeight / 10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RowTitleAndMore(title: title),
              const ResponsiveSizedBox(height: 20),
              ResponsiveSizedBox(
                height: 200,
                //!ANIME
                child: BlocBuilder<ListMovieItemBloc, ListMovieItemBlocState>(
                  bloc: context.read<ListMovieItemBloc>()
                    ..add(GetAnimeMovieList()),
                  buildWhen: (previous, current) =>
                      current is GetListAnimeMovieSuccess,
                  builder: (context, state) {
                    if (state is GetListAnimeMovieSuccess) {
                      final items = state.movies;
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        itemBuilder: (context, i) {
                          return ListMovieItemWidget(
                            movie: items[i],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: sWidth / (sWidth / 10));
                        },
                      );
                    } else {
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        );
      case "Phim lẻ":
        return Padding(
          padding: EdgeInsets.all(sHeight / (sHeight / 10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RowTitleAndMore(title: title),
              SizedBox(height: sHeight / (sHeight / 20)),
              SizedBox(
                height: sHeight / (sHeight / 200),
                child: BlocBuilder<ListMovieItemBloc, ListMovieItemBlocState>(
                  bloc: context.read<ListMovieItemBloc>()
                    ..add(GetSingleMovieList()),
                  buildWhen: (previous, current) =>
                      current is GetListSingleMovieSuccess,
                  builder: (context, state) {
                    if (state is GetListSingleMovieSuccess) {
                      final items = state.movies;
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        itemBuilder: (context, i) {
                          return ListMovieItemWidget(
                            movie: items[i],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: sWidth / (sWidth / 10));
                        },
                      );
                    } else {
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        );
      case "Phim bộ":
        return Padding(
          padding: EdgeInsets.all(sHeight / (sHeight / 10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RowTitleAndMore(title: title),
              SizedBox(height: sHeight / (sHeight / 20)),
              SizedBox(
                //! Phim bộ
                height: sHeight / (sHeight / 200),
                child: BlocBuilder<ListMovieItemBloc, ListMovieItemBlocState>(
                  bloc: context.read<ListMovieItemBloc>()
                    ..add(GetSeriesMovieList()),
                  buildWhen: (previous, current) =>
                      current is GetSeriesMovieSuccess,
                  builder: (context, state) {
                    if (state is GetSeriesMovieSuccess) {
                      final items = state.movies;
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        itemBuilder: (context, i) {
                          return ListMovieItemWidget(
                            movie: items[i],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(width: sWidth / (sWidth / 10));
                        },
                      );
                    } else {
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        );
    }
    return const SizedBox.shrink();
  }
}
