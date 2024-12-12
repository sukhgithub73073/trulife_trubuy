import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trubuy/data/models/product_model.dart';

part 'bookmark_event.dart';

part 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  BookmarkBloc() : super(BookmarkInitial()) {
    on<GetBookmarkEvent>(_getBookmark);
    on<AddBookmarkEvent>(_addBookmark);
    on<RemoveBookmarkEvent>(_removeBookmark);
  }

  FutureOr<void> _addBookmark(
      AddBookmarkEvent event, Emitter<BookmarkState> emit) {
    final cast = state as BookmarkLoaded;
    cast.bookmarkList.add(event.product);
    print("Sdfd>>>>>>>>>>>>>>>>_addBookmark") ;

    emit(BookmarkLoading());
    emit(BookmarkLoaded(bookmarkList: cast.bookmarkList));
  }

  FutureOr<void> _removeBookmark(
      RemoveBookmarkEvent event, Emitter<BookmarkState> emit) {
    final cast = state as BookmarkLoaded;
    cast.bookmarkList.remove(event.product);
    print("Sdfd>>>>>>>>>>>>>>>>_removeBookmark") ;
    emit(BookmarkLoading());
    emit(BookmarkLoaded(bookmarkList: cast.bookmarkList));
  }

  FutureOr<void> _getBookmark(
      GetBookmarkEvent event, Emitter<BookmarkState> emit) {
    emit(BookmarkLoading());
    emit(BookmarkLoaded(bookmarkList: []));
  }
}
