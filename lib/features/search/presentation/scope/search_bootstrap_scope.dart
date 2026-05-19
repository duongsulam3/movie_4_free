import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/di/init_dependencies.dart';
import '../bloc/search_bloc.dart';
import '../cubit/search_history_cubit.dart';

class SearchBootstrapScope extends StatelessWidget {
  const SearchBootstrapScope({
    super.key,
    required this.child,
  });

  final Widget child;

  SearchBloc _createSearchBloc() => serviceLocator<SearchBloc>();
  SearchHistoryCubit _createSearchHistoryCubit() =>
      serviceLocator<SearchHistoryCubit>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchBloc>(
          create: (_) => _createSearchBloc(),
        ),
        BlocProvider<SearchHistoryCubit>(
          create: (_) => _createSearchHistoryCubit(),
        ),
      ],
      child: child,
    );
  }
}
