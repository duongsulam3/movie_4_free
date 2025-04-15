class NguoncCategoryEntity {
  NguoncTypeEntity group;
  List<NguoncTypeItem> list;

  NguoncCategoryEntity({required this.group, required this.list});
}

class NguoncTypeItem {
  String id;
  String name;

  NguoncTypeItem({required this.id, required this.name});
}

class NguoncTypeEntity {
  String id;
  String name;

  NguoncTypeEntity({
    required this.id,
    required this.name,
  });
}
