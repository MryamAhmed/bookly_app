import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/book_model/book_model.dart';
import '../../data/repos/home_repo.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.homeRepo) : super(NewsetBooksInitial());


  final HomeRepo homeRepo ;

  void fetchNewsBooks() async{
    emit(NewsetBooksInitial());
    var result =await  homeRepo.fetchFeatureBooks();

    result.fold((l) => {
      emit(NewsetBooksFailure(l.errMessage))
    }, (r) => {
      emit(NewsetBooksSuccess(r))
    });
  }
}
