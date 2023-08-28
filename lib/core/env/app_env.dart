import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Environment { dev, prod }

class AppConfig {
  static late Environment environment;

  static late Map<String, dynamic> _config;

  static String baseUrl = _config[_Config.baseUrl];

  static bool get isStaging => environment == Environment.dev;

  static bool get isProduction => environment == Environment.prod;

  static setup(Environment env) async {
    await dotenv.load(fileName: ".env");
    environment = env;
    switch (env) {
      case Environment.dev:
        _config = _Config.stagConstants;
        break;
      case Environment.prod:
        _config = _Config.prodConstants;
        break;
    }
  }

  static String getSecretKey() => '${dotenv.env['SECRET_KEY']}';
}

class _Config {
  static const baseUrl = 'BASE_URL';

  static Map<String, dynamic> stagConstants = {
    baseUrl: '${dotenv.env['DEBUG_API_URL']}',
  };

  static Map<String, dynamic> prodConstants = {
    baseUrl: '${dotenv.env['PRODUCTION_API_URL']}',
  };
}
