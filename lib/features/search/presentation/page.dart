import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/widgets/search_textfield_widget.dart';
import 'package:smoth_movie_app/features/nguonc_search_movies/presentation/widget/list_search_nguonc_blocbuilder.dart';
import 'package:smoth_movie_app/features/search/presentation/widgets/list_search_content.dart';
import 'package:smoth_movie_app/core/utils/helper/helper.dart';
import 'package:smoth_movie_app/features/search/presentation/widgets/search_page_tabs_content.dart';
import 'package:smoth_movie_app/features/search/presentation/widgets/search_tabbar.dart';

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

  late final List<Widget> searchTabsView;
  late final List<String> searchTabsBar;
  final searchTabsLength = 2;

  @override
  void initState() {
    searchFocusNode.requestFocus();
    initSearchTabsView();
    initSearchTabsBar();
    super.initState();
  }

  @override
  void dispose() {
    pageDispose();
    super.dispose();
  }

  void initSearchTabsBar() {
    searchTabsBar = [
      "Nguồn chính",
      "Nguồn phụ",
    ];
  }

  void initSearchTabsView() {
    searchTabsView = [
      ListSearchContent(
        onSelected: (value) => searchController.text = value,
        listSearch: widget.listSearch,
      ),
      ListSearchNguoncContent(
        onSelected: (value) => searchController.text = value,
        listSearch: widget.listSearch,
      ),
    ];
  }

  void pageDispose() {
    searchFocusNode.unfocus();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: searchTabsLength,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          bottom: SearchTabBar(
            searchTabsLength: searchTabsLength,
            searchTabsBar: searchTabsBar,
          ),
          title: SearchTextField(
            focusNode: searchFocusNode,
            hintText: widget.searchHint,
            controller: searchController,
            onSubmitted: (value) {
              Helper.onSubmitSearch(context, value, 10);
              Helper.nguonCSearchFilms(context, value);
            },
          ),
        ),
        body: SearchPageTabsContent(
          searchTabsLength: searchTabsLength,
          searchTabsView: searchTabsView,
        ),
      ),
    );
  }
}
