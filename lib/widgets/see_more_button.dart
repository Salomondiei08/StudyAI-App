import 'package:flutter/material.dart';

import '../screens/recommandation_screen.dart';
import '../utils/constants.dart';

class SeeMoreButton extends StatelessWidget {
  const SeeMoreButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => const RecommandationScreen(),
        ),
      ),
      child: Text(
        'see more',
        style: kDisplaySeeMore,
      ),
    );
  }
}
