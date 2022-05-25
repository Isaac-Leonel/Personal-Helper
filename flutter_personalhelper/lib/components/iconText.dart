import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconText extends StatelessWidget {
  const IconText({Key? key, required this.texticon, required this.iconSrc})
      : super(key: key);

  final String texticon;
  final String iconSrc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(width: 20, height: 20, child: Image.asset(iconSrc)),
            Text(
              texticon,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w300,
                fontSize: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
