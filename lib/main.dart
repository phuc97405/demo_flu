import 'package:demo_flu/components/picker.dart';
import 'package:demo_flu/station.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'models/Transportation.dart';

enum ColorE { red, green, blue }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/': (context) => const MyHomePage(),
          '/station': (context) => const Station()
        },
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: const ColorScheme(
              brightness: Brightness.dark,
              primary: Color(0xffCADEAF),
              onPrimary: Color(0xff628941),
              secondary: Colors.blue,
              onSecondary: Colors.blue,
              error: Colors.red,
              onError: Colors.red,
              background: Colors.white,
              onBackground: Colors.white,
              onSecondaryContainer: Colors.black,
              surface: Colors.white,
              onSurface: Color(0xff628941)),
          textTheme: TextTheme(
            displayLarge: const TextStyle(
              fontSize: 72,
              fontWeight: FontWeight.bold,
            ),
            labelLarge: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Color(0xff090A0B)),
            labelMedium: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xff090A0B)),
            titleMedium: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 2,
                color: Colors.black),
            headlineMedium: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 2,
                color: Color(0xffA3A5AE)),
            titleLarge: GoogleFonts.oswald(
              fontSize: 30,
              fontStyle: FontStyle.italic,
            ),
            bodyMedium: GoogleFonts.merriweather(),
            displaySmall: GoogleFonts.pacifico(),
          ),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// class Person {
//   final String name;

//   Person(
//     this.name,
//   ); //contructor

//   void printName() {
//     //method
//     print(name);
//   }
// }

// class Cat extends Object {
//   final String name;

//   Cat(this.name);
//   @override
//   bool operator ==(covariant Cat other) => other.name == name;

//   @override
//   int get hashCode => name.hashCode;

