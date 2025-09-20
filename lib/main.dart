import 'package:flutter/material.dart';

void main() {
  runApp(Second());
}

// class MainApp extends StatelessWidget {
//   String a = "john";
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text("changing"), backgroundColor: Colors.red),
//         body: ListView(
//           children: [
//             Text(a),
//             MaterialButton(
//               onPressed: () {
//                 print("bye");
//               },
//               child: Text("Click me!"),
//               color: Colors.blue,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<StatefulWidget> createState() {
    return Second1();
  }
}

class Second1 extends State<Second> {
  String a = "";
  String b = "";
  String op = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(top: 10, right: 10),
                child: Text(
                  a,
                  style: TextStyle(color: Colors.white, fontSize: 60),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    calc("7", Colors.grey),
                    calc("8", Colors.grey),
                    calc("9", Colors.grey),
                    calc("/", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    calc("6", Colors.grey),
                    calc("5", Colors.grey),
                    calc("4", Colors.grey),
                    calc("*", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    calc("1", Colors.grey),
                    calc("2", Colors.grey),
                    calc("3", Colors.grey),
                    calc("-", Colors.orange),
                  ],
                ),
                Row(
                  children: [
                    calc("0", Colors.grey),
                    calc(".", Colors.grey),
                    calc("=", Colors.orange),
                    calc("+", Colors.orange),
                  ],
                ),
                calc("clear", Colors.black),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget calc(String text, Color bgcolor) {
    return InkWell(
      onTap: () {
        if (text == "clear") {
          setState(() {
            a = "";
            b = "";
            op = "";
          });
        } else if (text == "+" || text == "-" || text == "*" || text == "/") {
          setState(() {
            b = a;
            a = "";
            op = text;
          });
        } else if (text == "=") {
          setState(() {
            if (op == "+") {
              a = (double.parse(b) + double.parse(a)).toString();
            } else if (op == "-") {
              a = (double.parse(b) - double.parse(a)).toString();
            } else if (op == "*") {
              a = (double.parse(b) * double.parse(a)).toString();
            } else if (op == "/") {
              a = (double.parse(b) / double.parse(a)).toString();
            }
          });
        } else {
          setState(() {
            a = a + text;
          });
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(3),
        height: MediaQuery.of(context).size.height / 8,
        width: MediaQuery.of(context).size.width / 4.28,
        alignment: Alignment.center,
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 30)),
      ),
    );
  }
}
