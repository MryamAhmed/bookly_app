part of 'newset_books_cubit.dart';

@immutable
abstract class NewsetBooksState {}

class NewsetBooksInitial extends NewsetBooksState {}

class NewsetBooksLoading extends NewsetBooksState {}
class NewsetBooksFailure extends NewsetBooksState {
  final String errorMessage;
  NewsetBooksFailure(this.errorMessage);
}
class NewsetBooksSuccess extends NewsetBooksState {
  final List<BookModel> books;

  NewsetBooksSuccess(this.books);
}
