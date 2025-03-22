part of 'kho_phim_page_bloc.dart';

sealed class KhoPhimPageEvent {
  const KhoPhimPageEvent();
}

class KhoPhimLoadAllBlocEvent extends KhoPhimPageEvent {
  const KhoPhimLoadAllBlocEvent();
}