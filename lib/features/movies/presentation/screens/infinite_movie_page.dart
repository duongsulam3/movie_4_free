import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/movies_bloc/movies_bloc.dart';
import 'package:smoth_movie_app/features/movies/presentation/screens/widgets/movies_widget.dart';
import 'package:smoth_movie_app/init_dependencies.dart';

class InfiniteMoviePage extends StatelessWidget {
  final String title;
  const InfiniteMoviePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ResponsiveText(text: title, fontSize: 24),
      ),
      body: BlocProvider(
        create: (context) => serviceLocator<MoviesBloc>()
          ..add(const GetListMovies(
            path: 'hoat-hinh',
            limit: 18,
          )),
        child: const MoviesList(path: 'hoat-hinh'),
      ),
    );
  }
}
