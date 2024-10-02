import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:ithreve_web/app/app.dart';
import 'package:ithreve_web/app/di/di.dart';

void main() async {
  usePathUrlStrategy();

  initDi();

  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale(
          'en',
        ),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale(
        'en',
      ),
      child: const IThriveWebApp(),
    ),
  );
}

class CustomRouteObserver extends RouteObserver {}

final RouteObserver customRouterObserver = CustomRouteObserver();
