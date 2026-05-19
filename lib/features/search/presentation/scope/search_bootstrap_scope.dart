import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/di/init_dependencies.dart';
import '../bloc/search_bloc.dart';

class SearchBootstrapScope extends StatelessWidget {
  const SearchBootstrapScope({
    super.key,
    required this.child,
  });

  final Widget child;

  SearchBloc _createSearchBloc() => serviceLocator<SearchBloc>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchBloc>(
          create: (_) => _createSearchBloc(),
        ),
      ],
      child: child,
    );
  }
}
