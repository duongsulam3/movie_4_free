import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/di/init_dependencies.dart';
import '../bloc/search_main_bloc/search_bloc.dart';
import '../bloc/search_history_bloc/search_history_bloc.dart';

class SearchBootstrapScope extends StatelessWidget {
  const SearchBootstrapScope({
    super.key,
    required this.child,
  });

  final Widget child;

  SearchBloc _createSearchBloc() => serviceLocator<SearchBloc>();
  SearchHistoryBloc _createSearchHistoryBloc() =>
      serviceLocator<SearchHistoryBloc>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchBloc>(
          create: (_) => _createSearchBloc(),
        ),
        BlocProvider<SearchHistoryBloc>(
          create: (_) => _createSearchHistoryBloc(),
        ),
      ],
      child: child,
    );
  }
}
