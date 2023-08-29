import 'package:get_it/get_it.dart';
import 'package:getjoke/features/home/data/models/joke_response.dart';
import 'package:getjoke/features/home/domain/repositories/home_repository.dart';

class SubmitFormInteractor {
  SubmitFormInteractor();

  final _repository = GetIt.instance<HomeRepository>();

  Future<JokeResponse?> execute({Map<String, dynamic>? queryParams}) async {
    try {
      return await _repository.getJoke(queryParams);
    } catch (e) {
      return null;
    }
  }
}
