import 'package:flutter/material.dart';
import 'package:game_demo/Domain/entities/Level.dart';
import 'package:game_demo/Presentation/Widgets/GameLevelSquare.dart';

class GameLevelTile extends StatelessWidget {
  final List<Level> levels;

  const GameLevelTile({super.key, required this.levels});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple[100],
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: levels.length,
        itemBuilder: (context, index) {
          final level = levels[index];
          return GameLevelSquare(level: level);
        },
      ),
    );
  }
}
