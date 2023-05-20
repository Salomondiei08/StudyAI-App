import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FlashCardScreen extends StatefulWidget {
  const FlashCardScreen({super.key});

  @override
  State<FlashCardScreen> createState() => _FlashCardScreenState();
}

class _FlashCardScreenState extends State<FlashCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.ligthGray,
      appBar: AppBar(
        title: Text(
          "Flash Card",
          style: kDisplayH1,
        ),
        elevation: 0,
        backgroundColor: AppTheme.ligthGray,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          const FlashCardSet(icon: Icons.add_circle_outline,cardName: "New Flashcard", type: "add",),
          const FlashCardSet(icon: Icons.add_circle_outline,cardName: "Biologie",),
          const FlashCardSet(icon: Icons.add_circle_outline,cardName: "Open AI",),
        ],
      ),
    );
  }
}

class FlashCardSet extends StatelessWidget {
  const FlashCardSet({
    super.key,required this.cardName, required this.icon, this.type
  });

  final IconData icon;
  final String cardName;
  final String? type; 

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: type == "add" ? const Color(0xFF4960F7) : Colors.grey,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1, 4),
              blurRadius: 2,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Icon(
                type == "add" ? Icons.add_circle_outline : Icons.library_books_outlined,
                size: 33.sp,
                color: type == "add" ? Colors.white : Colors.black45 ,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              cardName,
              style: kDisplayCardH6.copyWith(
                  color: Colors.white, fontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }
}
