import 'package:flutter/material.dart';
import 'package:practice_isar/providers/screen_switch.dart';
import 'package:provider/provider.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<ScreenSwitch>().homepage();
      },
      splashColor: Color.fromARGB(149, 230, 94, 45),
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        width: 338,
        height: 50,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 197, 97, 60), // your bg color here
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            "Get Started",
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.onSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
