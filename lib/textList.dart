// ignore_for_file: file_names

import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'topBar.dart';
import 'camera.dart';

class TextList extends StatelessWidget {
  const TextList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: /* поменять засунуть в текст первый */
            const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TopBar(),
            Row(
              children: const [
                Expanded(
                    child: Text(
                  'Осмотрите автомобиль внутри',
                  style: TextStyle(
                    color: Color(0xFF314177),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  softWrap: true,
                )),
              ],
            ),
            SizedBox(
              height: 90,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFf3f3f3),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  /* разобраться с флексом */
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    /*Icon(
                        Icons.camera_alt,
                        color: Color(0xFF00b864),
                        size: 50,
                      ),
                      Expanded(
                          child: Text(
                        'Сфотографировать повреждения',
                        style: TextStyle(
                          color: Color(0xFF00b864),
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 2,
                        softWrap: true,
                      )),*/
                    TextButton(
                        child: Row(
                          children: const [
                            Icon(
                              Icons.camera_alt,
                              color: Color(0xFF00b864),
                              size: 50,
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              'Сфотографировать \nповреждения',
                              style: TextStyle(
                                color: Color(0xFF00b864),
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                              maxLines: 2,
                              softWrap: true,
                            ),
                          ],
                        ),
                        onPressed: () {
                          cameraMain();
                        }),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 130,
              child: Container(
                decoration: const BoxDecoration(
                    //color: Color(0xFFf3f3f3),
                    ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      /*поместить текст в отдельный файл */
                      children: [
                        Row(
                          children: const [
                            Text(
                              'Проверьте в салоне:',
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: const [
                            Icon(Icons.arrow_right_rounded),
                            Text('Папку с краткой инструкцией'),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.arrow_right_rounded),
                            Text('Свидетельство о регистрации ТС'),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.arrow_right_rounded),
                            Text('Страховой полис ОСАГО'),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.arrow_right_rounded),
                            Text('Топливную карту'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //const Spacer(flex: 1),
            Row(
              children: const [
                Expanded(
                    child: Text(
                  'Нажимая на кнопку «Завершить осмотр и начать поездку» или предпринимания попытки запустить двигатель, Вы подтверждаете принятие амвтомобиля со всеми документами, возможность сообщить нам о выявленных повреждениях исчезнет.',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  maxLines: 5,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ))
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'inspect02');
                },
                child: const Text('inspect02'))
          ],
        ),
      ),
    );
  }
}
