import 'package:flutter/material.dart';

import 'core/routes/router_table.dart';

class GetJokeApp extends StatelessWidget {
  const GetJokeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus && focus.focusedChild != null) {
          focus.focusedChild?.unfocus();
        }
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'GetJoke Mobile',
        routerConfig: routerConfig,
        theme: ThemeData(
          useMaterial3: true,
          // colorScheme: lightColorScheme,
          colorSchemeSeed: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
        ),
        themeMode: ThemeMode.light, // Default is system
      ),
    );
  }
}
