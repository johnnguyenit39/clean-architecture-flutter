import 'package:get_it/get_it.dart';
import 'package:getjoke/features/home/data/datasources/home_data_source.dart';

Future<void> defineDataSources(GetIt getIt) async {
  //Repositories
  getIt.registerFactory<HomeDataSoucre>(() => HomeDataSoucre());
}
