import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:open_auth/pages/ui.dart';

//install all the packages as needed

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
}
