import 'package:chat_app/view/screen/message_screen/message.dart';
import 'package:get/get.dart';

import '../view/screen/home/home.dart';
import '../view/screen/login/login.dart';
import '../view/screen/register/register.dart';

class Routes {
  static const String login = '/';
  static const String register = '/register';
  static const String home = '/home';
  static const String chat = '/chat';

  static final List<GetPage> routes = [
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: register, page: () => RegisterScreen()),
    GetPage(name: home, page: () => Home()),
    GetPage(name: chat, page: () => Chat()),
  ];
}
