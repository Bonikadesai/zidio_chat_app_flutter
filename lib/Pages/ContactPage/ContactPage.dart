import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zidio_real_time_chat_flutter_app/common/text_style.dart';
import 'package:zidio_real_time_chat_flutter_app/utils/color_res.dart';

import '../../Config/Images.dart';
import '../../Controller/ChatController.dart';
import '../../Controller/ContactController.dart';
import '../../Controller/ProfileController.dart';
import '../Chat/ChatPage.dart';
import '../Groups/NewGroup/NewGroup.dart';
import '../Home/Widget/ChatTile.dart';
import 'Widgets/ConactSearch.dart';
import 'Widgets/NewContatcTile.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isSearchEnable = false.obs;
    ContactController contactController = Get.put(ContactController());
    ProfileController profileController = Get.put(ProfileController());
    ChatController chatController = Get.put(ChatController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Select contact"),
        backgroundColor: colorRes.blue,
        foregroundColor: Colors.white,
        actions: [
          Obx(
            () => IconButton(
              onPressed: () {
                isSearchEnable.value = !isSearchEnable.value;
              },
              icon:
                  isSearchEnable.value ? Icon(Icons.close) : Icon(Icons.search),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Obx(
              () => isSearchEnable.value ? ContactSearch() : SizedBox(),
            ),
            //  SizedBox(height: 10),
            // NewContactTile(
            //   btnName: "New contact",
            //   icon: Icons.person_add,
            //   ontap: () {},
            // ),
            SizedBox(height: 10),
            NewContactTile(
              btnName: "New Group",
              icon: Icons.group_add,
              ontap: () {
                Get.to(NewGroup());
              },
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Text(
                  "Contacts on Chatterly",
                  style: rubikMedium(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 10),
            Obx(
              () => Column(
                children: contactController.userList
                    .map(
                      (e) => InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Get.to(ChatPage(userModel: e));
                        },
                        child: ChatTile(
                          imageUrl:
                              e.profileImage ?? AssetsImage.defaultProfileUrl,
                          name: e.name ?? "User",
                          lastChat: e.about ?? "Hey there",
                          lastTime: e.email ==
                                  profileController.currentUser.value.email
                              ? "You"
                              : "",
                        ),
                      ),
                    )
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
