import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/route_params_model/search_textfield_param_model.dart';
import 'package:smoth_movie_app/common/widgets/responsive_asset_image.dart';
import 'package:smoth_movie_app/common/widgets/search_textfield_widget.dart';
import 'package:smoth_movie_app/router/app_router.dart';

class LogoAndWidget extends StatefulWidget {
  const LogoAndWidget({super.key});

  @override
  State<LogoAndWidget> createState() => _LogoAndWidgetState();
}

class _LogoAndWidgetState extends State<LogoAndWidget> {
  final hints = const <String>[
    "Avatar: The Way of Water",
    "The Flash",
    "The Batman",
    "Loki Season 2",
    "Stranger Things",
    "Stranger Things Season 2",
    "Stranger Things Season 3",
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
    final sHeight = MediaQuery.of(context).size.height;
    final sWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: sHeight / (sHeight / 10)),
      child: Row(
        spacing: sWidth / (sWidth / 10),
        children: [
          const Expanded(
            flex: 1,
            child: ResponsiveAssetImage(path: "assets/images/logo_dark.png"),
          ),
          Expanded(
            flex: 6,
            child: SearchTextField(
              hintText: currentHint,
              isFocus: false,
              onTap: () => Navigator.of(context).pushNamed(
                AppRouter.homeSearch,
                arguments: SearchTextfieldParamModel(searchHint: currentHint),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