//   // factory Cat.hello() {
//   //   return Cat('goodbye');
//   // }
// }

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _counter = 0;
  String? _busName;
  String? _stationName;
  int _indexCurrentOption = -1;

  // void test() {
  //   final cat1 = Cat('Foo');
  //   final cat2 = Cat('Foo');
  //   if (cat1 == cat2) {
  //     print('they qra equal');
  //   } else {
  //     print('They are not equal');
  //   }
  // }

  List<Transportation> typeTransportation = [
    Transportation(title: "예", isChecked: true, id: 0),
    Transportation(title: "아니요", isChecked: false, id: 1)
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

  static const descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      fontFamily: 'Roboto',
      height: 2,
      fontSize: 18);

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

  callback(value) {
    setState(() {
      _busName = value;
    });
  }

  Future<void> _navigateAndShowStation(BuildContext context) async {
    final stationName = await Navigator.pushNamed(
      context, '/station',
      // arguments: {"data": "pista"}
    );
    if (!mounted) return;
    setState(() {
      if (stationName != null) _stationName = '$stationName';
    });
    // ScaffoldMessenger.of(context)
    //   ..removeCurrentSnackBar()
    //   ..showSnackBar(SnackBar(content: Text('$')));
  }

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    // test();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: _scaffoldKey,
        endDrawerEnableOpenDragGesture: false,
        endDrawer: Drawer(
          elevation: 16,
          child: ListView(
            padding: const EdgeInsets.all(0.0),
            children: <Widget>[
              const UserAccountsDrawerHeader(
                accountName: Text("Pista99"),
                accountEmail: Text("pista@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text("Pista"),
                ),
              ),
              const ListTile(
                title: Text("Home"),
                trailing: Icon(Icons.new_releases),
              ),
              const Divider(),
              ListTile(
                title: const Text("Profile"),
                trailing: const Icon(Icons.person),
                onTap: () => {},
              ),
              const Divider(),
              ListTile(
                title: const Text("Close"),
                trailing: const Icon(Icons.close),
                onTap: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
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
                onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
                icon: const Icon(
                  Icons.menu,
                  size: 24,
                ),
                color: Colors.black,
              ),
            )
          ],
          // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          bottom: TabBar(
              labelColor: Theme.of(context).colorScheme.onPrimary,
              labelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                height: 2,
              ),
              labelPadding: const EdgeInsets.symmetric(horizontal: 0),
              indicator: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                border: Border(
                    bottom: BorderSide(
                        color: Theme.of(context).colorScheme.onPrimary,
                        width: 3,
                        style: BorderStyle.solid)),
              ),
              overlayColor: MaterialStatePropertyAll(
                  Theme.of(context).colorScheme.primary),
              // unselectedLabelColor: Colors.red,
              //     Theme.of(context).colorScheme.errorContainer,
              tabs: <Widget>[
                Tab(
                  child: SizedBox(
                    width: double.infinity,
                    child: Text('설정',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                                color:
                                    Theme.of(context).colorScheme.onPrimary)),
                  ),
                ),
                Tab(
                  child: SizedBox(
                    width: double.infinity,
                    child: Text('노선',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                                color:
                                    Theme.of(context).colorScheme.onPrimary)),
                  ),
                ),
              ]),
        ),
        body: TabBarView(
          children: [
            Stack(children: [
              Container(
                padding: const EdgeInsets.only(top: 24),
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
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
                                      color: _indexCurrentOption == 0
                                          ? const Color(0xff628941)
                                          : const Color(0xffE1E2E5),
                                      style: BorderStyle.solid),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                        onTap: () => {
                                              setState(() {
                                                _indexCurrentOption = 0;
                                              }),
                                              _decrementCounter()
                                            },
                                        child: Image.asset(
                                          'lib/images/ic_decre.png',
                                          fit: BoxFit.contain,
                                        )),
                                    Text('$_counter',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium),
                                    GestureDetector(
                                        onTap: () => {
                                              setState(() {
                                                _indexCurrentOption = 0;
                                              }),
                                              _incrementCounter()
                                            },
                                        child: Image.asset(
                                          'lib/images/ic_incre.png',
                                          fit: BoxFit.contain,
                                        )),
                                  ],
                                )),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Text(
                              "버스",
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
                                onPressed: () => {
                                      setState(() {
                                        _indexCurrentOption = 1;
                                      }),
                                      showCupertinoModalPopup(
                                              context: context,
                                              builder: ((BuildContext builder) {
                                                return Picker(
                                                    callback: callback);
                                              }))
                                          .whenComplete(() => setState(
                                              () => _indexCurrentOption = -1))
                                    },
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  height: 44,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: _indexCurrentOption == 1
                                            ? const Color(0xff628941)
                                            : const Color(0xffE1E2E5),
                                        style: BorderStyle.solid),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(6),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        (_busName ?? '버스 노선 번호를 선택해 주세요.'),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: _busName == null
                                                ? const Color(0xffA3A5AE)
                                                : Colors.black),
                                      )),
                                      _indexCurrentOption == 1
                                          ? const Icon(
                                              Icons.arrow_drop_up,
                                              color: Colors.black,
                                            )
                                          : const Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.black,
                                            ),
                                    ],
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
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
                            child: GestureDetector(
                              onTap: () => _busName != null
                                  ? _navigateAndShowStation(context)
                                  : {},
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
                                      Expanded(
                                          child: Text(
                                        (_stationName ?? "선택"),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium
                                            ?.copyWith(
                                                color: _stationName != null
                                                    ? const Color(0xff090A0B)
                                                    : const Color(0xffA3A5AE)),
                                      )),
                                      (_stationName != null
                                          ? Image.asset(
                                              'lib/images/ic_detail_active.png',
                                              fit: BoxFit.contain,
                                              width: 22,
                                              height: 22,
                                            )
                                          : Image.asset(
                                              'lib/images/ic_detail.png',
                                              fit: BoxFit.contain,
                                              width: 22,
                                              height: 22,
                                            ))
                                    ],
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
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
                            child: GestureDetector(
                              onTap: () => setState(() {
                                setState(() {
                                  _indexCurrentOption = 3;
                                });
                              }),
                              child: Container(
                                  padding: const EdgeInsets.all(6),
                                  height: 44,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(6),
                                    ),
                                    border: Border.all(
                                        width: 1,
                                        color: _indexCurrentOption == 3
                                            ? const Color(0xff628941)
                                            : const Color(0xffE1E2E5),
                                        style: BorderStyle.solid),
                                  ),
                                  child: Row(children: [
                                    Expanded(
                                        child: Text(
                                      typeTransportation
                                          .firstWhere(
                                              (element) => element.isChecked!)
                                          .title
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    )),
                                    _indexCurrentOption == 3
                                        ? const Icon(
                                            Icons.arrow_drop_up,
                                            color: Colors.black,
                                          )
                                        : const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black,
                                          ),
                                  ])),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
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
                                      color: _indexCurrentOption == 4
                                          ? const Color(0xff628941)
                                          : const Color(0xffE1E2E5),
                                      style: BorderStyle.solid),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _indexCurrentOption = 4;
                                        });
                                      },
                                      child: Text(
                                        "---",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      ),
                                    )),
                                    _indexCurrentOption == 4
                                        ? const Icon(
                                            Icons.arrow_drop_up,
                                            color: Colors.black,
                                          )
                                        : const Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.black,
                                          ),
                                  ],
                                )),
                          )
                        ],
                      ),
                    ),
                    Visibility(
                      visible: _indexCurrentOption == 4,
                      child: Expanded(
                          child: Container(
                        margin: const EdgeInsets.only(top: 32),
                        decoration: const BoxDecoration(
                            color: Color(0xffE1E2E5),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24))),
                        child: Center(
                          child: Image.asset(
                            'lib/images/ic_rfid.png',
                            fit: BoxFit.contain,
                            width: 152,
                            height: 154,
                          ),
                        ),
                      )),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: _indexCurrentOption == 3,
                child: Positioned(
                    right: 24,
                    top: 277,
                    height: 45 * double.parse('${typeTransportation.length}'),
                    width: (widthScreen - 48) * (2 / 3),
                    child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: const Color(0xffE1E2E5),
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(6))),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                typeTransportation.length,
                                (index) => Expanded(
                                  child: GestureDetector(
                                    onTap: () => setState(() {
                                      _indexCurrentOption = -1;
                                      typeTransportation.forEach((element) {
                                        if (element.id !=
                                            typeTransportation[index].id) {
                                          element.isChecked = false;
                                        } else {
                                          element.isChecked = true;
                                        }
                                      });
                                    }),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: typeTransportation[index]
                                                  .isChecked!
                                              ? const Color(0xffF5F6F7)
                                              : Colors.white,
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: index <
                                                          typeTransportation
                                                              .length
                                                      ? const Color(0xffE1E2E5)
                                                      : Colors.white,
                                                  width: 0.5))),
                                      child: Text(
                                        typeTransportation[index].title!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                        ))),
              ),
            ]),
            const Text('Tab Two'),
          ],
        ),
      ),
      // debugShowCheckedModeBanner: false,
    );
  }
}
