import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:my_first_app/Widgets/text_widget.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? equation;

  String? sum;

  @override
  void initState() {
    super.initState();
    equation = "";
    sum = "0";
  }

  List listButtons = [
    Row(children: [
      const Icon(
        TablerIcons.plus,
        size: 20,
        color: Colors.black,
      ),
      MyTextWidget(
        size: 20.0,
        color: Colors.black,
        text: '/',
      ),
      const Icon(
        TablerIcons.minus,
        size: 20,
        color: Colors.black,
      ),
    ]),
    "0",
    ",",
    const Icon(
      TablerIcons.equal,
      size: 40,
      color: Colors.black,
    ),
    "1",
    "2",
    "3",
    "+",
    "4",
    "5",
    "6",
    "-",
    "7",
    "8",
    "9",
    "x",
    "CE",
    "C",
    Icon(
      TablerIcons.backspace,
      size: 40,
      color: Colors.black,
    ),
    "/",
    Icon(
      TablerIcons.percentage,
      size: 40,
      color: Colors.black,
    ),
    Icon(
      TablerIcons.square_root,
      size: 40,
      color: Colors.black,
    ),
    Icon(
      TablerIcons.superscript,
      size: 40,
      color: Colors.black,
    ),
    "1/x"
  ];

  List functionButtons = [
    const Icon(
      TablerIcons.percentage,
      size: 40,
      color: Colors.black,
    ),
    const Icon(
      TablerIcons.square_root,
      size: 40,
      color: Colors.black,
    ),
    const Icon(
      TablerIcons.superscript,
      size: 40,
      color: Colors.black,
    ),
    "1/x"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[50],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: MyTextWidget(
            color: Colors.black,
            text: "Calculator",
            size: 30.0,
          ),
          centerTitle: true,
          leading: const Icon(
            Icons.menu,
            size: 40.0,
            color: Colors.black,
          ),
          actions: const [
            Icon(
              Icons.history,
              size: 40.0,
              color: Colors.black,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width - 16,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      MyTextWidget(
                        text: equation,
                        color: Colors.grey,
                        size: 20.0,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.00,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyTextWidget(
                      text: sum,
                      color: Colors.black,
                      size: 30.0,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.00,
                ),
                const Divider(
                  thickness: 1.5,
                  color: Colors.grey,
                ),
                // Container(
                //   width: 250.0,
                //   height: 100.0,
                //   child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       shrinkWrap: true,
                //       itemCount: 4,
                //       itemBuilder: (ctxt, index) {
                //         return (myButton(functionButtons[index], () {}));
                //       }),
                // ),

                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    reverse: true,
                    shrinkWrap: true,
                    itemCount: listButtons.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemBuilder: (contx, index) {
                      return myButton(listButtons[index], () {
                        if (listButtons[index] is String &&
                            listButtons[index] != "CE" &&
                            listButtons[index] != "C") {
                          // || -> or
                          // && -> and
                          // if (int.tryParse(listButtons[index]) is int) {
                          setState(() {
                            equation = equation! + listButtons[index];
                          });
                        }

                        if (listButtons[index] is Icon) {
                          Icon icon = listButtons[index];

                          if (icon.icon == TablerIcons.backspace) {
                            setState(() {
                              equation = equation!.substring(
                                0,
                                equation!.length - 1,
                              );
                            });
                          } else if (icon.icon == TablerIcons.equal) {
                            sumFunction();
                          }
                        }

                        setState(() {
                          equation!.substring(equation!.length - 1);
                        });
                        if (listButtons[index] is String &&
                            listButtons[index] == "C") {
                          setState(() {
                            equation = "";
                            sum = "0";
                          });
                        }
                        // }
                      }, index >= listButtons.length - 4 ? Colors.white : null);
                    }),
                // GridView.count(
                //   shrinkWrap: true,
                //   crossAxisCount: 4,
                //   children: [
                //     myButton("%", () {
                //       print("siemanko, witamy w kalkulatorku");
                //     }),
                //     myButton("#", () {
                //       print("siemanko, witamy w kalkulatorku");
                //     }),
                //     myButton("6", () {
                //       print("siemanko, witamy w kalkulatorku");
                //     }),
                //     myButton("!", () {
                //       print("siemanko, witamy w kalkulatorku");
                //     }),
                //   ],
                // ),
              ],
            ),
          ),
        ));
  }

  sumFunction() {
    Parser p = Parser();
    String input = equation!.replaceAll("x", "*");
    Expression exp = p.parse(input);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      sum = eval.toString();
    });
  }

  Widget myButton(
    buttonConntent,
    function,
    color,
  ) {
    color = color ?? Colors.orange[100];
    return MaterialButton(
      elevation: 0.0,
      color: color,
      child: (buttonConntent is String)
          ? MyTextWidget(
              color: Colors.black,
              size: 25.0,
              text: buttonConntent,
            )
          : buttonConntent,
      onPressed: function,
    );
  }
}
