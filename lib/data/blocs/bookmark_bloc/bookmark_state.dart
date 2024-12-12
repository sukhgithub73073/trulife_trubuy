part of 'bookmark_bloc.dart';

sealed class BookmarkState extends Equatable {
  const BookmarkState();
}

final class BookmarkInitial extends BookmarkState {
  @override
  List<Object> get props => [];
}

final class BookmarkLoading extends BookmarkState {
  @override
  List<Object> get props => [];
}

final class BookmarkLoaded extends BookmarkState {
  final List<Product> bookmarkList;

  BookmarkLoaded({required this.bookmarkList});

  @override
  List<Object> get props => [bookmarkList];
}

final class BookmarkError extends BookmarkState {
  final String error;

  BookmarkError({required this.error});

  @override
  List<Object> get props => [error];
}
