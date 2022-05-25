import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 30,
          color: const Color(0xFF00261D),
          child: Row(
            children: [],
          ),
        ),
      ),
    );
  }
}
