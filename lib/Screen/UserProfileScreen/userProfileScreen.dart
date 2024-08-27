import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zidio_real_time_chat_flutter_app/utils/color_res.dart';

import '../../utils/assets_res.dart';
import '../Auth/Helper/auth_helper.dart';
import '../Auth/controller/authController.dart';
import '../Chat/model/userModel.dart';
import '../ProfileScreen/controller/profileController.dart';
import 'Widgets/UserInfo.dart';

class UserProfileScreen extends StatelessWidget {
  final UserModel userModel;
  const UserProfileScreen({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    ProfileController profileController = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        toolbarHeight: 100,
        backgroundColor: colorRes.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed("/updateProfilePage");
            },
            icon: Icon(
              Icons.edit,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            LoginUserInfo(
              profileImage:
                  userModel.profileImage ?? assetsRes.defaultProfileUrl,
              userName: userModel.name ?? "User",
              userEmail: userModel.email ?? "",
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                AuthHelper.authHelper.logoutUser();
              },
              child: Text("Logout"),
            )
          ],
        ),
      ),
    );
  }
}
