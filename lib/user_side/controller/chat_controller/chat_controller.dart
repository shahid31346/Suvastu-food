import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final TextEditingController messageTextController = TextEditingController();
  late FocusNode focusNode;
  RxBool isVoiceRecording = false.obs;
  late ScrollController scrollController;
  var isShowEmoji = false.obs;

  @override
  void onInit() {
    scrollController = ScrollController();
    focusNode = FocusNode();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        isShowEmoji.value = false;
      }
    });
    super.onInit();
  }
}
