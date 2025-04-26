import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/search_textfield_widget.dart';
import 'package:smoth_movie_app/core/router/app_router.dart';
import 'package:smoth_movie_app/core/router/params/search_textfield_param_model.dart';

class TextFieldChangeHint extends StatefulWidget {
  const TextFieldChangeHint({
    super.key,
  });

  @override
  State<TextFieldChangeHint> createState() => _TextFieldChangeHintState();
}

class _TextFieldChangeHintState extends State<TextFieldChangeHint> {
  //TODO Change hints
  final hints = const <String>[
    "Gia tộc rồng",
    "Trò chơi vương quyền",
    "Bạch Nguyệt Phạn Tinh",
    "Trường Nguyệt Tẫn Minh",
    "Bất lương nhân",
    "Avatar",
    "Stranger Things",
    "The Dark Knight",
    "Loki",
    "The Witcher",
    "Jujutsu Kaisen",
    "Naruto Shippuden",
  ];
  late String currentHint;
  late Timer timer;

  @override
  void initState() {
    currentHint = hints[0];
    startHintRotation();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void startHintRotation() {
    int index = 0;
    timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      setState(() {
        index = (index + 1) % hints.length;
        currentHint = hints[index];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
