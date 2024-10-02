import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ithreve_web/app/navigation/routes.dart';
import 'package:ithreve_web/ui/theme/theme.dart';

class IThriveWebApp extends StatefulWidget {
  const IThriveWebApp({
    super.key,
  });

  @override
  State<IThriveWebApp> createState() => _IThriveWebAppState();
}

class _IThriveWebAppState extends State<IThriveWebApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: createTheme(),
    );
  }
}
