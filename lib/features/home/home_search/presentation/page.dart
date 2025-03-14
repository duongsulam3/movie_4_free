import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/custom_appbar_widget.dart';
import 'package:smoth_movie_app/common/widgets/search_textfield_widget.dart';
import 'package:smoth_movie_app/features/home/home_search/presentation/widgets/list_search_content.dart';
import 'package:smoth_movie_app/helper/helper.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //TextController
  final searchController = TextEditingController();
  final searchFocusNode = FocusNode();
  //List Top Search

  @override
  void initState() {
    searchFocusNode.requestFocus();
    super.initState();
  }

  @override
  void dispose() {
    searchFocusNode.unfocus();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;
    //
    return Scaffold(
      appBar: CustomAppbarWidget(
        appBarHeight: sHeight / (sHeight / 50),
        backgroundColor: Colors.transparent,
        titleWidget: Row(
          children: [
            Expanded(
              child: SearchTextField(
                focusNode: searchFocusNode,
                hintText: "Jujutsu Kaisen",
                controller: searchController,
                onSubmitted: (value) => Helper.onSubmitSearch(context, value),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: const ListSearchContent(),
      ),
    );
  }
}
