import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/common/widgets/responsive_small_text.dart';
import 'package:http/http.dart' as http;
import 'package:smoth_movie_app/features/movies/presentation/bloc/movies_bloc/movies_bloc.dart';

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
        create: (context) => MoviesBlocBloc(httpClient: http.Client())
          ..add(const MovieBlocEventFetch(page: 1)),
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
      context.read<MoviesBlocBloc>().add(const MovieBlocEventFetch(page: 1));
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
    return BlocBuilder<MoviesBlocBloc, MoviesBlocState>(builder: (_, state) {
      switch (state.status) {
        case MovieStatus.initial:
          return const Center(child: CircularProgressIndicator());
        case MovieStatus.failure:
          return const Center(
            child: Text('Failed to fetch posts'),
          );
        case MovieStatus.success:
          if (state.movies.isEmpty) {
            return const Center(
              child: Text('No posts'),
            );
          }
          return ListView.builder(
            itemBuilder: (_, i) {
              return i >= state.movies.length
                  ? const Center(child: CircularProgressIndicator())
                  : ListTile(
                      title: Text(state.movies[i].name),
                      subtitle: Text(state.movies[i].originName),
                    );
            },
            itemCount: state.hasReachedMax
                ? state.movies.length
                : state.movies.length + 1,
            controller: _scrollController,
          );
      }
    });
  }
}
