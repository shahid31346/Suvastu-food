import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:suvastufood/global/auth_textfield.dart';
import 'package:suvastufood/user_side/controller/chat_controller/chat_controller.dart';
import 'package:suvastufood/user_side/screen/profile_screens/setting_screens/chat_screen/recieved_message.dart';
import 'package:suvastufood/user_side/screen/profile_screens/setting_screens/chat_screen/send_message.dart';
import 'package:suvastufood/utils/const.dart';
import 'package:voice_message_package/voice_message_package.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatController chatController = Get.put(ChatController());

  final List<Message> messages = [
    Message(
        content: "Hello !Hel industry's sello!",
        isSent: true,
        messageType: MessageType.text),
    Message(
        content: "Hi ther Hello!e!",
        isSent: false,
        messageType: MessageType.text),
    Message(
        content: "How areHello!  you?",
        isSent: false,
        messageType: MessageType.voice),
    Message(
        content:
            "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, Lorm has been  !",
        isSent: false,
        messageType: MessageType.text),
    Message(
        content:
            "What aboutem Ipsum ummy text ever since the 1500s,Lorem Ipsu you?",
        isSent: false,
        messageType: MessageType.text),
    Message(
        content: "I'm doing welhas been the industry's standard dl too!",
        isSent: true,
        messageType: MessageType.voice),
    Message(
        content: "Hello !Hel industry's sello!",
        isSent: true,
        messageType: MessageType.text),
    Message(
        content: "Hello !Hel industry's sello!",
        isSent: true,
        messageType: MessageType.text),
  ];

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        backgroundColor: kBgColor,
        centerTitle: true,
        title: Text(
          'Chat'.tr,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return message.messageType == MessageType.voice &&
                        message.isSent == true
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                right: 16.0, left: 16.0, top: 5, bottom: 5),
                            child: SizedBox(
                              child: VoiceMessageView(
                                size: 23,
                                cornerRadius: 14,
                                innerPadding: 10,
                                circlesColor: kSecondaryColor,
                                activeSliderColor: kWhite,
                                notActiveSliderColor: Colors.transparent,
                                backgroundColor: kPrimary,
                                controller: VoiceController(
                                  audioSrc: message.content,
                                  maxDuration: Duration(minutes: 1),
                                  onComplete: () {
                                    /// do something on complete
                                  },
                                  onPause: () {
                                    /// do something on pause
                                  },
                                  onPlaying: () {
                                    /// do something on playing
                                  },
                                  onError: (err) {
                                    /// do somethin on error
                                  },
                                  isFile: false,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : message.messageType == MessageType.voice &&
                            message.isSent == false
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    right: 16.0, left: 16.0, top: 5, bottom: 5),
                                child: SizedBox(
                                  child: VoiceMessageView(
                                    size: 23,
                                    cornerRadius: 14,
                                    innerPadding: 8,
                                    circlesColor: kSecondaryColor,
                                    activeSliderColor: kWhite,
                                    notActiveSliderColor: Colors.transparent,
                                    backgroundColor: kGrey.withOpacity(0.27),
                                    controller: VoiceController(
                                      audioSrc: message.content,
                                      maxDuration: Duration(minutes: 1),
                                      onComplete: () {
                                        /// do something on complete
                                      },
                                      onPause: () {
                                        /// do something on pause
                                      },
                                      onPlaying: () {
                                        /// do something on playing
                                      },
                                      onError: (err) {
                                        /// do somethin on error
                                      },
                                      isFile: false,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : message.isSent
                            ? SentMessageScreen(message: message.content)
                            : ReceivedMessageScreen(message: message.content);
              },
            ),
          ),
          ValueListenableBuilder(
            valueListenable: chatController.messageTextController,
            builder: (context, value, child) {
              final text = value.text;
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                child: TextFormField(
                  controller: chatController.messageTextController,
                  focusNode: chatController.focusNode,
                  // uncomment to set max length
                  // maxLength: 1000,
                  maxLines: 4,
                  minLines: 1,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.3),
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Iconsax.gallery,
                        size: 20,

                        // color: foregroundColor,
                      ),
                      onPressed: () {},
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey[300]!, width: 0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimary, width: 0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: kWhite,
                    filled: true,
                    isDense: true,
                    hintText: "Type message...",
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.white54),
                    suffixIcon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: text.isEmpty
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Obx(() {
                                  return GestureDetector(
                                    child: Icon(
                                      Icons.mic,
                                      size: 27,
                                      color:
                                          chatController.isVoiceRecording.value
                                              ? Colors.red
                                              : kPrimary,
                                    ),
                                    onLongPress: () async {
                                      // var audioPlayer = AudioPlayer();
                                      // await audioPlayer
                                      //     .play(AssetSource("Notification.mp3"));
                                      // audioPlayer.onPlayerComplete.listen((a) {
                                      //   chatController.start.value =
                                      //       DateTime.now();
                                      print("okayasdsdasdasdasdsad");
                                      // chatController.startRecord();
                                      // chatController.isRecording.value = true;
                                      // });
                                    },
                                    onLongPressEnd: (details) {
                                      // chatController.stopRecord(
                                      //   firebaseAuth.currentUser!.email!,
                                      //   widget.userEmail,
                                      // );
                                    },
                                  );
                                }),
                              ],
                            )
                          : IconButton(
                              icon: const Icon(
                                Icons.send_outlined,
                                size: 27,

                                // color: foregroundColor,
                              ),
                              onPressed: () {
                                print(
                                  "userEmail",
                                );

                                print(
                                  "userEtmail",
                                );
                              },
                            ),
                    ),
                  ),
                ),
              );
            },
          )
          // Padding(
          //   padding: const EdgeInsets.all(14.0),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: AuthTextField(
          //           prefixIcon: Icons.message_outlined,
          //           controller: _controller,
          //           inputType: TextInputType.name,
          //           hintText: 'Type a message'.tr,
          //           autofillHints: const [AutofillHints.email],
          //         ),
          //       ),
          //       IconButton(
          //         icon: Icon(
          //           CupertinoIcons.arrow_right_circle_fill,
          //           size: 30,
          //           color: kPrimary,
          //         ),
          //         onPressed: () {
          //           // Add logic to send a message
          //           // For now, clear the text field
          //           _controller.clear();
          //         },
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}

class Message {
  final String content;
  final bool isSent;
  final MessageType messageType;

  Message(
      {required this.content, required this.isSent, required this.messageType});
}

enum MessageType {
  text,
  voice,
}
