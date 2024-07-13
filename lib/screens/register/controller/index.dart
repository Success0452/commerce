import 'dart:convert';
import 'dart:io';

import 'package:commerce/screens/login/index.dart';
import 'package:commerce/services/server.dart';
import 'package:commerce/util/toast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController {
  // variable declarations
  var isLoading = false.obs;
  File? imagePicked;
  var location = ''.obs;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imagePicked = File(image.path);
      uploadAvatar(image.path);
    } else {
      showCustomToast(message: 'No image selected.');
    }
  }

  // registration function
  Future<void> register(
      {required String email,
      required String password,
      required String name,
      String? avatar}) async {
    if (email.isEmpty || password.isEmpty || name.isEmpty) {
      showCustomToast(message: 'all parameters are required');
      return;
    }
    try {
      isLoading.value = true;
      //check whether user are already registered
      var verify = await checkAlreadyRegistered(email);
      if (verify) {
        isLoading.value = false;
        showCustomToast(message: 'email already a user');
        return;
      }
      var body = {
        'email': email,
        'password': password,
        'name': name,
        'avatar': avatar ?? 'https://i.imgur.com/yhW6Yw1.jpg'
      };
      var response = await postWTRequest('users', body);
      final json = jsonDecode(response.body);
      if (response.statusCode == 201) {
        showCustomToast(message: 'registration successful');
        Get.off(const LoginScreen());
      } else {
        showCustomToast(message: json['message']);
      }
      isLoading.value = false;
    } catch (e) {
      showCustomToast(message: 'server error, try again later');
      isLoading.value = false;
    }
  }

  // function to check whether user is already registered
  checkAlreadyRegistered(String email) async {
    var body = {'email': email};
    var response = await postWTRequest('users/is-available', body);
    final json = jsonDecode(response.body);
    if (response.statusCode == 201) {
      return json['isAvailable'];
    }
  }

  uploadAvatar(String filePath) async {
    if (filePath.isEmpty) {
      Get.snackbar('info', 'filepath is required');
      return;
    }
    isLoading.value = true;
    try {
      var response = await uploadFileRequest('files/upload', filePath, 'file');
      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        location.value = json['location'];
        showCustomToast(message: 'upload successful');
      }
      isLoading.value = false;
      return;
    } catch (e) {
      showCustomToast(message: 'server error, try again later');
      isLoading.value = false;
    }
  }
}
