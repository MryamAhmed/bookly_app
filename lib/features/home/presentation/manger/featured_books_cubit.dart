import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/book_model/book_model.dart';
import '../../data/repos/home_repo.dart';
part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo ;

  Future<void> fetchFeaturedBooks() async{
    emit(FeaturedBooksLoading());

    var result =await  homeRepo.fetchFeatureBooks();
    result.fold((l) => {
      emit(FeaturedBooksFailure(l.errMessage))
    }, (r) => {
      emit(FeaturedBooksSuccess(r))
    });
  }

}
