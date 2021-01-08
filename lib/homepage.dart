import 'package:flutter/material.dart';
import 'package:flutterapp/constants.dart';
import 'bottom_button.dart';

// This is the page when you click 'HOME'

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Flutter Away',
            style: kLabelTextStyle,
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    'Good afternoon',
                    style: kGreetingTextStyle,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'How are you feeling today?',
                    style: kBodyTextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintText: 'Tell us!',
                      ),
                      cursorColor: kAppBarColour,
                    ),
                  )
                ],
              ),
            ),
            BottomButton(
              buttonTitle: 'SEARCH',
              onTap: () {
                if (textController.text.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Please enter some text!'),
                      );
                    },
                  );
                }
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ResultsPage(),
                //   ),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
