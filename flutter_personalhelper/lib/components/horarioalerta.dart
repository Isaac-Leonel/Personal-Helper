import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorarioAlerta extends StatelessWidget {
  const HorarioAlerta(
      {Key? key,
      required this.alertName,
      required this.levelWarning,
      required this.alertIcon,
      required this.alertTime})
      : super(key: key);

  final String alertName;
  final int levelWarning;
  final String alertIcon;
  final String alertTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 10, top: 5),
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFF32A18A),
          boxShadow: [
            BoxShadow(color: const Color(0xFF32A18A), spreadRadius: 3),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                alertTime + ' | ',
                style: TextStyle(color: Colors.white),
              ),
              Row(
                children: [
                  SizedBox(
                      child: Image.asset(
                    alertIcon,
                    fit: BoxFit.fitWidth,
                    width: 20,
                    height: 20,
                  )),
                  Text(
                    alertName,
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
