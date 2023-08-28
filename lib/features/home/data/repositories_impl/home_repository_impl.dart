import 'package:get_it/get_it.dart';
import 'package:getjoke/features/home/data/datasources/home_data_source.dart';
import 'package:getjoke/features/home/data/models/joke_response.dart';
import 'package:getjoke/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final _dataSource = GetIt.instance<HomeDataSoucre>();

  @override
  Future<JokeResponse> getJoke(Map<String, dynamic>? queryParams) async {
    return _dataSource.getJoke(queryParams);
  }
}
