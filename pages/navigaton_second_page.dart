import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_auth/pages/google_sign_in.dart';
import 'package:open_auth/pages/ui.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(

        //this will detect the change in the user
        stream:FirebaseAuth.instance.authStateChanges() ,
        builder: (context,snapshot)
        {
          //we will handle the different state like islogging in or is logged out
          if(snapshot.connectionState==ConnectionState.waiting)
            {
              return Center(child: CircularProgressIndicator(),);

            }

          else if(snapshot.hasError)
          {
            return Center(child: Text("Something went wrong"),);
          }

          else if(snapshot.hasData)
            {
              return LoggedInWidget();
            }
          else {
            return SignUpWidget();
          }
        }
        ,
      ),
    );
  }
}














class LoggedInWidget extends StatelessWidget {
  const LoggedInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user =FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(title: Text("Logged In Successfully"),),


      body: Container(
        child:Column(
          children: [
            Text("User Profile"),
            SizedBox(height: 10,),

            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoURL!),
            ),

            // Row(
            //   children: [
            //     Text("Mobile Number"),
            //     SizedBox(width: 10,),
            //     Text(user.phoneNumber!),
            //   ],
            // ),
            // Row(
            //   children: [
            //     Text("Mobile Number"),
            //     SizedBox(width: 10,),
            //     Text(user.phoneNumber!),
            //   ],
            // ),
            //
            //
            Row(
              children: [
                Text("Email"),
                SizedBox(width: 10,),
                Text(user.email!),
              ],
            ),

            //
            //
            // Row(
            //   children: [
            //     Text("Mobile Number"),
            //     SizedBox(width: 10,),
            //     Text(user.),
            //   ],
            // ),



            ElevatedButton(onPressed: ()
            {
              //first we will create the provider
              final provider =Provider.of<GoogleSignInProvider>(context,listen:false);
              provider.logout();
            },



                child:Text("Logout"))


          ],
        ) ,
      ),
    );
  }
}
