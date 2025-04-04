import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/search_textfield_widget.dart';
import 'package:smoth_movie_app/features/search/presentation/widgets/list_search_content.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key,
    required this.searchHint,
    required this.listSearch,
  });
  final String searchHint;
  final List<String> listSearch;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //TextController
  final searchController = TextEditingController();
  final searchFocusNode = FocusNode();
  final scrollController = ScrollController();

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Expanded(
              child: SearchTextField(
                focusNode: searchFocusNode,
                hintText: widget.searchHint,
                controller: searchController,
                onSubmitted: (value) => Helper.onSubmitSearch(
                  context,
                  value,
                  20,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListSearchContent(
          onSelected: (value) => searchController.text = value,
          listSearch: widget.listSearch,
        ),
      ),
    );
  }
}
