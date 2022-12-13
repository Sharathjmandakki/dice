import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(dice());
}

class dice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[500],
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: Text(
            "role the dice",
            style: TextStyle(fontSize: 30),
          ),
        ),
        body: role(),
      ),
    );
  }
}

class role extends StatefulWidget {
  const role({Key? key}) : super(key: key);

  @override
  State<role> createState() => _roleState();
}

class _roleState extends State<role> {
  int lr = 1;
  int rr = 1;
  String result = "role the die";
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          dice();
                        },
                        child: Image.asset("images/$lr.png"))),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      dice();
                    },
                    child: Image.asset("images/$rr.png"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30, 0, 20, 0),
              child: Text(
                "$result",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellowAccent,
                  fontStyle: FontStyle.italic,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  dice() {
    setState(() {
      rr = Random().nextInt(6) + 1;
      lr = Random().nextInt(6) + 1;
      trys();
      if (lr == rr) {
        if (count <= 5) {
          result = "Yap you win after $count number of trys \n not bad..!";
        } else {
          result = "Yap you win after $count number of trys";
        }
      } else {
        result = "try one more time";
      }
    });
  }

  trys() {
    count = count + 1;
  }
}
