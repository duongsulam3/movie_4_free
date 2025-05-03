import 'package:flutter/material.dart';
import 'package:smoth_movie_app/common/entity/search_tabs_item.dart';
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

  static const int searchTabsLength = 2;
  static const double appBarHeight = 90.0;
  static const double appBarBottomHeight = 10.0;
  late final List<SearchTabsItem> searchTabsView;

  @override
  void initState() {
    searchFocusNode.requestFocus();
    initSearchTabsView();
    super.initState();
  }

  @override
  void dispose() {
    pageDispose();
    super.dispose();
  }

  void initSearchTabsView() {
    searchTabsView = [
      SearchTabsItem(
        title: "Nguồn chính",
        tabWidget: ListSearchContent(
          onSelected: (value) => searchController.text = value,
          listSearch: widget.listSearch,
        ),
      ),
      SearchTabsItem(
        title: "Nguồn phụ",
        tabWidget: ListSearchNguoncContent(
          onSelected: (value) => searchController.text = value,
          listSearch: widget.listSearch,
        ),
      )
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
          toolbarHeight: appBarHeight,
          backgroundColor: Colors.black,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(appBarBottomHeight),
            child: SearchTabBar(
              searchTabsLength: searchTabsLength,
              searchTabsBar: searchTabsView.map((e) => e.title).toList(),
            ),
          ),
          title: SearchTextField(
            focusNode: searchFocusNode,
            hintText: widget.searchHint,
            controller: searchController,
            onSubmitted: (value) {
              Helper.onSubmitSearch(context: context, query: value);
              Helper.nguonCSearchFilms(context: context, query: value);
            },
          ),
        ),
        body: SearchPageTabsContent(
          searchTabsLength: searchTabsLength,
          searchTabsView: searchTabsView.map((e) => e.tabWidget).toList(),
        ),
      ),
    );
  }
}
