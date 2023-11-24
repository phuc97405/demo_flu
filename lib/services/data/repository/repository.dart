import 'package:demo_flu/services/data/model/token_model.dart';
import 'package:demo_flu/services/data/provider/my_api_provider.dart';

class Repository {
  final MyApiProvide myApiProvider;
  Repository(this.myApiProvider);

  Future<TokenModel> login(Map<String, dynamic> map) =>
      myApiProvider.login(map);

  // Future<UserModel> getProfile() => myApiProvider.getProfile();
}
