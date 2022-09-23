import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:open_auth/pages/google_sign_in.dart';
import 'package:open_auth/pages/navigaton_second_page.dart';
import 'package:provider/provider.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //calling chnageNotifierlistner  so that our Ui update on user sigin

    return ChangeNotifierProvider(
      create: (context)=>GoogleSignInProvider(),
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}




class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: ElevatedButton(
          child: Text("Google"),

          onPressed: ()
          {
            //on button clicked we will call first the provider
            final provider=Provider.of<GoogleSignInProvider>(context,listen: false);
//actually here we are using the function made in other class so
            provider.googleLogin();

          },
        ),
      ),
    );
  }
}






















