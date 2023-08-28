import 'package:getjoke/boostrap.dart';
import 'package:getjoke/core/env/app_env.dart';

void main() async {
  AppConfig.setup(Environment.dev);
  bootstrap();
}
