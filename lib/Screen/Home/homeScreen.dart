import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zidio_real_time_chat_flutter_app/Screen/Auth/controller/authController.dart';
import 'package:zidio_real_time_chat_flutter_app/Screen/ProfileScreen/ProfileScreen.dart';
import 'package:zidio_real_time_chat_flutter_app/utils/color_res.dart';
import 'package:zidio_real_time_chat_flutter_app/utils/string_res.dart';

import '../Auth/Helper/auth_helper.dart';
import '../CallHistory/CallHistory.dart';
import '../CallScreen/controller/callController.dart';
import '../Chat/controller/StatusController.dart';
import '../ContactScreen/controller/contactController.dart';
import '../Groups/groupsScreen.dart';
import '../ProfileScreen/controller/ImagePicker.dart';
import '../ProfileScreen/controller/profileController.dart';
import 'Widget/ChatsList.dart';
import 'Widget/TabBar.dart';
import 'controller/AppConntroller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
    ProfileController profileController = Get.put(ProfileController());
    ContactController contactController = Get.put(ContactController());
    ImagePickerController imagePickerController =
        Get.put(ImagePickerController());
    StatusController statusController = Get.put(StatusController());
    CallController callController = Get.put(CallController());
    AppController appController = Get.put(AppController());
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorRes.blue,
        foregroundColor: Colors.white,
        title: const Text(
          stringRes.appName,
        ),
        toolbarHeight: 100,
        actions: [
          IconButton(
            onPressed: () {
              appController.checkLatestVersion();
            },
            icon: Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                      title: const Text("Are You Sure?"),
                      content: const Text("Do you want to logout?"),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            AuthHelper.authHelper
                                .logoutUser(); // Sign out the user
                          },
                          child: const Text("Yes"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.to(HomeScreen()); // Close the dialog
                          },
                          child: const Text("No"),
                        ),
                      ]);
                },
              );
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      bottomNavigationBar: myTabBar(tabController, context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/contactPage");
        },
        foregroundColor: Colors.white,
        backgroundColor: colorRes.blue,
        shape: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30)),
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: TabBarView(
          controller: tabController,
          children: [
            ChatList(),
            GroupScreen(),
            CallHistory(),
            ProfileScreen(),
          ],
        ),
      ),
    );
  }
}
