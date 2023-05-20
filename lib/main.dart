import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import 'screens/main_screen.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://jxcepgjmtgcwrduaroue.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp4Y2VwZ2ptdGdjd3JkdWFyb3VlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODQxNTY3ODgsImV4cCI6MTk5OTczMjc4OH0.Tch_jQBKSsuLbxiBoXGX-7iJEaq3faxrFZksowlUAfE",
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation,screentype) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Study-AI",
          theme: ThemeData(textTheme: AppTheme.lightTexTheme),
          home: const Scaffold(
            body: MainScreen(),
          ),
        );
      }
    );
  }
}
