import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Picker extends StatefulWidget {
  const Picker({Key? key}) : super(key: key);

  @override
  State<Picker> createState() => _PickerState();
}

class _PickerState extends State<Picker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: CupertinoButton.filled(
            child: Text("hello"),
            onPressed: () => showCupertinoModalPopup(
                context: context,
                builder: (_) => SizedBox(
                      width: double.infinity,
                      height: 250,
                      child: CupertinoPicker(
                        backgroundColor: Colors.white,
                        itemExtent: 30,
                        scrollController:
                            FixedExtentScrollController(initialItem: 1),
                        children: [Text('1'), Text('2'), Text('3')],
                        onSelectedItemChanged: (int value) {},
                      ),
                    ))),
      )),
    );
  }
}
