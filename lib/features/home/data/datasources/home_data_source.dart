import 'package:getjoke/features/home/data/datasources_impl/home_data_source_impl.dart';
import 'package:getjoke/features/home/data/models/joke_response.dart';

abstract class HomeDataSoucre {
  factory HomeDataSoucre() {
    return HomeDataSourceImpl();
  }

  Future<JokeResponse> getJoke(Map<String, dynamic>? queryParams);
}
