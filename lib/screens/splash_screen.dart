import 'package:flutter/material.dart';
import 'package:todo_app/core/constants/constants.dart';
import 'package:todo_app/core/constants/layout.dart';

class EntryPage extends StatelessWidget {
  const EntryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            height: getHeight(670),
            padding: EdgeInsets.only(top: getHeight(100)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: getHeight(195),
                  width: getWidth(180),
                  child: Image.asset(
                    "assets/images/entry.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  "Reminders made simple",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: Constants.h1,
                    color: Constants.textColor,
                  ),
                ),
                SizedBox(
                  height: getHeight(56),
                  width: getWidth(258),
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.pushReplacementNamed(context, "/home");
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                    child: const Text("Get started"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
