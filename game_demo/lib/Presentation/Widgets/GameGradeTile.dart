import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GameGradeTile extends StatelessWidget {
  const GameGradeTile(
      {super.key,
      required this.grade,
      required this.gradeName,
      required this.gradeDescription});

  final String grade;
  final String gradeName;
  final String gradeDescription;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Center(
      child: GestureDetector(
        onTap: () {
          context.pushNamed("game_levels");
        },
        child: Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          height: 75,
          decoration: const BoxDecoration(
            // color: Colors.deepPurple[300],
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(92, 150, 173, 1),
                Color.fromARGB(255, 50, 62, 228),

                // Color.fromRGBO(244, 7, 82, 1),
                // Color.fromRGBO(230, 130, 94, 1),

                // Color.fromRGBO(79, 235, 227, 1),
                // Color.fromRGBO(127, 137, 243, 1)

                // Color.fromRGBO(245, 95, 115, 1),
                // Color.fromRGBO(89, 116, 252, 1)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          width: deviceWidth * 0.90,
          child: Row(
            children: [
              Container(
                width: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(360),
                ),
                child: Center(
                  // color: Colors.blue,
                  child: Text(
                    grade.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              SingleChildScrollView(
                child: Container(
                  width: deviceWidth * 0.48,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        gradeName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        gradeDescription,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Image.asset(
                "assets/next.png",
                width: 40,
                height: 40,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
