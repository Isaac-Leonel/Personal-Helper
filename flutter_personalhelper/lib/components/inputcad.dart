import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputCad extends StatefulWidget {
  const InputCad({Key? key, required this.inputname}) : super(key: key);

  final String inputname;

  @override
  State<InputCad> createState() => _InputCadState();
}

class _InputCadState extends State<InputCad> {
  final controllerInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 15, left: 15),
          child: Text(
            widget.inputname,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w300, fontSize: 18),
          ),
        ),
        SizedBox(
          height: 30,
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
