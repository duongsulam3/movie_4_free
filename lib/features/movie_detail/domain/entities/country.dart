import 'package:equatable/equatable.dart';

class CountryEnity extends Equatable {
  final String id;
  final String name;
  final String slug;

  const CountryEnity({
    required this.id,
    required this.name,
    required this.slug,
  });

  @override
  List<Object?> get props => [id, name, slug];
}
