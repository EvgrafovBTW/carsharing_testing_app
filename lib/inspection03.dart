import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newflutterproject/topBar.dart';

class inspect03 extends StatelessWidget {
  const inspect03({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            TopBar(),
            SizedBox(
              height: 20,
            ),
            Text(
              'Выберите из списка, \nчего нет в салоне',
              style: TextStyle(
                color: Color(0xFF314177),
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              softWrap: true,
            ),
            //CheckBox(),
          ],
        ),
      ),
    );
  }
}

/*class CheckBox extends StatefulWidget {
  const CheckBox({Key? key}) : super(key: key);

  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool isChecked = false;
  List<String> text = [
    "Папка с краткой инструкицей",
    "Свидетельство о регистрации ТС",
    "Страховой полис ОСАГО",
    "Топливная карта",
  ];
  

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveState = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveState.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    /*Checkbox(
        checkColor: Colors.white,
        fillColor: MaterialStateProperty.resolveWith(getColor),
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
          });
        });
  }
    return Scaffold(
      body: ListView.builder(
          itemCount: text.length,
          itemBuilder: (BuildContext context, int i) {
            return CheckboxListTile(
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = !value!;
                  });
                });
          }),
    );*/
  }
}*/
