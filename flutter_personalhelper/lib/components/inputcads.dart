import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputCadLarg extends StatelessWidget {
  const InputCadLarg({Key? key, required this.inputname}) : super(key: key);

  final String inputname;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 40, left: 15),
          child: Text(
            inputname,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w300, fontSize: 18),
          ),
        ),
        SizedBox(
          height: 50,
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
        ),
      ],
    );
  }
}
