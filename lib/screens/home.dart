import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_first_app/Widgets/text_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  String equation = "equation";
  String sum = "sum";
  List listButtons = [
    "x/-",
    "0",
    ",",
    "=",
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
    "BS",
    "/",
  ];
  List functionButtons = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[50],
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyTextWidget(
                      text: "equation",
                      color: Colors.grey,
                      size: 20.0,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.00,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyTextWidget(
                      text: "sum",
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
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (ctxt, index) {
                      return Container();
                    }),

                GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    reverse: true,
                    shrinkWrap: true,
                    itemCount: listButtons.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemBuilder: (contx, index) {
                      return myButton(listButtons[index], () {});
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

  Widget myButton(
    String text,
    function,
  ) {
    return MaterialButton(
      elevation: 5.0,
      color: Colors.white,
      child: MyTextWidget(
        color: Colors.black,
        size: 25.0,
        text: text,
      ),
      onPressed: function,
    );
  }
}
