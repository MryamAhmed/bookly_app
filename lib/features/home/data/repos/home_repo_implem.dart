import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';


class HomeRepoImpl implements HomeRepo{
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeatureBooks() async{
    try{
      var data = await apiService.get(
          endPoint:
          'volumes?Filtering=free-ebooks&q=subject:Programming' );

      List<BookModel> books = [];

      for(var item in data['items']){
        books.add(BookModel.fromJson(item));
      }

      return right(books);

    } catch(e){
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewsBooks() async{

    try{
      var data = await apiService.get(
          endPoint:
          'volumes?Filtering=free-ebooks&q=subject:Programming' );

      List<BookModel> books = [];

      for(var item in data['items']){
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch(e){
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimillarBooks({required String cat}) async{
    try{
      var data = await apiService.get(
          endPoint:
          'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:Programming' );

      List<BookModel> books = [];

      for(var item in data['items']){
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch(e){
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }


}


