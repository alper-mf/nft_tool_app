import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../screens/explore_screen/explore_screen.dart';

class AppRouter {
  AppRouter._();

  static final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
            path: '/',
            pageBuilder: (context, state) =>
                MaterialPage(key: state.pageKey, child: const ExploreScreen()))
      ],
      errorPageBuilder: (context, error) => MaterialPage(
          key: error.pageKey,
          child: Scaffold(
            body: Center(
              child: Text(error.toString()),
            ),
          )));
}
