import 'package:demo_flu/services/data/provider/my_api_provider.dart';

class AuthenApi {
  loginApi() async {
    final res = await MyApiProvide().post('authentication/login',
        {'phone': '08422222222', 'password': '11111111'});
    print('AuthenApi: $res');
    return res;
  }
}
