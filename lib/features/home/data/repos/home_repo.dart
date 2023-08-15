import 'package:bookly/core/errors/failure.dart';

import '../models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<BookModel>>>fetchNewsBooks();
  Future<Either<Failure,List<BookModel>>>fetchFeatureBooks();
  Future<Either<Failure,List<BookModel>>>fetchSimillarBooks({required String cat});
}