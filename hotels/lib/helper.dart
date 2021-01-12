import 'package:flutter/material.dart';

void showAlertDialog(BuildContext context, String errorMsg, Function ok) async {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
      if (ok != null) ok();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Ощибка",
        style: TextStyle(
          color: Colors.red,
        )),
    content: Text(errorMsg),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
