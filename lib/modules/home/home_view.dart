import 'package:demo_flu/components/picker.dart';
import 'package:demo_flu/modules/home/home_controller.dart';
import 'package:demo_flu/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // FirebaseAuth.instance.signOut();
    double widthScreen = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: scaffoldKey,
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
                  onTap: () => {
                        controller.getStorage.erase(),
                        Get.offAllNamed(Routes.login)
                        // Navigator.pushNamedAndRemoveUntil(
                        //     context, '/authen', (route) => false)
                      }
                  // FirebaseAuth.instance.signOut(),
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
                onPressed: () => scaffoldKey.currentState?.openEndDrawer(),
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
                              child: Obx(() => Container(
                                  padding: const EdgeInsets.all(6),
                                  height: 44,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(6),
                                    ),
                                    border: Border.all(
                                        width: 1,
                                        color: controller
                                                    .indexCurrentOption.value ==
                                                1
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
                                                controller.indexCurrentOption
                                                    .value = 0,
                                                controller.decrementCounter()
                                              },
                                          //  final res = Repository(myApiProvider).login({
                                          //     'phone': '08422222222',
                                          //     'password': '11111111'
                                          //   })
                                          child: Image.asset(
                                            'lib/images/ic_decre.png',
                                            fit: BoxFit.contain,
                                          )),
                                      Obx(() => Text(
                                          '${controller.counter.value}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium)),
                                      GestureDetector(
                                          onTap: () => {
                                                controller.indexCurrentOption
                                                    .value = 1,
                                                controller.incrementCounter()
                                              },
                                          child: Image.asset(
                                            'lib/images/ic_incre.png',
                                            fit: BoxFit.contain,
                                          )),
                                    ],
                                  )))),
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
                                      controller.indexCurrentOption.value = 2,
                                      showCupertinoModalPopup(
                                              context: context,
                                              builder: ((BuildContext builder) {
                                                return Picker(
                                                    callback:
                                                        controller.callback);
                                              }))
                                          .whenComplete(() => controller
                                              .indexCurrentOption.value = 0)
                                    },
                                child: Obx(() => Container(
                                      padding: const EdgeInsets.all(6),
                                      height: 44,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: controller.indexCurrentOption
                                                        .value ==
                                                    2
                                                ? const Color(0xff628941)
                                                : const Color(0xffE1E2E5),
                                            style: BorderStyle.solid),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(6),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Obx(() => Text(
                                                (controller.busName.value
                                                        .isNotEmpty
                                                    ? controller.busName.value
                                                    : '버스 노선 번호를 선택해 주세요.'),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: controller
                                                            .busName.isEmpty
                                                        ? const Color(
                                                            0xffA3A5AE)
                                                        : Colors.black),
                                              )),
                                          Icon(
                                            (controller.indexCurrentOption
                                                        .value ==
                                                    2
                                                ? Icons.arrow_drop_up
                                                : Icons.arrow_drop_down),
                                            color: Colors.black,
                                          )
                                        ],
                                      ),
                                    ))),
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
                              onTap: () => controller.busName.isNotEmpty
                                  ? controller.navigateAndShowStation(context)
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Obx(() => Text(
                                            (controller.stationName.value
                                                    .isNotEmpty
                                                ? controller.stationName.value
                                                : "선택"),
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium
                                                ?.copyWith(
                                                    color: controller
                                                            .stationName
                                                            .isNotEmpty
                                                        ? const Color(
                                                            0xff090A0B)
                                                        : const Color(
                                                            0xffA3A5AE)),
                                          )),
                                      Image.asset(
                                        (controller.stationName.isNotEmpty
                                            ? 'lib/images/ic_detail_active.png'
                                            : 'lib/images/ic_detail.png'),
                                        fit: BoxFit.contain,
                                        width: 22,
                                        height: 22,
                                      )
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
                              onTap: () =>
                                  controller.indexCurrentOption.value = 4,
                              child: Obx(() => Container(
                                  padding: const EdgeInsets.all(6),
                                  height: 44,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(6),
                                    ),
                                    border: Border.all(
                                        width: 1,
                                        color: controller
                                                    .indexCurrentOption.value ==
                                                4
                                            ? const Color(0xff628941)
                                            : const Color(0xffE1E2E5),
                                        style: BorderStyle.solid),
                                  ),
                                  child: Row(children: [
                                    Expanded(
                                        child: Text(
                                      controller.typeTransportation
                                          .firstWhere(
                                              (element) => element.isChecked!)
                                          .title
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    )),
                                    Icon(
                                      (controller.indexCurrentOption.value == 4
                                          ? Icons.arrow_drop_up
                                          : Icons.arrow_drop_down),
                                      color: Colors.black,
                                    )
                                  ]))),
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
                                      color:
                                          controller.indexCurrentOption.value ==
                                                  5
                                              ? const Color(0xff628941)
                                              : const Color(0xffE1E2E5),
                                      style: BorderStyle.solid),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: GestureDetector(
                                      onTap: () {
                                        controller.indexCurrentOption.value = 5;
                                      },
                                      child: Text(
                                        "---",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      ),
                                    )),
                                    controller.indexCurrentOption.value == 5
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
                    Obx(() => Visibility(
                          visible: controller.indexCurrentOption.value == 5,
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
                        )),
                  ],
                ),
              ),
              Obx(() => Visibility(
                    visible: controller.indexCurrentOption.value == 4,
                    child: Positioned(
                        right: 24,
                        top: 277,
                        height: 45 *
                            double.parse(
                                '${controller.typeTransportation.length}'),
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
                                    controller.typeTransportation.length,
                                    (index) => Expanded(
                                      child: GestureDetector(
                                        onTap: () => {
                                          controller.indexCurrentOption.value =
                                              0,
                                          controller.typeTransportation
                                              .forEach((element) {
                                            if (element.id !=
                                                controller
                                                    .typeTransportation[index]
                                                    .id) {
                                              element.isChecked = false;
                                            } else {
                                              element.isChecked = true;
                                            }
                                          })
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color: controller
                                                      .typeTransportation[index]
                                                      .isChecked!
                                                  ? const Color(0xffF5F6F7)
                                                  : Colors.white,
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: index <
                                                              controller
                                                                  .typeTransportation
                                                                  .length
                                                          ? const Color(
                                                              0xffE1E2E5)
                                                          : Colors.white,
                                                      width: 0.5))),
                                          child: Text(
                                            controller.typeTransportation[index]
                                                .title!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )),
                            ))),
                  )),
            ]),
            const Text('Tab Two'),
          ],
        ),
      ),
      // debugShowCheckedModeBanner: false,
    );
  }
}
