import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Picker extends StatefulWidget {
  const Picker({Key? key}) : super(key: key);

  @override
  State<Picker> createState() => _PickerState();
}

class _PickerState extends State<Picker> {
  final List<String> _fruitNames = <String>[
    '37 (내임선 - 황전면행정복지센터)',
    '38 (내임선 - 황전면행정복지센터)',
    '39 (내임선 - 황전면행정복지센터)',
    '40 (내임선 - 황전면행정복지센터)',
    '41 (내임선 - 황전면행정복지센터)',
    '42 (내임선 - 황전면행정복지센터)',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              color: const Color(0xffE1E2E5),
              style: BorderStyle.solid),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50))),
      child: CupertinoPicker(
        backgroundColor: Colors.white,
        itemExtent: 30,
        scrollController: FixedExtentScrollController(initialItem: 3),
        children: List.generate(
            _fruitNames.length, (index) => Text(_fruitNames[index])),
        onSelectedItemChanged: (int value) {
          setState(() {});
        },
      ),
    );
  }
}
