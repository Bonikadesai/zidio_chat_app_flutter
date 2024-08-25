import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zidio_real_time_chat_flutter_app/Controller/AuthController.dart';
import 'package:zidio_real_time_chat_flutter_app/Pages/Auth/Helper/auth_helper.dart';
import 'package:zidio_real_time_chat_flutter_app/Pages/CallHistory/CallHistory.dart';
import 'package:zidio_real_time_chat_flutter_app/utils/color_res.dart';

import '../../Config/Strings.dart';
import '../../Controller/AppConntroller.dart';
import '../../Controller/CallController.dart';
import '../../Controller/ContactController.dart';
import '../../Controller/ImagePicker.dart';
import '../../Controller/ProfileController.dart';
import '../../Controller/StatusController.dart';
import '../Groups/GroupsPage.dart';
import '../ProfilePage/ProfilePage.dart';
import 'Widget/ChatsList.dart';
import 'Widget/TabBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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
        title: Text(
          AppString.appName,
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
                            Get.to(HomePage()); // Close the dialog
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
            GroupPage(),
            CallHistory(),
            ProfilePage(),
          ],
        ),
      ),
    );
  }
}
