part of 'simillar_book_cubit.dart';

@immutable
abstract class SimillarBookState {}

class SimillarBookInitial extends SimillarBookState {}

class SimillarBooksLoading extends SimillarBookState {}
class SimillarBooksFailure extends SimillarBookState {
  final String errorMessage;
  SimillarBooksFailure(this.errorMessage);
}
class FeaturedBooksSuccess extends SimillarBookState {
  final List<BookModel> books;

  FeaturedBooksSuccess(this.books);
}


