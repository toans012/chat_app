import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatapp/constants/colors.dart';
import 'package:chatapp/models/message_model.dart';
import 'package:flutter/material.dart';

import 'formate_date.dart';

class ChatMessage extends StatefulWidget {
  final MessageModel msg;
  final String currentUser;
  final bool isImage;

  const ChatMessage(
      {super.key,
      required this.msg,
      required this.currentUser,
      required this.isImage});

  @override
  State<ChatMessage> createState() => _ChatMessageState();
}

class _ChatMessageState extends State<ChatMessage> {
  @override
  Widget build(BuildContext context) {
    return widget.isImage
        ? Container(
            child: Row(
              mainAxisAlignment: widget.msg.sender == widget.currentUser
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: widget.msg.sender == widget.currentUser
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                            imageUrl:
                                'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.com%2Fhungthanh82%2Fanhr%2F&psig=AOvVaw2MZdJjHWxz5n0XuN1TlDiF&ust=1727493964656000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCMi92NKW4ogDFQAAAAAdAAAAABAE',
                            height: 200,
                            width: 200),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            formatDate(widget.msg.timestamp),
                            style: TextStyle(
                                fontSize: 12,
                                color:
                                Theme.of(context).colorScheme.outline),
                          ),
                        ),
                        widget.msg.sender == widget.currentUser
                            ? widget.msg.isSeenByReceiver
                            ? const Icon(
                          Icons.check_circle_outlined,
                          size: 16,
                          color: kPrimaryColor,
                        )
                            : const Icon(
                          Icons.check_circle_outlined,
                          size: 16,
                          color: Colors.grey,
                        )
                            : const SizedBox()
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        : Container(
            padding: const EdgeInsets.all(4),
            child: Row(
              mainAxisAlignment: widget.msg.sender == widget.currentUser
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: widget.msg.sender == widget.currentUser
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.75),
                          decoration: BoxDecoration(
                              color: widget.msg.sender == widget.currentUser
                                  ? kPrimaryColor
                                  : kSecondaryColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft:
                                      widget.msg.sender == widget.currentUser
                                          ? const Radius.circular(20)
                                          : const Radius.circular(2),
                                  bottomRight:
                                      widget.msg.sender == widget.currentUser
                                          ? const Radius.circular(2)
                                          : const Radius.circular(20),
                                  topLeft: const Radius.circular(20),
                                  topRight: const Radius.circular(20))),
                          child: Text(
                            widget.msg.message,
                            style: TextStyle(
                                color: widget.msg.sender == widget.currentUser
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          child: Text(
                            formatDate(widget.msg.timestamp),
                            style: TextStyle(
                                fontSize: 12,
                                color:
                                Theme.of(context).colorScheme.outline),
                          ),
                        ),
                        widget.msg.sender == widget.currentUser
                            ? widget.msg.isSeenByReceiver
                            ? const Icon(
                          Icons.check_circle_outlined,
                          size: 16,
                          color: kPrimaryColor,
                        )
                            : const Icon(
                          Icons.check_circle_outlined,
                          size: 16,
                          color: Colors.grey,
                        )
                            : const SizedBox()
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
  }
}
