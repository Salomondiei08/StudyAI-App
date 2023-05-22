import 'package:flutter/material.dart';
import 'package:study_ai/network/supa_base_client.dart';
import 'package:study_ai/screens/login_screen.dart';
import 'package:study_ai/screens/main_screen.dart';
import 'package:study_ai/theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _redirectCalled = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _redirect();
  }

  Future<void> _redirect() async {
    await Future.delayed(Duration.zero);
    if (_redirectCalled || !mounted) {
      return;
    }

    _redirectCalled = true;
    final session = client.auth.currentSession;
    if (session != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx) => const MainScreen()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx) => const LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CircularProgressIndicator(
        color: AppTheme.darkBlue,
      )),
    );
  }
}
