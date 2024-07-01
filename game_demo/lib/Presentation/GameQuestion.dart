import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:game_demo/Application/QuestionProvider.dart';
import 'package:game_demo/Application/QuestionState.dart';
import 'package:game_demo/Presentation/Widgets/QuizItem.dart';

class GameQuestion extends ConsumerStatefulWidget {
  final TeXViewRenderingEngine renderingEngine;

  const GameQuestion(
      {super.key, this.renderingEngine = const TeXViewRenderingEngine.katex()});

  @override
  _GameQuestionState createState() => _GameQuestionState();
}

class _GameQuestionState extends ConsumerState<GameQuestion> {
  @override
  void initState() {
    super.initState();
    final questionNotifier = ref.read(questionProvider.notifier);

    questionNotifier.fetchQuestion();
    _startTimer();
  }

  static const int _initialTime = 20 * 60;
  int _remainingTime = _initialTime;
  Timer? _timer;
  bool _isPaused = false;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0 && !_isPaused) {
        setState(() {
          _remainingTime--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _pauseTimer() {
    setState(() {
      _isPaused = !_isPaused;
    });
    if (!_isPaused) {
      _startTimer();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatTime(int timeInSeconds) {
    final int minutes = timeInSeconds ~/ 60;
    final int seconds = timeInSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final questionState = ref.watch(questionProvider);
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        title: const Text("Questions"),
        backgroundColor: Colors.deepPurple[400],
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                _formatTime(_remainingTime),
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
          IconButton(
            icon: Icon(_isPaused ? Icons.play_arrow : Icons.pause),
            onPressed: _pauseTimer,
          ),
        ],
      ),
      body: questionState is LoadedQuestion
          ? ListView.builder(
              physics: const ScrollPhysics(),
              itemCount: questionState.questions.length,
              itemBuilder: (context, index) {
                final quizItem = questionState.questions[index];
                return Column(
                  children: [
                    QuizItemWidget(quizItem: quizItem, index: index),
                    Divider(
                      thickness: 10,
                      color: Colors.purple[200],
                    )
                  ],
                );
              },
            )
          : questionState is ErrorQuestion
              ? Center(
                  child: Text(
                    questionState.error,
                    style: const TextStyle(color: Colors.red),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
    );
  }
}
