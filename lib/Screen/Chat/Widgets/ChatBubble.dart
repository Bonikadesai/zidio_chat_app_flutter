import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zidio_real_time_chat_flutter_app/common/text_style.dart';
import 'package:zidio_real_time_chat_flutter_app/utils/color_res.dart';

import '../../../utils/assets_res.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isComming;
  final String time;
  final String status;
  final String imageUrl;
  const ChatBubble(
      {super.key,
      required this.message,
      required this.isComming,
      required this.time,
      required this.status,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment:
            isComming ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Container(
              padding: EdgeInsets.all(10),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width / 1.3,
              ),
              decoration: BoxDecoration(
                color: isComming
                    ? Colors.grey.shade200
                    : colorRes.blue.withOpacity(0.3),
                borderRadius: isComming
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(10),
                      )
                    : const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(0),
                      ),
              ),
              child: imageUrl == ""
                  ? Text(message)
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            imageUrl: imageUrl,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        message == "" ? Container() : SizedBox(height: 10),
                        message == "" ? Container() : Text(message),
                      ],
                    )),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment:
                isComming ? MainAxisAlignment.start : MainAxisAlignment.end,
            children: [
              isComming
                  ? Text(
                      time,
                      style: rubikMedium(
                          fontSize: 12, fontWeight: FontWeight.w500),
                    )
                  : Row(
                      children: [
                        Text(
                          time,
                          style: rubikMedium(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(width: 10),
                        SvgPicture.asset(
                          assetsRes.chatStatusSvg,
                          color: status == "read" ? colorRes.blue : Colors.grey,
                          width: 20,
                        )
                      ],
                    ),
            ],
          )
        ],
      ),
    );
  }
}
