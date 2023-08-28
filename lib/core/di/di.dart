import 'package:get_it/get_it.dart';
import 'package:getjoke/core/di/data_source.dart';
import 'package:getjoke/core/di/repository.dart';

Future<void> setupDi() async {
  final getIt = GetIt.I;
  await defineDataSources(getIt);
  await repositories(getIt);
  return;
}
