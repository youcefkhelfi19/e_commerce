import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/helper/constants/app_routes.dart';
import 'package:e_commerce/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController{
  bool isVisible = false;
  bool isAccepted = false;
  RxBool isLoading = false.obs;
  String uid = '';
   late String activeSession  ;
  final GetStorage sessionBox = GetStorage();
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  GoogleSignIn googleSignIn = GoogleSignIn();
  FacebookAuth faceBookAuth = FacebookAuth.instance;

  void visibility(){
    isVisible = !isVisible;
    update();
  }
  void acceptTerms(){
    isAccepted = !isAccepted;
    update();
  }
  Future singUp({required String username , required String emailAddress,required String password})async{
    try {
        isLoading(true);
       await auth.createUserWithEmailAndPassword(
          email: emailAddress,
          password: password
      ).then((value){
         value.user!.updateDisplayName(username);
         uid = auth.currentUser!.uid;
         activeSession = 'active';
         sessionBox.write('session', activeSession);
         UserModel user= UserModel(
           userName: value.user!.displayName,
           email: value.user!.email,
           address: '',
           image: value.user!.photoURL,
           userId: value.user!.uid,
         );
         saveUserExtraInfo(user);
       });
       update();
         isLoading(false);
        Get.offNamed(mainScreen);
    } on FirebaseAuthException catch (e) {
      isLoading(false);
      String? title = e.code.replaceAll(RegExp('-'), ' ').capitalizeFirst;
      String message = '';
      if (e.code == 'weak-password') {

        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {

        message = 'The account already exists for that email.';
      }else{

        message = e.message.toString();
      }
      Get.snackbar(title!, message,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      borderRadius: 20,
      backgroundColor: Colors.red
      );
    }catch (error){
      isLoading(false);

      Get.snackbar('Error', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          borderRadius: 20,
          backgroundColor: Colors.red
      );
    }
}
Future login({required String email, required String password})async{
  try {
    isLoading(true);
    await auth.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      uid = auth.currentUser!.uid;
      activeSession = 'active';
      sessionBox.write('session', activeSession);

    });
    update();
    isLoading(false);
    Get.offNamed(mainScreen);
  } on FirebaseAuthException catch (e) {
    isLoading(false);

    String? title = e.code.replaceAll(RegExp('-'), ' ').capitalizeFirst;
    String message = '';
    if (e.code == 'user-not-found') {
      message ='No user found for that email.';
    } else if (e.code == 'wrong-password') {
      message ='Wrong password provided for that user.';
          print('wrong password');
    }else{
      message = e.message.toString();
    }

      Get.snackbar(title!, message,
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          borderRadius: 20,
          backgroundColor: Colors.red
      );

  }catch (e){
    isLoading(false);

    Get.snackbar('Error', e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        borderRadius: 20,
        backgroundColor: Colors.red
    );
  }
}
Future resetPassword({required String email})async{
  try {
    isLoading(true);

    await auth.sendPasswordResetEmail(
        email: email,
    ).then((value){

    });
    update();
    signOut();
  } on FirebaseAuthException catch (e) {
    isLoading(false);

    String? title = e.code.replaceAll(RegExp('-'), ' ').capitalizeFirst;
    String message = '';
    if (e.code == 'wrong-password') {
      message ='Wrong password provided for that user.';
    }else{
      message = e.message.toString();
    }

    Get.snackbar(title!, message,
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        borderRadius: 20,
        backgroundColor: Colors.red
    );

  }catch (e){
    isLoading(false);

    Get.snackbar('Error', e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        borderRadius: 20,
        backgroundColor: Colors.red
    );
  }
}
Future googleSingIn()async{
    try{
      isLoading(true);

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

     var userCredential =  await FirebaseAuth.instance.signInWithCredential(credential).then((value){

       uid = googleUser.id;
       activeSession = 'active';
       sessionBox.write('session', activeSession);
       UserModel user= UserModel(
         userName: value.user!.displayName,
         email: value.user!.email,
         address: '',
         image: value.user!.photoURL,
         userId: value.user!.uid,
       );
        saveUserExtraInfo(user);
     });



      update();
      isLoading(false);

      Get.offNamed(mainScreen);
    }catch(e){
      isLoading(false);

      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          borderRadius: 20,
          backgroundColor: Colors.red
      );
    }
}
  Future facebookSingIn()async{
    try{
      isLoading(true);
      final LoginResult loginResult = await faceBookAuth.login();

      final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

      var userCredential =await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential).then((value){


        activeSession = 'active';
        sessionBox.write('session', activeSession);
        UserModel user= UserModel(
          userName: value.user!.displayName,
          email: value.user!.email,
          address: '',
          image: value.user!.photoURL,
          userId: value.user!.uid,
        );
        saveUserExtraInfo(user);

      });


      update();
      isLoading(false);
      Get.offNamed(mainScreen);
    }catch(e){
      isLoading(false);

      print(e.toString());
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          borderRadius: 20,
          backgroundColor: Colors.red
      );
    }
  }
  signOut()async{
    try{
       await auth.signOut();
       await googleSignIn.signOut();
       await faceBookAuth.logOut();

       sessionBox.remove('session');


       update();
       Get.offAllNamed(signupScreen);
    }catch(e){
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          borderRadius: 20,
          backgroundColor: Colors.red
      );
    }
  }
saveUserExtraInfo(UserModel user )async{
  try {
   await users.doc(user.userId).set(user.toJson()).catchError((error){
      print(error);
      Get.snackbar('Error', error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          borderRadius: 20,
          backgroundColor: Colors.red
      );
    });
  }catch(e){
    Get.snackbar('Error', e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        borderRadius: 20,
        backgroundColor: Colors.red
    );
  }


}
Future<UserModel> getUserData(String uid)async{
    UserModel userModel = UserModel() ;
  await FirebaseFirestore.instance
      .collection('users')
      .doc('jO2qI5cxirWB25CMJlCW7w9vGVj1')
      .snapshots().first.then((value)async{
        print(value.data()!['id']);
        userModel = UserModel(
          userId: value.data()!['id'],
          userName:  value.data()!['username'],
          email:  value.data()!['email'],
          address:  value.data()!['address'],
          image:  value.data()!['image'],
        );
   }) ;
    print(userModel.email);
   return userModel;
}

}