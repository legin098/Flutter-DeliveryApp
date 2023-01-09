import 'package:delivery_app/src/environment/environment.dart';
import 'package:delivery_app/src/models/user.dart';
import 'package:get/get.dart';

class UserProvider extends GetConnect {
  String url = '${Environment.API_URL}api/users';

  Future<Response> create(User user) async {
    Response response = await post('$url/create', user.toJson(),
        headers: {'Content-type': 'application/json'});

    return response;
  }
}
