part of 'recommend_movies_bloc.dart';

@immutable
sealed class RecommendMoviesEvent {
  const RecommendMoviesEvent();
}

class GetRecommendMoviesEvent extends RecommendMoviesEvent {
  const GetRecommendMoviesEvent();
}
