import 'package:flutter/material.dart';

Color btnColor = const Color(0xffEAB500);

class LoadingButton extends StatelessWidget {
  const LoadingButton({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: 150,
        margin: const EdgeInsets.only(top: 20),
        child: TextButton(
          onPressed: (){},
          style: TextButton.styleFrom(
            backgroundColor: btnColor
          ),
          child: Row(
            children: const [
              SizedBox(
                width: 5,
              ),
              SizedBox(
                height: 15,
                width: 15,
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Center(
                child: Text(
                  "Loading...",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      );
  }
}