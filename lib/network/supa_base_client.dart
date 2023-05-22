import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:study_ai/screens/main_screen.dart';
import 'package:study_ai/screens/user_info_screen.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

const String supabaseUrl = "https://jxcepgjmtgcwrduaroue.supabase.co";
const String token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp4Y2VwZ2ptdGdjd3JkdWFyb3VlIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODQxNTY3ODgsImV4cCI6MTk5OTczMjc4OH0.Tch_jQBKSsuLbxiBoXGX-7iJEaq3faxrFZksowlUAfE";

final client = Supabase.instance.client;

class SupabaseManager {
  Future<User?> signInUser(context, {String? email, String? password}) async {
    debugPrint("email:$email password:$password");

    try {
      final result = await client.auth
          .signInWithPassword(email: email!, password: password!);
      debugPrint(result.user!.toJson().toString());

      if (result.user == null) {
        throw Exception();
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (ctx) => const MainScreen()));
        return result.user;
      }
    } on AuthException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.message),
        backgroundColor: Colors.red,
      ));
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
        backgroundColor: Colors.red,
      ));
    }
    return null;
  }

  Future<User?> signUpUser(context,
      {String? email, String? password, String? username}) async {
    debugPrint("email:$email password:$password");

    try {
      final result =
          await client.auth.signUp(email: email!, password: password!);

      debugPrint(result.user!.toJson().toString());
      if (result.user == null) {
        throw Exception();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Login successful'),
          backgroundColor: Colors.green,
        ));
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (ctx) => UserInfoScreen(name: username!)));
        return result.user;
      }
    } on AuthException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.message),
        backgroundColor: Colors.red,
      ));
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
        backgroundColor: Colors.red,
      ));
    }
    return null;
  }

  Future<void> signUpWithGoogle(context) async {
    Navigator.pushReplacementNamed(context, 'login');
  }

  Future<void> logout(context) async {
    try {
      await client.auth.signOut();
    } on AuthException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
        backgroundColor: Colors.red,
      ));
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
        backgroundColor: Colors.red,
      ));
    }
  }

  Future<void> saveData(context,
      {String? name,
      String? studyLevel,
      String? interests,
      String? profilePictureUrl}) async {
    debugPrint(client.auth.currentUser!.id);
    final userId = client.auth.currentUser!.id;

    final updates = {
      'name': name,
      'id': userId,
      'study_level': studyLevel,
      'interests': interests,
      'profile_picture_url': profilePictureUrl,
    };
    try {
      await client.from('profiles').upsert(updates);

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Update successful'),
        backgroundColor: Colors.green,
      ));
    } on PostgrestException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.message),
        backgroundColor: Colors.red,
      ));
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
        backgroundColor: Colors.black,
      ));
    }
  }

  Future<String?> uploadFile(context,
      {String? selectedFilePath, String? bucketName}) async {
    try {
      XFile selectedFile = XFile(selectedFilePath!);
      final bytes = await selectedFile.readAsBytes();
      final fileExt = selectedFile.path.split('.').last;
      final fileName = '${DateTime.now().toIso8601String()}.$fileExt';
      final filePath = fileName;
      await client.storage.from(bucketName!).uploadBinary(
            selectedFile.name,
            bytes,
            fileOptions: FileOptions(contentType: selectedFile.mimeType),
          );

      final imageUrlResponse = await client.storage
          .from(bucketName)
          .createSignedUrl(selectedFile.name, 60 * 60 * 24 * 365 * 10);

      debugPrint("Image link $imageUrlResponse");

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Upload successful'),
        backgroundColor: Colors.green,
      ));
      return imageUrlResponse;
    } on StorageException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.message),
        backgroundColor: Colors.red,
      ));
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(error.toString()),
        backgroundColor: Colors.red,
      ));
    }
    return null;
  }
}
