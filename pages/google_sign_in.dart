import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';


class GoogleSignInProvider extends ChangeNotifier
{
  final googleSignIn=GoogleSignIn();

  //this will store all the information relatred the the person who is signined
GoogleSignInAccount? _user;
//creating the getter method so that we can get the user details
GoogleSignInAccount get user=>_user!;



//this is the metod of google signin that will be executed after button is pressed

Future googleLogin()async
{
  //since the googleSignIn variable at top hold the full method of GoogleSignIn
 final googleUser= await googleSignIn.signIn();

 if(googleUser == null)
   {

     Get.showSnackbar(GetSnackBar(
       message: "please select an account",
       duration: Duration(seconds: 2),
       isDismissible: true,
       backgroundColor: Colors.red,
       borderRadius: 12,
       padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
       snackPosition: SnackPosition.BOTTOM,

     ));
   }




//else if user has selected an account then
_user=googleUser;


 //now we will authinticate the user
  final googleAuth=await googleUser!.authentication;


//if the user is authincated then we will get the accessToken and idToken that we can use for signIn from the firebase
final credential=GoogleAuthProvider.credential(
  accessToken: googleAuth.accessToken,
  idToken: googleAuth.idToken
);





//now we will send request to the firbase
await FirebaseAuth.instance.signInWithCredential(credential);




//now in the last we will call the notifier listner to update our UI

notifyListeners();





}

//creating the methord for the logout
  Future logout()
  async
  {
    //this will only diconnent the user from the app he will we loggind ifhe open again
    await googleSignIn.disconnect();


    //to logout compleletly we will logout from the firbase
    FirebaseAuth.instance.signOut();
  }

}