part of 'nguonc_search_bloc.dart';

@immutable
sealed class NguoncSearchEvent {}

class GetSearchFilmsEvent extends NguoncSearchEvent {
  final String query;
  GetSearchFilmsEvent({required this.query});
}
