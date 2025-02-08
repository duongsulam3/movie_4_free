import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smoth_movie_app/features/home/home_search/presentation/bloc/search_bloc.dart';
import 'package:smoth_movie_app/features/home/home_search/presentation/widgets/list_search_content.dart';
import 'package:smoth_movie_app/features/home/home_search/presentation/widgets/search_text_field_custom.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //TextController
  final _searchController = TextEditingController();
  //List Top Search
  List<String> listTopSearch = [
    "Avatar: The Way of Water",
    "Đấu phá thương khung",
    "The Flash",
    "The Batman",
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    // final screenWidth = MediaQuery.of(context).size.width;
    //
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      onSubmitted: (value) {
                        if (value.isEmpty) return;
                        context
                            .read<SearchBloc>()
                            .add(GetSearchMoviesEvent(value));
                      },
                      //! Handle OnChange when Submit is too long
                      // onChanged: (value) {
                      //   Future.delayed(const Duration(milliseconds: 1500), () {
                      //     _seach(value);
                      //   });
                      // },
                      hint: 'Nhập tên phim bạn muốn tìm',
                      controller: _searchController,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight / (screenHeight / 20)),
              ListSearchContent(topSearchList: listTopSearch),
            ],
          ),
        ),
      ),
    );
  }
}
