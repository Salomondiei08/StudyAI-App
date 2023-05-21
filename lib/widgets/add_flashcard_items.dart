import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:study_ai/theme/app_theme.dart';
import '../utils/constants.dart';
import 'add_card_textfield.dart';
import 'add_flashcard_items_textfield.dart';

class AddFlashcardScreen extends StatefulWidget {
  const AddFlashcardScreen({super.key});

  @override
  State<AddFlashcardScreen> createState() => _AddFlashcardScreenState();
}

class _AddFlashcardScreenState extends State<AddFlashcardScreen> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.ligthGray,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    'New Flashcard Set',
                    style: kDisplayH1,
                  ),
                ),
                const AddCardTextField(
                  labelText: 'Name',
                ),
                const AddCardTextField(
                  labelText: 'Description',
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25, bottom: 10),
                    child: Text(
                      'Cards Items',
                      style: kDisplayH1,
                    ),
                  ),
                ),
                FlascardItemsInput(
                  textController: textController,
                  inputName: 'Items',
                ),
                FlascardItemsInput(
                  textController: textController,
                  inputName: 'Definition',
                ),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: const Color(0xFF27354B),
                        width: 2.0,
                      ),
                    ),
                    height: 5.h,
                    width: 5.h,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_rounded,
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 6.h,
                          width: 15.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFF27354B),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Center(
                              child: Text(
                                'Annuler',
                                style: kDisplayArticleH1.copyWith(
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 6.h,
                          width: 15.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFF27354B),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Center(
                              child: Text(
                                'Save',
                                style: kDisplayArticleH1.copyWith(
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
