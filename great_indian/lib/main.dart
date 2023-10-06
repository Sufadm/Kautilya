import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:great_indian/controller/loading.dart';
import 'package:great_indian/firebase_options.dart';
import 'package:great_indian/view/screens/otp_login_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoadingProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: OtpScreen(),
      ),
    );
  }
}
