import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:presence/app/controllers/page_index_controller.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final pageC = Get.put(PageIndexController(), permanent: true);

  runApp(
    StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
          // Mengecek apabila new user sudah melakukan verif atau belum
          String initialRoute;
          if (snapshot.hasData && snapshot.data!.emailVerified) {
            initialRoute = Routes.HOME;
          } else {
            initialRoute = Routes.LOGIN;
          }
          print(snapshot.data);
          return GetMaterialApp(
            title: "Application",
            theme: ThemeData(
                primaryColor: Color.fromARGB(255, 7, 134, 64),
                primarySwatch:
                    Colors.green // Set the primary color using hex code
                // ... you can add other theme properties as needed
                ),
            initialRoute: initialRoute,
            getPages: AppPages.routes,
          );
        }),
  );
}
