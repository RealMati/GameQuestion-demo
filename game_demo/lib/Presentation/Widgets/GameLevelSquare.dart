import 'package:flutter/material.dart';
import 'package:game_demo/Domain/entities/Level.dart';
import 'package:go_router/go_router.dart';

class GameLevelSquare extends StatelessWidget {
  final Level level;

  const GameLevelSquare({super.key, required this.level});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed("question");
      },
      child: Container(
        height: 50,
        width: 50,
        margin: EdgeInsets.all(6),
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.deepPurple[300],
          borderRadius: BorderRadius.circular(10),
          // gradient: const LinearGradient(
          //   colors: [
          //     // Color.fromRGBO(117, 192, 221, 1),
          //     // Color.fromARGB(255, 43, 54, 218),

          //     // Color.fromRGBO(244, 7, 82, 1),
          //     // Color.fromRGBO(230, 130, 94, 1),

          //     // Color.fromRGBO(79, 235, 227, 1),
          //     // Color.fromRGBO(127, 137, 243, 1)

          //     Color.fromRGBO(245, 95, 115, 1),
          //     Color.fromRGBO(89, 116, 252, 1)
          //   ],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Level ${level.level}",
            )
          ],
        ),
      ),
    );
  }
}
