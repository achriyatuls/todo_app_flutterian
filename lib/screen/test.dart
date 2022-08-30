import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//         appBar: AppBar(
//         title: Text('Bottom Oerflowed by Pixels Keyboard')),
//         body: Center(
//           child: CustomView()
//           )
//         )
//       );
//   }
// }

class CustomView extends StatefulWidget {
  CustomViewWidget createState() => CustomViewWidget();
}

class CustomViewWidget extends State {
  final fName = TextEditingController();
  final lName = TextEditingController();
  final subject = TextEditingController();
  final className = TextEditingController();
  final phoneNumber = TextEditingController();

  getValues() {
    print(fName.text);
    print(lName.text);
    print(subject.text);
    print(className.text);
    print(phoneNumber.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              width: 350,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: fName,
                autocorrect: true,
                decoration:
                    InputDecoration(hintText: 'Enter Your First Name Here'),
              )),
          Container(
              width: 350,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: lName,
                autocorrect: true,
                decoration:
                    InputDecoration(hintText: 'Enter Your Last Name Here'),
              )),
          Container(
              width: 350,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: subject,
                autocorrect: true,
                decoration:
                    InputDecoration(hintText: 'Enter Your Subject Here'),
              )),
          Container(
              width: 350,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: className,
                autocorrect: true,
                decoration: InputDecoration(hintText: 'Enter Your Class Here'),
              )),
          Container(
              width: 350,
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: phoneNumber,
                autocorrect: true,
                decoration:
                    InputDecoration(hintText: 'Enter Your Phone Number Here'),
              )),
          RaisedButton(
            onPressed: getValues,
            color: Colors.green,
            textColor: Colors.white,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Text('Click Here To Get Text Field Entered Data'),
          ),
        ],
      ),
    )));
  }
}
