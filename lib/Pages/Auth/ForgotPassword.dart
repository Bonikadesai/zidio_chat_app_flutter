import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zidio_real_time_chat_flutter_app/common/text_style.dart';
import 'package:zidio_real_time_chat_flutter_app/utils/color_res.dart';

import '../../Controller/AuthController.dart';
import '../../Widget/PrimaryButton.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
        backgroundColor: colorRes.blue,
        foregroundColor: Colors.white,
        toolbarHeight: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter your email id and we will send you reset password link on email",
              textAlign: TextAlign.center,
              style: rubikRegular(fontSize: 16, color: colorRes.blue),
            ),
            const SizedBox(height: 40),
            TextFormField(
              controller: email,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "Enter Email id",
                hintStyle: rubikRegular(fontSize: 16, color: colorRes.grey),
              ),
            ),
            const SizedBox(height: 40),
            PrimaryButton(
              btnName: "Reset Now",
              icon: Icons.email_outlined,
              ontap: () {
                authController.resetPassword(email.text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
