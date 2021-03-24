import 'package:api_call_bloc/model/this_for_that_model.dart';
import 'package:api_call_bloc/repository/this_for_that_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'this_for_that_state.dart';

class ThisForThatCubit extends Cubit<ThisForThatState> {
  final ThisForThatRepository _repository;
  ThisForThatCubit(this._repository) : super(ThisForThatInitial());

  Future<void> getThisForThat() async {
    try {
      emit(ThisForThatLoading());
      final thisForThat = await _repository.fetchData();
      emit(ThisForThatLoaded(thisForThat));
    } catch (e) {
      emit(ThisForThatError('Error fetching data. Please try again.'));
      print(e);
    }
  }
}
