import 'package:demo_flu/modules/detail_station.dart';
import 'package:demo_flu/models/User.dart';
import 'package:flutter/material.dart';

class Station extends StatefulWidget {
  Station({super.key});

  @override
  State<Station> createState() => _StationState();
}

class _StationState extends State<Station> {
  int indexItemSelected = -1;
  final List listStation = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
  late Future<List<User>> futureUsers;

  @override
  void initState() {
    super.initState();
    // futureUsers = UserService().getUser();
  }

  @override
  Widget build(BuildContext context) {
    final _busName = ModalRoute.of(context)?.settings.arguments;
    // print(_busName.);
    return Scaffold(
        resizeToAvoidBottomInset: false, // set it to false
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
        body: SafeArea(
          bottom: false,
          // maintainBottomViewPadding: true,
          child: RefreshIndicator(
            onRefresh: () async {
              // var users = await UserService().getUser();
              setState(() {
                // futureUsers = Future.value(users);
              });
            },
            child: Center(
                child: FutureBuilder<List<User>>(
              future: futureUsers,
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        User user = snapshot.data?[index];
                        return ListTile(
                          title: Text('user.name.first'),
                          subtitle: Text('user.name.last'),
                          trailing: const Icon(Icons.chevron_right_outlined),
                          onTap: (() => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailStation(
                                              user: user,
                                            )))
                              }),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          color: Colors.black26,
                        );
                      },
                      itemCount: snapshot.data!.length);
                } else if (snapshot.hasData) {
                  return Text('ERROR: ${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            )
                // Column(children: [
                //   GestureDetector(
                //     onTap: () => Navigator.pop(context, "Data Return"),
                //     child: Container(
                //       height: 44,
                //       padding: const EdgeInsets.only(left: 24),
                //       decoration:
                //           BoxDecoration(color: Theme.of(context).colorScheme.primary),
                //       child: Row(
                //         children: [
                //           const Icon(
                //             Icons.arrow_back_ios,
                //             color: Colors.black,
                //             size: 16,
                //           ),
                //           const SizedBox(width: 16),
                //           Text(
                //             '37 (내임선 - 황전면행정복지센터)',
                //             style: Theme.of(context).textTheme.titleMedium,
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                //   Expanded(
                //     child: SingleChildScrollView(
                //       child: Column(
                //           children: List.generate(
                //         listStation.length,
                //         (index) => Stack(clipBehavior: Clip.none, children: [
                //           Positioned(
                //               left: 25,
                //               top: 40,
                //               child: Container(
                //                 width: 20,
                //                 height: index < listStation.length - 1 ? 60 : 0,
                //                 decoration: BoxDecoration(
                //                     border: Border(
                //                         left: BorderSide(
                //                             color: index >= indexItemSelected &&
                //                                     indexItemSelected > -1
                //                                 ? const Color(0xffAFDF7B)
                //                                 : const Color(0xffE1E2E5),
                //                             width: 2))),
                //               )),
                //           ListTile(
                //             onTap: () {
                //               setState(() {
                //                 indexItemSelected = index;
                //               });
                //             },
                //             leading: Image.asset(
                //               index == indexItemSelected
                //                   ? 'lib/images/ic_station_green.png'
                //                   : 'lib/images/ic_station.png',
                //               fit: BoxFit.contain,
                //               width: 20,
                //             ),
                //             title: Text(
                //               '문화예술회관',
                //               style: Theme.of(context).textTheme.labelMedium,
                //             ),
                //             subtitle: Text(
                //               '3260313 | 05:47-22:35',
                //               style: Theme.of(context).textTheme.labelMedium,
                //             ),
                //             trailing: index == indexItemSelected
                //                 ? Image.asset(
                //                     'lib/images/ic_dot_border.png',
                //                     fit: BoxFit.contain,
                //                     width: 20,
                //                   )
                //                 : const Icon(
                //                     Icons.circle_outlined,
                //                     size: 20,
                //                     color: Color(0xffE1E2E5),
                //                   ),
                //           ),
                //         ]),
                //       )),
                //     ),
                //   ),
                //   Container(
                //     // height: 119,
                //     width: double.infinity,
                //     padding: const EdgeInsets.only(
                //         left: 24, right: 24, top: 24, bottom: 44),
                //     decoration: const BoxDecoration(
                //         color: Color(0xffF5F6F7),
                //         borderRadius: BorderRadius.only(
                //             topLeft: Radius.circular(26),
                //             topRight: Radius.circular(26))),
                //     child: GestureDetector(
                //       onTap: () => Navigator.pop(context, "Data Return"),
                //       child: Container(
                //           width: double.infinity,
                //           decoration: const BoxDecoration(
                //               color: Color(0xffAFDF7B),
                //               borderRadius: BorderRadius.all(Radius.circular(8))),
                //           padding: const EdgeInsets.symmetric(vertical: 12),
                //           child: Text(
                //             '완료',
                //             textAlign: TextAlign.center,
                //             style: Theme.of(context).textTheme.labelLarge,
                //           )),
                //     ),
                //   )
                // ])

                ),
          ),
        ));
  }
}
