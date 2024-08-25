import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/AnimationController.dart';
import '../../Controller/SplaceController.dart';
import '../../common/text_style.dart';
import '../../utils/assets_res.dart';
import '../../utils/color_res.dart';
import '../../utils/string_res.dart';

class SplacePage extends StatelessWidget {
  const SplacePage({super.key});

  @override
  Widget build(BuildContext context) {
    SplaceController splaceController = Get.put(SplaceController());
    final AnimationControllerGetx animationController =
        Get.put(AnimationControllerGetx());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: Get.height * 0.24,
              width: Get.width * 0.8,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(assetsRes.appLogo), fit: BoxFit.cover)),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GetBuilder<AnimationControllerGetx>(
            builder: (controller) {
              return ScaleTransition(
                scale: controller.animation,
                child: Text(
                  stringRes.appName,
                  style: josefinSansBold(
                    fontSize: 30,
                    color: colorRes.blue,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
