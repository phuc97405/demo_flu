import 'package:flutter/material.dart';

class Station extends StatefulWidget {
  const Station({super.key});

  @override
  State<Station> createState() => _StationState();
}

class _StationState extends State<Station> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leadingWidth: 54,
            toolbarHeight: 50,
            // automaticallyImplyLeading: false,
            leading: Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Image.asset(
                'lib/images/ic_bus.png',
                width: 30,
                height: 40,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: () => {},
                  icon: const Icon(
                    Icons.menu,
                    size: 24,
                  ),
                  color: Colors.black,
                ),
              )
            ]),
        body: Center(
            child: Column(children: [
          GestureDetector(
            onTap: () => {},
            child: Container(
              height: 44,
              padding: const EdgeInsets.only(left: 24),
              decoration:
                  BoxDecoration(color: Theme.of(context).colorScheme.primary),
              child: Row(
                children: [
                  const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                    size: 16,
                  ),
                  const SizedBox(width: 16),
                  Text(
                    '37 (내임선 - 황전면행정복지센터)',
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            child: Stack(children: [
              ListTile(
                leading: const Icon(
                  Icons.expand_circle_down_rounded,
                  size: 20,
                  color: Color(0xffE1E2E5),
                ),
                title: Text(
                  '문화예술회관',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                subtitle: Text(
                  '3260313 | 05:47-22:35',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                trailing: const Icon(
                  Icons.circle_outlined,
                  size: 20,
                  color: Color(0xffE1E2E5),
                ),
              ),
              const Positioned(
                  left: 24,
                  top: 20,
                  child: VerticalDivider(
                    width: 20,
                    thickness: 20,
                    color: Colors.black,
                  ))
            ]),
          ),
        ])));
  }
}
