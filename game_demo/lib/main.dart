import 'package:flutter/material.dart';
import 'package:game_demo/Presentation/GameHome.dart';
import 'package:game_demo/Presentation/GameLevels.dart';
import 'package:game_demo/Presentation/GameQuestion.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final _router = GoRouter(
  initialLocation: '/question',
  routes: [
    GoRoute(
      name: "game_levels",
      path: '/game_levels',
      builder: (context, state) => const GameLevels(),
    ),
    GoRoute(
      name: "home",
      path: '/home',
      builder: (context, state) => const GameHome(),
    ),
    GoRoute(
      name: "question",
      path: '/question',
      builder: (context, state) => const GameQuestion(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "game_demo",
      routerConfig: _router,
    );
  }
}
