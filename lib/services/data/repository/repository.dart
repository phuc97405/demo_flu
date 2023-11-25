import 'package:demo_flu/models/User.dart';
import 'package:demo_flu/services/data/provider/api_provider.dart';
import 'package:demo_flu/services/data/model/req_login_model.dart';

class Repository {
  final MyApiProvide myApiProvider;
  Repository(this.myApiProvider);
  Future<User> login(ReqLoginModel param) {
    final res = myApiProvider.post('authentication/login', param);
    return res;
  }
}
