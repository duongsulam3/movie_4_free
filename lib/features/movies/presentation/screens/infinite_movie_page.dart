import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:smoth_movie_app/features/movies/presentation/bloc/movies_bloc/movies_bloc.dart';
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
          ..add(const GetListMovies(path: 'hoat-hinh')),
        child: const MoviesList(),
      ),
    );
  }
}

class MoviesList extends StatefulWidget {
  const MoviesList({super.key});

  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _scrollController.addListener(_onClose);
    super.initState();
  }

  void _onClose() {
    if (_isBottom) {
      context.read<MoviesBloc>().add(const GetListMovies(path: "hoat-hinh"));
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (_, state) {
        switch (state.status) {
          case MoviesStateStatus.init:
            return const Center(child: CircularProgressIndicator.adaptive());
          case MoviesStateStatus.error:
            return const Center(
              child: Text('Failed to fetch posts'),
            );
          case MoviesStateStatus.success:
            log(state.page.toString());
            if (state.movies.isEmpty) {
              return const Center(
                child: Text('No more movies'),
              );
            }
            return ListView.builder(
              itemBuilder: (_, i) {
                return i >= state.movies.length
                    ? const Center(child: CircularProgressIndicator.adaptive())
                    : ListTile(
                        title: Text(
                          state.movies[i].name,
                          style: const TextStyle(fontSize: 30),
                        ),
                        subtitle: Text(state.movies[i].originName),
                      );
              },
              itemCount:
                  state.isEnd ? state.movies.length : state.movies.length + 1,
              controller: _scrollController,
            );
        }
      },
    );
  }
}
