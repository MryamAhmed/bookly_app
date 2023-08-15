import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/book_model/book_model.dart';
import '../../data/repos/home_repo.dart';

part 'simillar_book_state.dart';

class SimillarBookCubit extends Cubit<SimillarBookState> {
  SimillarBookCubit(this.homeRepo) : super(SimillarBookInitial());

  final HomeRepo homeRepo ;

  Future<void> fetchFeaturedBooks({required String cat}) async{
    emit(SimillarBooksLoading());

    var result =await  homeRepo.fetchSimillarBooks(cat: cat);
    result.fold((l) => {
      emit(SimillarBooksFailure(l.errMessage))
    }, (r) => {
      emit(FeaturedBooksSuccess(r))
    });
  }

}
