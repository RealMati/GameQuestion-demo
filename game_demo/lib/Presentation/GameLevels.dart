import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_demo/Application/SubjectAndLevelProvider.dart';
import 'package:game_demo/Application/SubjectAndLevelState.dart';
import 'package:game_demo/Presentation/Widgets/GameDrawer.dart';
import 'package:game_demo/Presentation/Widgets/GameLevelTile.dart';

class GameLevels extends ConsumerWidget {
  const GameLevels({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjectAndLevelNotifier = ref.read(subjectAndLevelProvider.notifier);
    final subjectAndLevelState = ref.watch(subjectAndLevelProvider);

    subjectAndLevelNotifier.fetchSubjectAndSubjectAndLevel();

    return DefaultTabController(
      length: subjectAndLevelState is LoadedSubjectAndLevel
          ? (subjectAndLevelState as LoadedSubjectAndLevel)
              .subjectAndLevels
              .length
          : 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Game Levels",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.deepPurple[400],
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
          bottom: subjectAndLevelState is LoadedSubjectAndLevel
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(50.0),
                  child: Container(
                    color: Colors.deepPurple[200],
                    child: TabBar(
                      labelColor: Colors.black,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      unselectedLabelColor: Color.fromARGB(239, 83, 50, 50),
                      // overlayColor: MaterialStateProperty.all(Colors.white),
                      // dividerColor: Colors.amber,
                      isScrollable: true,
                      tabs: (subjectAndLevelState as LoadedSubjectAndLevel)
                          .subjectAndLevels
                          .map((subjectAndLevel) {
                        return Tab(text: subjectAndLevel.subject.name);
                      }).toList(),
                    ),
                  ),
                )
              : null,
        ),
        drawer: const GameDrawer(),
        body: subjectAndLevelState is LoadedSubjectAndLevel
            ? Container(
                color: Colors.deepPurple[100],
                padding: EdgeInsets.all(8.0),
                child: TabBarView(
                  children: (subjectAndLevelState as LoadedSubjectAndLevel)
                      .subjectAndLevels
                      .map((subjectAndLevel) {
                    return GameLevelTile(levels: subjectAndLevel.levels);
                  }).toList(),
                ),
              )
            : subjectAndLevelState is EmptySubjectAndLevel
                ? const Center(child: Text('No subjects and levels available'))
                : subjectAndLevelState is ErrorSubjectAndLevel
                    ? Center(
                        child: Text(
                          'Failed to load subjects and levels: ${subjectAndLevelState.error}',
                        ),
                      )
                    : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
