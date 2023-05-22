import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../utils/constants.dart';

class FlascardItemsInput extends StatelessWidget {
  const FlascardItemsInput({
    super.key,
    required this.textController,
    required this.inputName,
  });

  final String inputName;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            inputName,
            style: kDisplayH1.copyWith(
              fontSize: 18.sp,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          TextField(
            textCapitalization: TextCapitalization.sentences,
            style: const TextStyle(color: Colors.white),
            controller: textController,
            decoration: InputDecoration(
              fillColor: const Color(0xff27354B),
              hintText: 'Type something here.....',
              hintStyle: kDisplayArticleH4.copyWith(
                  color: Colors.white, fontSize: 17.sp),
              filled: true,
              border: kChatInput,
              enabledBorder: kChatInput,
              errorBorder: InputBorder.none,
              disabledBorder: kChatInput,
              focusedBorder: kChatInput,
            ),
          )
        ],
      ),
    );
  }
}
