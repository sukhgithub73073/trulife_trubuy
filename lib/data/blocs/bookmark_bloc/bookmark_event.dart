part of 'bookmark_bloc.dart';

sealed class BookmarkEvent extends Equatable {
  const BookmarkEvent();
}

class GetBookmarkEvent extends BookmarkEvent {
  const GetBookmarkEvent();

  @override
  List<Object?> get props => [];
}

class AddBookmarkEvent extends BookmarkEvent {
  const AddBookmarkEvent({required this.product});

  final Product product;

  @override
  List<Object?> get props => [product];
}

class RemoveBookmarkEvent extends BookmarkEvent {
  const RemoveBookmarkEvent({required this.product});

  final Product product;

  @override
  List<Object?> get props => [product];
}
