import 'package:getjoke/features/home/data/models/joke_response.dart';
import 'package:getjoke/features/home/data/repositories_impl/home_repository_impl.dart';

abstract class HomeRepository {
  factory HomeRepository() {
    return HomeRepositoryImpl();
  }

  Future<JokeResponse> getJoke(Map<String, dynamic>? queryParams);
}
