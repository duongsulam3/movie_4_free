import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_supper_app_core/core.dart';
import 'package:smoth_movie_app/common/utils/enum/recommend_movies/recommend_movies_state_status.dart';
import 'package:smoth_movie_app/features/recommend_movies/presentation/bloc/recommend_movies/recommend_movies_bloc.dart';

import '../../../../common/router/app_router.dart';
import '../../../../common/router/params/search_textfield_param_model.dart';
import '../../../../common/widgets/search_textfield_widget.dart';

class TextFieldChangeHint extends StatefulWidget {
  const TextFieldChangeHint({super.key});

  @override
  State<TextFieldChangeHint> createState() => _TextFieldChangeHintState();
}

class _TextFieldChangeHintState extends State<TextFieldChangeHint> {
  final fallbackHints = const <String>[
    "The Shawshank Redemption",
    "The Godfather",
    "The Dark Knight",
    "Pulp Fiction",
    "Forrest Gump",
  ];
  late Timer _timer;
  List<String> hints = const [];

  late String currentHint;

  @override
  void initState() {
    currentHint = fallbackHints[0];
    hints = fallbackHints;
    startHintRotation();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startHintRotation() {
    int index = 0;
    _timer = Timer.periodic(const Duration(seconds: 10), (_) {
      setState(() {
        currentHint = hints[index];
        index = (index + 1) % hints.length;
      });
    });
  }

  void updateHints(List<String> newHints) {
    if (newHints.isEmpty || listEquals(hints, newHints)) return;
    setState(() {
      hints = newHints;
      currentHint = hints[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RecommendMoviesBloc, RecommendMoviesState>(
      listener: (context, state) {
        if (state.status == RecommendMoviesStatus.success) {
          updateHints(state.titles);
        }
      },
      child: Expanded(
        flex: 6,
        child: SearchTextField(
          hintText: currentHint,
          isFocus: false,
          onTap: () => Navigator.of(context).pushNamed(
            AppRouter.homeSearch,
            arguments: SearchTextfieldParamModel(
              searchHint: currentHint,
              listSearch: hints,
            ),
          ),
        ),
      ),
    );
  }
}
