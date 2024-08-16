import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tmdb_task/app/moduils/bottom%20nav/views/bottom_nav_screen.dart';

class AuthController extends GetxController {
  var tokenid = ''.obs;
  final apiKey = '52382e42442992bd5f0045d50a66a584';

  @override
  void onInit() {
    super.onInit();
    checkRegister();
  }

//CHECK-REGISTATION
  checkRegister() async {
    final prefs = await SharedPreferences.getInstance();
    final savetoken = prefs.getString('token');
    if (savetoken != null) {
      Get.offAll(() => BottomNavScreen());
    }
  }

  //REGISTATION WITH TOKEN
  Register(String token) async {
    final url =
        'https://api.themoviedb.org/3/account?api_key=$apiKey&session_id=$token';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        this.tokenid.value = token;
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);
        Get.offAll(() => BottomNavScreen());
      } else {
        Fluttertoast.showToast(msg: "Something Wrong");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Something Wrong");
    }
  }

  clearSession() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    tokenid.value = '';
  }
}
