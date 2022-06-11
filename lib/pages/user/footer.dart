import 'package:flutter/material.dart';

void main() => runApp(const Footer());

class Footer extends StatelessWidget {
  const Footer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Image.asset(
        "assets/footer.png",
        height: 67,
      ),
    );
  }
}