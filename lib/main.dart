import 'package:amazon_project/providers/user_details_provider.dart';
import 'package:amazon_project/splash.dart';
import 'package:amazon_project/utils/colors_themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAGlMfVLbUL8RqUdNXXIPS95SyMHhRTs2o",
            authDomain: "clone-1d9e2.firebaseapp.com",
            projectId: "clone-1d9e2",
            storageBucket: "clone-1d9e2.appspot.com",
            messagingSenderId: "780068311587",
            appId: "1:780068311587:web:6fb11ed732dd62518d5796"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserDetailsProvider())],
      child: MaterialApp(
        // title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: backgroundColor,
          ),
          home: const Splash()

        // StreamBuilder(
        //   stream: FirebaseAuth.instance.authStateChanges(),
        //   builder: (context, AsyncSnapshot<User?> user) {
        //     if (user.connectionState == ConnectionState.waiting) {
        //       return const Center(
        //         child: CircularProgressIndicator(
        //           color: Colors.orange,
        //         ),
        //       );
        //     } else if (user.hasData) {
        //       return const ScreenLayout();
        //     } else {
        //       return const SignInScreen();
        //     }
        //   },
        // )
      ),
    );
  }
}
