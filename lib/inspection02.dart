import 'dart:developer';

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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const TopBar(),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Осмотрите автомобиль \nснаружи',
              style: TextStyle(
                color: Color(0xFF314177),
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              softWrap: true,
            ),
            Container(
              /* gallery bar */
              height: barHeight,
              margin: const EdgeInsets.all(10),
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
            ElevatedButton(
                onPressed: () {
                  cameraMain();
                  log('pressed');
                  Navigator.pushNamed(context, 'camera');
                },
                child: const Icon(Icons.drive_eta)),
            const SizedBox(
              height: 350,
            ),
            MaterialButton(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              color: const Color(0xFF314177),
              onPressed: () {
                log('открыты');
                Navigator.pushReplacementNamed(context, 'inspect03');
              },
              child: Column(
                children: const [
                  Text(
                    'Открыть двери',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'и начать осмотр салона',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  )
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: const BorderSide(
                  color: Color(0xFF314177),
                  width: 0.6,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Как только время на таймере истечёт, \nосмотр станет платным',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
