import 'package:flutter/material.dart';
import 'package:practice_isar/widgets/primary_button.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            mainAxisSize: MainAxisSize.max,

            children: [
              Image.asset(
                'assets/images/art-canvas.png',
                width: 300,
                height: 300,
              ),

              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Notefy', style: TextStyle(fontSize: 34)),

                  const SizedBox(height: 10),

                  const Text(
                    'Your thoughts beautifully organized. Seamless flow for your daily mindfulness, study, and creative output.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),

                  const SizedBox(height: 25),

                  const PrimaryButton(),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
