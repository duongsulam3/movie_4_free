import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/features/home/presentation/widgets/row_title_and_more.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/movies_bloc/movies_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/movies_widget.dart';
import 'package:smoth_movie_app/init_dependencies.dart';

class TitleAndGridViewList extends StatelessWidget {
  const TitleAndGridViewList({
    super.key,
    required this.sHeight,
    required this.title,
    required this.path,
  });

  final double sHeight;
  final String title;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(sHeight / (sHeight / 5)),
      child: Column(
        children: [
          RowTitleAndMore(
            title: title,
            onTap: () {},
          ),
          BlocProvider(
            create: (context) => serviceLocator<MoviesBloc>(),
            child: GridViewMoviesWidget(path: path),
          ),
        ],
      ),
    );
  }
}