import 'package:flutter/material.dart';

class GameQuestion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('MathJax in Flutter'),
        ),
        // body: Padding(
        //   padding: const EdgeInsets.all(16.0),
        //   child: Center(
        //     child: Html(
        //       data: '''<p>What are the roots of the quadratic equation
        //       <span class="katex"><math xmlns="http://www.w3.org/1998/Math/MathML">
        //       <semantics><mrow><msup><mi>x</mi><mn>2</mn></msup><mo>−</mo><mn>4</mn><mi>x</mi><mo>+</mo><mn>4</mn><mo>=</mo><mn>0</mn></mrow>
        //       <annotation encoding="application/x-tex">x^2 - 4x + 4 = 0</annotation></semantics></math></span>?<br></p>''',
        //       customRender: {
        //         "math": (RenderContext context, Widget child) {
        //           final String tex = context.tree.element!.text;
        //           return Math.tex(
        //             tex,
        //             textStyle: TextStyle(fontSize: 24),
        //           );
        //         },
        //       },
        //       tagsList: Html.tags..add("math"),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
