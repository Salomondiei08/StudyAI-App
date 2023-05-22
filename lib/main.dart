import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:study_ai/providers/articles_provider.dart';
import 'package:study_ai/providers/video_provider.dart';
import 'package:study_ai/screens/splash_screen.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';
import 'network/supa_base_client.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(url: supabaseUrl, anonKey: token);

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
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ArticleProvider(),
          ),
           ChangeNotifierProvider(
            create: (_) => VideoProvider(),
          ),
        ],
        builder: (context, widget) {
          return ResponsiveSizer(builder: (context, orientation, screentype) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Study-AI",
              theme: ThemeData(textTheme: AppTheme.lightTexTheme),
              home: const Scaffold(body: SplashScreen()),
            );
          });
        });
  }
}
