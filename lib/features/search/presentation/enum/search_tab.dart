enum SearchTabEnum { main }

extension SearchTabExtension on SearchTabEnum {
  String get tabTitle {
    switch (this) {
      case SearchTabEnum.main:
        return 'Nguồn chính';
    }
  }
}
