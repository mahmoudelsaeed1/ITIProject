import 'package:dio/dio.dart';
import 'package:iti_project/dio/model/storiesModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

String baseUrl = "http://159.89.4.181:2000/api/v1";

class ApiProvider {
  SuccessStoriesModel? successStories;
  Future<SuccessStoriesModel?> getStories() async {
    try {
      var response = await Dio().get("$baseUrl/success-stories");
      print(response.data);

      successStories = SuccessStoriesModel.fromJson(response.data);
      print(successStories?.model![0].title);
      return successStories;
    } catch (e) {
      print(e);
    }
  }

  loginUser({required String email, required String password}) async {
    try {
      FormData formData = FormData.fromMap({
        "email": email,
        "password": password,
      });
      Response response = await Dio().post("$baseUrl/auth/email/signin");
      print(response.data);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          'tokenUser', response.data["model"]["tokens"]["accessToken"]);
      final String? token = prefs.getString('tokenUser');
      print("***************");
      print(token);
    } catch (e) {
      if (e is DioException) {
        print(e.response?.data);
      }
    }
  }
}
