import 'package:flutter/material.dart';
import 'topBar.dart';
import 'camera.dart';

class Inspection02 extends StatelessWidget {
  const Inspection02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const barHeight = 90.0;
    const vertPadding = 10.0;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const TopBar(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'app');
              },
              child: const Text('home'),
            ),
            Container(
              /* gallery bar */
              height: barHeight,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: vertPadding),
                scrollDirection: Axis.horizontal,
                itemCount: capturedImages.length,
                itemBuilder: (BuildContext context, int i) {
                  return Container(
                    padding: const EdgeInsets.only(right: 5.0),
                    margin: const EdgeInsets.only(right: 5),
                    width: 70,
                    height: barHeight - vertPadding * 2,
                    child: Image(
                      image: FileImage(capturedImages[i]),
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
