import 'package:get/get.dart';
import 'package:zidio_real_time_chat_flutter_app/Screen/Auth/authScreen.dart';
import 'package:zidio_real_time_chat_flutter_app/Screen/ContactScreen/contactScreen.dart';
import 'package:zidio_real_time_chat_flutter_app/Screen/Home/homeScreen.dart';
import 'package:zidio_real_time_chat_flutter_app/Screen/ProfileScreen/ProfileScreen.dart';
import 'package:zidio_real_time_chat_flutter_app/Screen/UserProfileScreen/updateProfileScreen.dart';

var routes = [
  GetPage(
    name: "/authPage",
    page: () => const AuthScreen(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/homePage",
    page: () => const HomeScreen(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/profilePage",
    page: () => const ProfileScreen(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/contactPage",
    page: () => const ContactScreen(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: "/updateProfilePage",
    page: () => const UserUpdateProfile(),
    transition: Transition.rightToLeft,
  ),
];
