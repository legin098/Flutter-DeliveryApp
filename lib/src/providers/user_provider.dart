import 'package:delivery_app/src/environment/environment.dart';
import 'package:delivery_app/src/models/response_api.dart';
import 'package:delivery_app/src/models/user.dart';
import 'package:get/get.dart';

class UserProvider extends GetConnect {
  String url = '${Environment.API_URL}api/users';

  Future<Response> create(User user) async {
    Response response = await post('$url/create', user.toJson(),
        headers: {'Content-type': 'application/json'});

    return response;
  }

  Future<ResponseApi> login(String email, String password) async {
    Response response = await post(
        '$url/login', {"email": email, "password": password},
        headers: {'Content-type': 'application/json'});

    if (response.body == null) {
      Get.snackbar("Error", "The request could not be executed");
      return ResponseApi();
    }

    ResponseApi responseApi = ResponseApi.fromJson(response.body);

    return responseApi;
  }
}
