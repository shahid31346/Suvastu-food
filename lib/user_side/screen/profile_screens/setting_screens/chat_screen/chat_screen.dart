import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
  final ValueNotifier<bool> galleryToggle = ValueNotifier(false);

  final List<Message> messages = [
    Message(
        content:
            "Hello !Hel industs been the industry's standard dummy text ever since ry's sello!",
        isSent: true,
        messageType: MessageType.text),
    Message(
        content:
            "I'm doing welhas been the industry's s been the industry's standard dummy text ever since standard dl too!",
        isSent: true,
        messageType: MessageType.voice),
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
        content: "I'm doing welhas been the industry's standard dl too!",
        isSent: true,
        messageType: MessageType.voice),
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
        content: "I'm doing welhas been the industry's standard dl too!",
        isSent: true,
        messageType: MessageType.voice),
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
  final appData = GetStorage();

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
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return message.messageType == MessageType.voice &&
                            message.isSent == true
                        ? Row(
                            mainAxisAlignment: appData.read('language') == 'ur'
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    right: 16.0, left: 16.0, top: 5, bottom: 5),
                                child: SizedBox(
                                  child: VoiceMessageView(
                                    circlesTextStyle: TextStyle(
                                        color: kBlackColor, fontSize: 10),
                                    counterTextStyle:
                                        TextStyle(color: kWhite, fontSize: 12),
                                    size: 23,
                                    cornerRadius: 14,
                                    innerPadding: 10,
                                    playIcon: Icon(
                                      Icons.play_arrow,
                                      size: 22,
                                      color: kBlackColor,
                                    ),
                                    circlesColor: kWhite,
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
                                mainAxisAlignment:
                                    appData.read('language') == 'ur'
                                        ? MainAxisAlignment.start
                                        : MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: 16.0,
                                        left: 16.0,
                                        top: 5,
                                        bottom: 5),
                                    child: SizedBox(
                                      child: VoiceMessageView(
                                        circlesTextStyle: TextStyle(
                                            color: kWhite, fontSize: 10),
                                        counterTextStyle: TextStyle(
                                            color: kWhite, fontSize: 12),
                                        size: 23,
                                        cornerRadius: 14,
                                        innerPadding: 8,
                                        playIcon: Icon(
                                          Icons.play_arrow,
                                          size: 22,
                                          color: kWhite,
                                        ),
                                        circlesColor: kGrey.withOpacity(0.8),
                                        activeSliderColor: kWhite,
                                        notActiveSliderColor:
                                            Colors.transparent,
                                        backgroundColor:
                                            kGrey.withOpacity(0.27),
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
                                : ReceivedMessageScreen(
                                    message: message.content);
                  },
                ),
              ),
              ValueListenableBuilder<bool>(
                valueListenable: galleryToggle,
                builder: (context, isGalleryOpen, child) {
                  return Column(
                    children: [
                      ValueListenableBuilder(
                        valueListenable: chatController.messageTextController,
                        builder: (context, value, child) {
                          final text = value.text;
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 10),
                            child: TextFormField(
                              controller: chatController.messageTextController,
                              focusNode: chatController.focusNode,
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
                                  ),
                                  onPressed: () {
                                    galleryToggle.value = !galleryToggle.value;
                                  },
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey[300]!, width: 0.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: kPrimary, width: 0.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                fillColor: kWhite,
                                filled: true,
                                isDense: true,
                                hintText: "Type message...",
                                border: InputBorder.none,
                                hintStyle:
                                    TextStyle(color: kGrey, fontSize: 14),
                                suffixIcon: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  child: text.isEmpty
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Obx(() {
                                              return GestureDetector(
                                                child: Icon(
                                                  Icons.mic,
                                                  size: 27,
                                                  color: chatController
                                                          .isVoiceRecording
                                                          .value
                                                      ? Colors.red
                                                      : kPrimary,
                                                ),
                                                onLongPress: () async {
                                                  print("Recording started");
                                                },
                                                onLongPressEnd: (details) {
                                                  print("Recording stopped");
                                                },
                                              );
                                            }),
                                          ],
                                        )
                                      : IconButton(
                                          icon: const Icon(
                                            Icons.send_outlined,
                                            size: 27,
                                          ),
                                          onPressed: () {
                                            print("Message sent");
                                          },
                                        ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          Positioned(
            bottom: 70,
            left: 0,
            right: 0,
            child: ValueListenableBuilder<bool>(
              valueListenable: galleryToggle,
              builder: (context, isGalleryOpen, child) {
                return isGalleryOpen
                    ? Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: mQ.width * 0.23),
                        child: Container(
                          decoration: BoxDecoration(
                              color: kWhite.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(14)),
                          child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 1),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton.icon(
                                    iconAlignment: IconAlignment.start,
                                    icon: Icon(
                                      Iconsax.camera,
                                      size: 20,
                                    ),
                                    onPressed: () {},
                                    label: Text(
                                      'Camera',
                                      style: TextStyle(color: kBlackColor),
                                    ),
                                  ),
                                  SizedBox(
                                    width: mQ.width * 0.03,
                                  ),
                                  TextButton.icon(
                                    iconAlignment: IconAlignment.start,
                                    icon: Icon(
                                      Iconsax.gallery,
                                      size: 20,
                                    ),
                                    onPressed: () {},
                                    label: Text(
                                      'Gallery',
                                      style: TextStyle(color: kBlackColor),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      )
                    : SizedBox.shrink();
              },
            ),
          ),
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
