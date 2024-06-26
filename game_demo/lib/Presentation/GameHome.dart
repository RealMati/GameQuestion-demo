import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_demo/Application/GradeProvider.dart';
import 'package:game_demo/Application/GradeState.dart';
import 'package:game_demo/Presentation/Widgets/GameDrawer.dart';
import 'package:game_demo/Presentation/Widgets/GameGradeTile.dart';

class GameHome extends ConsumerWidget {
  const GameHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gradeNotifier = ref.read(gradeProvider.notifier);
    final gradeState = ref.watch(gradeProvider);

    gradeNotifier.fetchGrades();

    return Scaffold(
      drawer: const GameDrawer(),
      backgroundColor: Colors.deepPurple[100],
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.deepPurple[400],
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.purple[300],
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.only(bottom: 1),
                  child: Image.asset("assets/subjects.png"),
                ),
              ),
              title: const Text(
                "Games",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: gradeState is EmptyGrade
                ? const Center(child: Text('No Games available'))
                : gradeState is ErrorGrade
                    ? Center(
                        child:
                            Text('Failed to load Games: ${gradeState.error}'))
                    : Container(),
          ),
          if (gradeState is LoadedGrade)
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return GameGradeTile(
                    grade: gradeState.grades[index].curriculumGrade,
                    gradeName: gradeState.grades[index].name,
                    gradeDescription: gradeState.grades[index].description,
                  );
                },
                childCount: gradeState.grades.length, // Adjust this as needed
              ),
            ),
        ],
      ),
    );
  }
}
