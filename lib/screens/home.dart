import 'package:flutter/material.dart';
import 'package:my_first_app/Widgets/text_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
      body: Container(
        child: Text("Hello World:"),
      ),
    );
  }
}
