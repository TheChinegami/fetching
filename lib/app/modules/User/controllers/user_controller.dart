import 'dart:convert';

import 'package:fetchingtwo/app/modules/User/model/User.model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserController extends GetxController {
  final users = <User>[].obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  Future<void> fetchUsers() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

      if (response.statusCode == 200) {
        print(response
            .body); // this is where I check if the response actually returns anything and it does !!
        final List<dynamic> jsonList = json.decode(response.body);
        users.value = jsonList.map((json) => User.fromJson(json)).toList();
      } else {
        // Handle error response
      }
    } catch (e) {
      // Handle error
    }
  }
}
