import 'package:flutter/material.dart';
import 'package:study_ai/screens/main_screen.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

const String supabaseUrl = "https://jxcepgjmtgcwrduaroue.supabase.co";
const String token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp4Y2VwZ2ptdGdjd3JkdWFyb3VlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODQxNTY3ODgsImV4cCI6MTk5OTczMjc4OH0.Tch_jQBKSsuLbxiBoXGX-7iJEaq3faxrFZksowlUAfE";

class SupabaseManager {
  final client = SupabaseClient(supabaseUrl, token);

  Future<User?> signInUser(context, {String? email, String? password}) async {
    debugPrint("email:$email password:$password");

    try {
      final result = await client.auth
          .signInWithPassword(email: email!, password: password!);
      debugPrint(result.user!.toJson().toString());

      if (result.user == null) {
        throw Exception();
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => const MainScreen()));
        return result.user;
      }
    } on AuthException catch (error) {
      context.showErrorSnackBar(message: error.message);
    } catch (error) {
      context.showErrorSnackBar(message: 'Unexpected error occurred');
    }
    return null;
  }

  Future<User?> signUpUser(context, {String? email, String? password}) async {
    debugPrint("email:$email password:$password");

    try {
      final result = await client.auth
          .signInWithPassword(email: email!, password: password!);

      debugPrint(result.user!.toJson().toString());
      if (result.user == null) {
        throw Exception();
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => const MainScreen()));
        return result.user;
      }
    } on AuthException catch (error) {
      context.showErrorSnackBar(message: error.message);
    } catch (error) {
      context.showErrorSnackBar(message: 'Unexpected error occurred');
    }
    return null;
  }

  Future<void> logout(context) async {
    await client.auth.signOut();
    Navigator.pushReplacementNamed(context, 'login');
  }
}
