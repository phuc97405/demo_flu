import 'package:demo_flu/services/data/provider/api_provider.dart';
import 'package:demo_flu/services/data/model/req_login_model.dart';
import 'package:demo_flu/models/User.dart';

class Repository {
  final MyApiProvide myApiProvider;
  Repository(this.myApiProvider);

  Future<User> login(ReqLoginModel param) async {
    final res = await myApiProvider.post<User, ReqLoginModel>(
        '/authentication/login', param);
    print('User$res');
    return userFromJson(res.toString());
  }
}
