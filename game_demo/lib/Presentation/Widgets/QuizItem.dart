import 'package:flutter/material.dart';

import 'package:flutter_tex/flutter_tex.dart';
import 'package:game_demo/Domain/entities/Question.dart';

class QuizItemWidget extends StatefulWidget {
  final Question quizItem;
  final int index;

  const QuizItemWidget(
      {super.key, required this.quizItem, required this.index});

  @override
  State<QuizItemWidget> createState() => _QuizItemWidgetState();
}

class _QuizItemWidgetState extends State<QuizItemWidget> {
  String selectedOption = "-1";

  @override
  Widget build(BuildContext context) {
    // double deviceWidth = MediaQuery.of(context).size.width;
    // double deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(6),
      // width: 0,
      constraints: const BoxConstraints(
        minHeight: 380,
      ),

      child: TeXView(
        key: ValueKey('quizItem_${widget.index}'),
        style: const TeXViewStyle.fromCSS('padding: 10px; overflow-y: hidden;'),
        renderingEngine: const TeXViewRenderingEngine.katex(),
        child: TeXViewColumn(
          style: const TeXViewStyle.fromCSS('overflow-y: hidden;'),
          children: [
            TeXViewDocument(
              widget.quizItem.question,
              style: const TeXViewStyle(
                margin: TeXViewMargin.only(bottom: 16),
              ),
            ),
            TeXViewGroup(
              id: "quizItem_${widget.index}",
              onTap: (String value) {
                // print("Clicked on value of $value");
                setState(() {
                  selectedOption = value;
                });
              },
              selectedItemStyle: TeXViewStyle(
                borderRadius: const TeXViewBorderRadius.all(10),
                border: TeXViewBorder.all(
                  TeXViewBorderDecoration(
                    borderWidth: 2,
                    borderColor: Colors.green[900],
                  ),
                ),
                margin: const TeXViewMargin.only(bottom: 8),
              ),
              normalItemStyle: const TeXViewStyle(
                margin: TeXViewMargin.only(bottom: 8),
                // padding: TeXViewPadding.all(10),
                borderRadius: TeXViewBorderRadius.all(10),
                border: TeXViewBorder.all(
                  TeXViewBorderDecoration(
                    borderWidth: 2,
                    borderColor: Colors.blue,
                  ),
                ),
              ),
              children: [
                option(widget.quizItem.optionA, "A"),
                option(widget.quizItem.optionB, "B"),
                option(widget.quizItem.optionC, "C"),
                option(widget.quizItem.optionD, "D"),
              ],
            ),
            if (selectedOption != "-1")
              TeXViewDocument(
                selectedOption == widget.quizItem.answer
                    ? "Correct Answer🎉 ${widget.quizItem.explanation}"
                    : "Wrong Answer",
                style: TeXViewStyle(
                  margin: const TeXViewMargin.only(top: 16),
                  padding: const TeXViewPadding.all(10),
                  backgroundColor: selectedOption == widget.quizItem.answer
                      ? Colors.green
                      : Colors.red,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

TeXViewGroupItem option(String option, id) {
  return TeXViewGroupItem(
    id: id,
    child: TeXViewDocument(
      option,
      style: const TeXViewStyle(
        margin: TeXViewMargin.only(bottom: 8),
        padding: TeXViewPadding.all(10),
        // borderRadius: TeXViewBorderRadius.all(10)),
      ),
    ),
  );
}
