import 'package:get_it/get_it.dart';
import 'package:getjoke/features/home/domain/repositories/home_repository.dart';

Future<void> repositories(GetIt getIt) async {
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepository());
}
