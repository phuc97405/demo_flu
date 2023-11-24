import 'package:demo_flu/models/Transportation.dart';
import 'package:demo_flu/services/data/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  Repository repository;
  HomeController(this.repository);

  // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final getStorage = GetStorage();
  RxInt counter = 0.obs;
  RxString busName = ''.obs;
  RxString stationName = ''.obs;
  RxInt indexCurrentOption = 0.obs;

  RxList<Transportation> typeTransportation = [
    Transportation(title: "예", isChecked: true, id: 0),
    Transportation(title: "아니요", isChecked: false, id: 1)
  ].obs;

  // final user = FirebaseAuth.instance.currentUser!;

  void incrementCounter() {
    counter = counter++;
  }

  void decrementCounter() {
    if (counter > 1) {
      counter = counter - 1;
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

  callback(String value) {
    busName.value = value;
  }

  Future<void> navigateAndShowStation(BuildContext context) async {
    // final stationName = await Navigator.pushNamed(context, '/station',
    // arguments: Name(first: "John", last: "pista"));
    // if (!mounted) return;
    // if (stationName != null) stationName = '$stationName';
    // ScaffoldMessenger.of(context)
    //   ..removeCurrentSnackBar()
    //   ..showSnackBar(SnackBar(content: Text('$')));
  }
}
