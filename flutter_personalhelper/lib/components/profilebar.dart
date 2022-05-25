import 'package:flutter/material.dart';

class ProfileBar extends StatelessWidget {
  const ProfileBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                  child: Image.asset(
                'assets/img/idosocad.png',
                fit: BoxFit.fitWidth,
                width: 30,
                height: 30,
              )),
              const Text(
                'Olá! Pedro',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          const Icon(
            Icons.settings,
            color: Colors.white,
            size: 30,
          )
        ],
      ),
    );
  }
}
