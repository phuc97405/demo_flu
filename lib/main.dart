import 'package:demo_flu/picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectedValue = 0;

  List<String> _fruitNames = <String>[
    'Apple',
    'Mango',
    'Banana',
    'Orange',
    'Pineapple',
    'Strawberry',
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    if (_counter > 1) {
      setState(() {
        _counter = _counter - 1;
      });
    }
  }

  final stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        Icons.star,
        color: Colors.green[500],
      ),
      Icon(
        Icons.star,
        color: Colors.green[500],
      ),
      Icon(
        Icons.star,
        color: Colors.green[500],
      ),
      const Icon(Icons.star, color: Colors.black),
      const Icon(Icons.star, color: Colors.black),
    ],
  );

  final ratings = Container(
    padding: const EdgeInsets.all(20),
    child: const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          '10 Reviews',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 20),
        )
      ],
    ),
  );

  static const descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      fontFamily: 'Roboto',
      height: 2,
      fontSize: 18);

  final iconList = DefaultTextStyle.merge(
      style: descTextStyle,
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(width: 10, color: Colors.black38),
            color: Colors.black38,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Icon(Icons.kitchen, color: Colors.green[500]),
                const Text('PREP'),
                const Text("25 min")
              ],
            ),
            Column(
              children: [
                Icon(Icons.timer, color: Colors.green[500]),
                const Text('COOK'),
                const Text("1 hr")
              ],
            ),
            Column(
              children: [
                Icon(Icons.restaurant, color: Colors.green[500]),
                const Text('FEEDS'),
                const Text("4-6")
              ],
            )
          ],
        ),
      ));

  Widget _buildGrid() => GridView.extent(
        maxCrossAxisExtent: 150,
        padding: EdgeInsets.all(4),
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: _buildGridTileList(4),
      );
  List<Container> _buildGridTileList(int count) => List.generate(
      count,
      (index) => Container(
            child: Image.asset('lib/images/pic$index.jpg'),
          ));

  Widget _buildList() {
    return ListView(
      children: [
        _tile('CineArts at the Empire', '85 W Portal Ave', Icons.theaters),
        _tile('The Castro Theater', '429 Castro St', Icons.theaters),
        _tile('Alamo Drafthouse Cinema', '2550 Mission St', Icons.theaters),
        const Divider(),
        _tile('Roxie Theater', '3117 16th St', Icons.theaters),
        _tile('United Artists Stonestown Twin', '501 Buckingham Way',
            Icons.theaters),
        _tile('AMC Metreon 16', '135 4th St #3000', Icons.theaters),
        const Divider(),
        _tile('K\'s Kitchen', '757 Monterey Blvd', Icons.restaurant),
        _tile('Emmy\'s Restaurant', '1923 Ocean Ave', Icons.restaurant),
      ],
    );
  }

  ListTile _tile(String title, String subtitle, IconData icon) {
    return ListTile(
      title: Text(title,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
      subtitle: Text(subtitle),
      leading: Icon(icon, color: Colors.blue[500]),
    );
  }

  Widget _buildStack() {
    return Stack(
      alignment: const Alignment(0.6, 0.6),
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage(
            'lib/images/pic0.jpg',
          ),
          radius: 10,
        ),
        Container(
          decoration: const BoxDecoration(color: Colors.black45),
          child: const Text(
            "Pista99",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        )
      ],
    );
  }

  Widget _buildCard() {
    return SizedBox(
      height: 210,
      child: Card(
          child: Column(
        children: [
          ListTile(
            title: const Text(
              "29A Cao Thang, DaKao Q1",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: const Text("HCM 71200"),
            leading: Icon(
              Icons.restaurant_menu,
              color: Colors.blue[500],
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text("0282322345234",
                style: TextStyle(fontWeight: FontWeight.w500)),
            leading: Icon(
              Icons.contact_phone,
              color: Colors.blue[500],
            ),
          ),
          ListTile(
            title: const Text('brickmate@gmail.com'),
            leading: Icon(
              Icons.contact_mail,
              color: Colors.blue[500],
            ),
          )
        ],
      )),
    );
  }

  void _showPicker(BuildContext context) async {
    await showCupertinoModalPopup(
        context: context,
        builder: ((BuildContext builder) {
          return Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1,
                    color: const Color(0xffE1E2E5),
                    style: BorderStyle.solid),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50))),
            child: CupertinoPicker(
              backgroundColor: Colors.red,
              itemExtent: 30,
              scrollController: FixedExtentScrollController(initialItem: 0),
              children: List.generate(
                  _fruitNames.length, (index) => Text(_fruitNames[index])),
              onSelectedItemChanged: (int value) {
                setState(() {});
              },
            ),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 40,
          toolbarHeight: 50,
          automaticallyImplyLeading: false,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset(
              'lib/images/ic_bus.png',
              width: 30,
              height: 40,
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.menu,
                size: 24,
                color: Colors.black,
              ),
            )
          ],
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          bottom: const TabBar(
              labelColor: Color(0xff628941),
              indicator: BoxDecoration(
                color: Color(0xffCADEAF),
                border: Border(
                    bottom: BorderSide(color: Color(0xff628941), width: 3)),
              ),
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                  child: Text(
                    '설정',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        height: 2,
                        color: Color(0xff628941)),
                  ),
                ),
                Tab(
                  child: Text(
                    '노선',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        height: 2,
                        color: Color(0xff628941)),
                  ),
                ),
              ]),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Text(
                              "인원수",
                              style: TextStyle(
                                  color: Color(0xff0A0A0A),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                                padding: const EdgeInsets.all(6),
                                height: 44,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(6),
                                  ),
                                  border: Border.all(
                                      width: 1,
                                      color: const Color(0xffE1E2E5),
                                      style: BorderStyle.solid),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                        onTap: () => _decrementCounter(),
                                        child: Image.asset(
                                          'lib/images/ic_decre.png',
                                          fit: BoxFit.contain,
                                        )),
                                    Text(
                                      '$_counter',
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          height: 2),
                                    ),
                                    GestureDetector(
                                        onTap: () => _incrementCounter(),
                                        child: Image.asset(
                                          'lib/images/ic_incre.png',
                                          fit: BoxFit.contain,
                                        )),
                                  ],
                                )),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Text(
                              "인원수",
                              style: TextStyle(
                                  color: Color(0xff0A0A0A),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: CupertinoButton(
                                color: Colors.transparent,
                                padding: const EdgeInsets.all(0),
                                onPressed: () => _showPicker(context),
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  height: 44,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: const Color(0xffE1E2E5),
                                        style: BorderStyle.solid),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(6),
                                    ),
                                  ),
                                  child: const Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        "버스 노선 번호를 선택해 주세요.",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.black),
                                      )),
                                      Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                )),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Text(
                              "정류장",
                              style: TextStyle(
                                  color: Color(0xff0A0A0A),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                                padding: const EdgeInsets.all(6),
                                height: 44,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(6),
                                  ),
                                  border: Border.all(
                                      width: 1,
                                      color: const Color(0xffE1E2E5),
                                      style: BorderStyle.solid),
                                ),
                                child: Row(
                                  children: [
                                    const Expanded(child: Text("선택")),
                                    Image.asset(
                                      'lib/images/ic_detail.png',
                                      fit: BoxFit.contain,
                                    )
                                  ],
                                )),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Text(
                              "교통 약자",
                              style: TextStyle(
                                  color: Color(0xff0A0A0A),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                                padding: const EdgeInsets.all(6),
                                height: 44,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(6),
                                  ),
                                  border: Border.all(
                                      width: 1,
                                      color: const Color(0xffE1E2E5),
                                      style: BorderStyle.solid),
                                ),
                                child: const Row(
                                  children: [
                                    Expanded(child: Text("예")),
                                    Icon(
                                      Icons.arrow_drop_down,
                                    )
                                  ],
                                )),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Text(
                              "결제 선택",
                              style: TextStyle(
                                  color: Color(0xff0A0A0A),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                                padding: const EdgeInsets.all(6),
                                height: 44,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(6),
                                  ),
                                  border: Border.all(
                                      width: 1,
                                      color: const Color(0xffE1E2E5),
                                      style: BorderStyle.solid),
                                ),
                                child: const Row(
                                  children: [
                                    Expanded(child: Text("---")),
                                    Icon(
                                      Icons.arrow_drop_down,
                                    )
                                  ],
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                ))
              ],
            ),
            const Text('Tab two'),
          ],
        ),
      ),
      // debugShowCheckedModeBanner: false,
    );
  }
}
