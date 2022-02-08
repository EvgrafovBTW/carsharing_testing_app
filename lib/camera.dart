import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:newflutterproject/inspection02.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

late List<CameraDescription> cameras;
List<File> capturedImages = [];

void cameraMain() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
  runApp(MaterialApp(
    home: const CameraApp(),
    routes: {
      'inspect02': (context) => const Inspection02(),
    },
  ));
}

class CameraApp extends StatefulWidget {
  const CameraApp({Key? key}) : super(key: key);

  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  static const barHeight = 90.0;
  static const vertPadding = 10.0;

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      //home: Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          CameraPreview(controller),
          Column(
            children: [
              const SizedBox(
                height: 650,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    /* кнопка снимка */
                    onTap: () async {
                      var xFile = await controller.takePicture();
                      setState(() {
                        capturedImages.add(File(xFile.path));
                      });
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: const Icon(Icons.camera_alt_outlined),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'inspect02');
                      },
                      child: const Text('Готово'))
                  /*Builder(
                    /* рамка галереи */
                    builder: (context) => GestureDetector(
                      onTap: () {
                        if (capturedImages.isEmpty) return;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GalleryScreen(
                                    images: capturedImages.reversed.toList())));
                      },
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          image: capturedImages.isNotEmpty
                              ? DecorationImage(
                                  image: FileImage(capturedImages.last),
                                  fit: BoxFit.cover)
                              : null,
                        ),
                      ),
                    ),
                  ),*/
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  /*Widget _buildGalleryBar() {
    const barHeight = 90.0;
    const vertPadding = 10.0;

    return Container(
      height: barHeight,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: vertPadding),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int i) {
            return Container(
              padding: const EdgeInsets.only(right: 5.0),
              width: 70.0,
              height: barHeight - vertPadding * 2,
              child: Image(
                image: FileImage(capturedImages[i]),
                fit: BoxFit.cover,
              ),
            );
          }),
    );
  }*/

  /*Widget _buildControlBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          /* вспышка */
          color: Colors.white,
          icon: const Icon(Icons.flash_auto),
          onPressed: () {},
        ),
        GestureDetector(
          /* кнопка снимка */
          onTap: () async {
            var xFile = await controller.takePicture();
            setState(() {
              capturedImages.add(File(xFile.path));
            });
          },
          child: Container(
            height: 80.0,
            width: 80.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
        /* тут должна быть кнопка "ГОТОВО" */
      ],
    );
  }*/
}

class GalleryScreen extends StatelessWidget {
  final List<File> images;
  const GalleryScreen({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        children: images
            .map((image) => Image.file(image, fit: BoxFit.cover))
            .toList(),
      ),
    );
  }
}
