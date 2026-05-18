import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/entity/search_tabs_item.dart';
import '../../../common/widgets/search_textfield_widget.dart';
import 'bloc/search_bloc.dart';
import 'enum/search_tab.dart';
import 'widgets/list_search_content.dart';
import 'widgets/search_page_tabs_content.dart';
import 'widgets/search_tabbar.dart';

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

  static const double appBarHeight = 90.0;
  static const double appBarBottomHeight = 10.0;
  late final List<SearchTabsItem> searchTabViews;

  @override
  void initState() {
    /// Auto Focus On Search field
    searchFocusNode.requestFocus();

    /// Add Listeners
    searchController.addListener(_onSearchControllerChanged);

    /// Initialize Search Tabs
    _initializeSearchTabs();
    super.initState();
  }

  void _onSearchControllerChanged() {
    if (searchController.text.isEmpty) {
      onClearSuggestions();
    }
  }

  @override
  void dispose() {
    pageDispose();
    super.dispose();
  }

  void pageDispose() {
    searchFocusNode.unfocus();
    searchController.dispose();
  }

  void onClearSuggestions() {
    context.read<SearchBloc>().add(ClearSearchSuggestionsEvent());
  }

  void submitSearch(String value) {
    if (value.isEmpty) return;
    final query = value.trim();

    /// Clear suggestions
    onClearSuggestions();

    /// Call API search
    searchController.text = query;
    context.read<SearchBloc>().add(GetSearchMoviesEvent(
          query: query,
          limit: 10,
        ));
  }

  void onSearchTextChanged(String value) {
    if (value.isEmpty) return;

    /// Update search query
    context.read<SearchBloc>().add(SearchQueryChangedEvent(query: value));
  }

  Widget _buildTabWidget(SearchTabEnum tab) {
    switch (tab) {
      case SearchTabEnum.main:
        return ListSearchContent(
          onSelected: (value) => searchController.text = value,
          onSuggestionSelected: submitSearch,
          listSearch: widget.listSearch,
        );
    }
  }

  void _initializeSearchTabs() {
    searchTabViews = List.generate(
      SearchTabEnum.values.length,
      (i) => SearchTabsItem(
        title: SearchTabEnum.values[i].tabTitle,
        tabWidget: _buildTabWidget(SearchTabEnum.values[i]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: SearchTabEnum.values.length,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: appBarHeight,
          backgroundColor: Colors.black,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(appBarBottomHeight),
            child: SearchTabBar(
              searchTabsLength: SearchTabEnum.values.length,
              searchTabsBar: List.generate(
                SearchTabEnum.values.length,
                (index) => SearchTabEnum.values[index].tabTitle,
              ),
            ),
          ),
          title: SearchTextField(
            focusNode: searchFocusNode,
            hintText: widget.searchHint,
            controller: searchController,
            onChanged: onSearchTextChanged,
            onSubmitted: submitSearch,
          ),
        ),
        body: SearchPageTabsContent(
          searchTabsLength: SearchTabEnum.values.length,
          searchTabsView: List.generate(
            searchTabViews.length,
            (index) => searchTabViews[index].tabWidget,
          ),
        ),
      ),
    );
  }
}
