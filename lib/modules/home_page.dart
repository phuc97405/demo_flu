import 'package:demo_flu/components/picker.dart';
import 'package:demo_flu/models/Transportation.dart';
import 'package:demo_flu/models/User.dart';
import 'package:demo_flu/services/data/provider/my_api_provider.dart';
import 'package:demo_flu/services/data/repository/repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _counter = 0;
  String? _busName;
  String? _stationName;
  int _indexCurrentOption = -1;

  List<Transportation> typeTransportation = [
    Transportation(title: "예", isChecked: true, id: 0),
    Transportation(title: "아니요", isChecked: false, id: 1)
  ];

  final user = FirebaseAuth.instance.currentUser!;

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
    final stationName = await Navigator.pushNamed(context, '/station',
        arguments: Name(first: "John", last: "pista"));
    if (!mounted) return;
    setState(() {
      if (stationName != null) _stationName = '$stationName';
    });
    // ScaffoldMessenger.of(context)
    //   ..removeCurrentSnackBar()
    //   ..showSnackBar(SnackBar(content: Text('$')));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // MyApiProvide().login({'phone': '08422222222', 'password': '11111111'});
  }

  @override
  Widget build(BuildContext context) {
    // FirebaseAuth.instance.signOut();
    double widthScreen = MediaQuery.of(context).size.width;
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
                title: const Text("Log Out"),
                trailing: const Icon(Icons.close),
                onTap: () => FirebaseAuth.instance.signOut(),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          leadingWidth: 54,
          toolbarHeight: 50,
          backgroundColor: Colors.white,
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
                                        onTap: () async => {
                                              setState(() {
                                                _indexCurrentOption = 0;
                                              }),
                                              //  final res = Repository(myApiProvider).login({
                                              //     'phone': '08422222222',
                                              //     'password': '11111111'
                                              //   })
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
