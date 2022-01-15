import 'package:flutter/material.dart';
import 'package:my_first_app/Widgets/text_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  String equation = "equation";
  String sum = "sum";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: MyTextWidget(
          color: Colors.black,
          text: "Calculator",
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
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: MyTextWidget(
                text: "equation",
                color: Colors.purple,
              ),
            ),
            const SizedBox(
              height: 20.00,
            ),
            Center(
              child: MyTextWidget(
                text: "sum",
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
