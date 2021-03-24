import 'package:api_call_bloc/data_provider/this_for_that_provider.dart';
import 'package:api_call_bloc/model/this_for_that_model.dart';

class ThisForThatRepository {
  ThisForThatProvider _provider = ThisForThatProvider();

  Future<ThisForThat> fetchData() async {
    final _response = await _provider.get();
    return ThisForThat.fromJSON(_response);
  }
}
