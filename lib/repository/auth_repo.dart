
import 'dart:js_interop';

import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<bool> isUserLoggedIn() async {
    bool isUserLoggedIn=false;
    try {
      _auth.authStateChanges().listen((User? user) {
        if(user ==null){
          isUserLoggedIn= false;
        }else{
          isUserLoggedIn=true;
        }
      });
      return isUserLoggedIn;
    } catch (e) {
      // print(e);
      return false;
    }
  }

  // /// create user object based on firebase User
  // u.User? _userFromFirebase(User user) {
  //   return user != null ? u.User(user.uid) : null;
  // }
  //
  // Future<bool> ForgotPassword(email, context) async {
  //   try {
  //     await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  //     ScaffoldMessenger.of(context).showSnackBar(MSG().snackBar(
  //       'A password reset link has been sent to $email',
  //     ));
  //     return true;
  //   } catch (e) {
  //     print(e);
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         MSG.errorSnackBarUP(e.toString().split(']')[1], context));
  //     return false;
  //   }
  // }
  //
  // Future<bool> ChangePassword(newPassword, context) async {
  //   try {
  //     await FirebaseAuth.instance.currentUser!.updatePassword(newPassword);
  //     return true;
  //   } catch (e) {
  //     print(e);
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         MSG.errorSnackBarUP(e.toString().split(']')[1], context));
  //     return false;
  //   }
  // }
  //
  // /// sign in with email and pasword
  // Future SignInWithEmailAndPassword(
  //     String email, String password, BuildContext context) async {
  //   try {
  //     UserCredential result = await _auth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //     User? user = result.user;
  //
  //     await FirebaseFirestore.instance
  //         .collection('Admin_User')
  //         .doc(user!.uid)
  //         .get()
  //         .then((DocumentSnapshot documentSnapshot) async {
  //       if (documentSnapshot.exists) {
  //         ScaffoldMessenger
  //             .of(context)
  //             .showSnackBar(
  //             MSG.errorSnackBar('No registered User for this account', context));
  //         await signOut(context, user.uid);
  //         return null;
  //       }else{
  //         FirebaseMessaging.instance.subscribeToTopic(user.uid);
  //         AppNavigator.pushAndReplacePage(context,
  //             page:  const HomeLandingPage());
  //         return _userFromFirebase(user);
  //       }
  //
  //     });
  //
  //   } on FirebaseAuthException catch (e) {
  //     print(e.toString());
  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           MSG.errorSnackBar('No user found for this email.', context));
  //     } else if (e.code == 'wrong-password') {
  //       print('Wrong password provided for that user.');
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           MSG.errorSnackBar('Wrong password provided.', context));
  //     } else if (e.code == 'user-disabled') {
  //       print('Your account has been disabled');
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           MSG.errorSnackBar('Your account has been disabled', context));
  //     } else if (e.code == 'invalid-email') {
  //       print('You inserted an invalid email');
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           MSG.errorSnackBar('You inserted an invalid email.', context));
  //     }
  //     return null;
  //   }
  // }
  //
  //
  // late String uid;
  //
  // Future<u.User?> signInWithGoogle(BuildContext context) async {
  //   try {
  //     // Trigger the authentication flow
  //     final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
  //     String userId = googleUser.id;
  //     FirebaseFirestore.instance
  //         .collection('Users')
  //         .doc(userId)
  //         .get()
  //         .then((DocumentSnapshot documentSnapshot) async {
  //       if (documentSnapshot.exists) {
  //         print('Document exists on the database');
  //         // Obtain the auth details from the request
  //         final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;
  //
  //         // Create a new credential
  //         final credential = GoogleAuthProvider.credential(
  //           accessToken: googleAuth.accessToken,
  //           idToken: googleAuth.idToken,
  //         );
  //         UserCredential result =
  //         await FirebaseAuth.instance.signInWithCredential(credential);
  //         User? user = result.user;
  //         return _userFromFirebase(user!);
  //       } else {
  //
  //         //signOut(context,userId);
  //         return null;
  //       }
  //     });
  //   } on FirebaseAuthException catch (e) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(MSG.errorSnackBar(e.toString().split(']')[1], context));
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  //   return null;
  // }
  //
  // final CollectionReference collectionReferenceUserInfo =
  // FirebaseFirestore.instance.collection("Users");
  //
  // Future<u.User?> signUpWithGoogle(
  //     bool isNormalUser, BuildContext context) async {
  //   try {
  //     // Trigger the authentication flow
  //     final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
  //
  //     // Obtain the auth details from the request
  //     final GoogleSignInAuthentication googleAuth =
  //     await googleUser.authentication;
  //
  //     // Create a new credential
  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //     UserCredential result =
  //     await FirebaseAuth.instance.signInWithCredential(credential);
  //     User? user = result.user;
  //     FirebaseMessaging.instance.subscribeToTopic(user!.uid);
  //     await FirebaseFirestore.instance
  //         .collection('Users')
  //         .doc(user.uid)
  //         .get()
  //         .then((DocumentSnapshot documentSnapshot) async {
  //       if (documentSnapshot.exists) {
  //         print('Document exists on the database');
  //         // Obtain the auth details from the request
  //         final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;
  //
  //         // Create a new credential
  //         final credential = GoogleAuthProvider.credential(
  //           accessToken: googleAuth.accessToken,
  //           idToken: googleAuth.idToken,
  //         );
  //         UserCredential result =
  //         await FirebaseAuth.instance.signInWithCredential(credential);
  //         User? user = result.user;
  //         //return _userFromFirebase(user!);
  //       } else {
  //         await collectionReferenceUserInfo.doc(user.uid).set({
  //           'email': user.email,
  //           'firstname': user.displayName.toString().split(' ')[0],
  //           'lastname': user.displayName.toString().split(' ')[1],
  //           'id': user.uid,
  //           'myListOfRequestedServiceProviders': [],
  //           'photoUrl': user.photoURL,
  //           'phoneNumber': '',
  //           'isNormalUser': true,
  //           'totalBalance': 0.0,
  //           'totalAmountSent': 0.0,
  //           'totalAmountDeposited': 0.0,
  //           'refID': AppUtils.generateRandomString(10),
  //           'isUserBlocked': false,
  //           'isHandypesin':false,
  //           'city': 'Awka',
  //           'state': 'Anambra',
  //           'country': '',
  //           'address': 'No address provided',
  //           'isUserVerified': false,
  //           'isRegistrationComplete': false,
  //           'createdAt': DateTime.now(),
  //           'updatedAt': DateTime.now(),
  //         });
  //         // return _userFromFirebase(user);
  //       }
  //     });
  //     /// create a new document for the user with the uid
  //
  //     return _userFromFirebase(user);
  //   } on FirebaseAuthException catch (e) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(MSG.errorSnackBar(e.toString().split(']')[1], context));
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  //   return null;
  // }
  //
  // ///Sign in with facebook
  //
  // Future<UserCredential> signInWithFacebook() async {
  //   print('object');
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();
  //
  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //   FacebookAuthProvider.credential(loginResult.accessToken!.token);
  //
  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }
  //
  // ///  Register with email and pasword
  // Future registerWithEmailAndPassword(
  //     String password,
  //     BuildContext context,
  //     String email,
  //     String firstname,
  //     String lastname,
  //     String photoUrl,
  //     String phoneNumber,
  //     bool isNormalUser,
  //     double totalBalance,
  //     double totalAmountSent,
  //     double totalAmountDeposited,
  //     String refID,
  //     bool isUserBlocked,
  //     String city,
  //     String state,
  //     String country,
  //     String address,
  //     bool isUserVerified,
  //     bool isRegistrationComplete,
  //     ) async {
  //   try {
  //     UserCredential result = await _auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //     User? user = result.user;
  //     FirebaseMessaging.instance.subscribeToTopic(user!.uid);
  //
  //     /// create a new document for the user with the uid
  //     await DatabaseService(uid: user.uid).addUserData(
  //         email,
  //         firstname,
  //         lastname,
  //         photoUrl,
  //         phoneNumber,
  //         isNormalUser,
  //         totalBalance,
  //         totalAmountSent,
  //         totalAmountDeposited,
  //         refID,
  //         isUserBlocked,
  //         city,
  //         state,
  //         country,
  //         address,
  //         isUserVerified,
  //         isRegistrationComplete);
  //
  //     print(_userFromFirebase);
  //     return _userFromFirebase(user);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           MSG.errorSnackBar('The password provided is too weak.', context));
  //       print('The password provided is too weak.');
  //     } else if (e.code == 'email-already-in-use') {
  //       ScaffoldMessenger.of(context).showSnackBar(MSG.errorSnackBar(
  //           'The account already exists for that email', context));
  //       print('The account already exists for that email.');
  //     } else if (e.code == 'invalid-email') {
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(MSG.errorSnackBar('Invalid email Provided', context));
  //       print('invalid email');
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }
  //
  // /// Sign out
  // Future signOut(BuildContext context, String uid) async {
  //   try {
  //     FirebaseMessaging.instance.unsubscribeFromTopic(uid);
  //     return await _auth.signOut().whenComplete(() {
  //       AppNavigator.pushAndReplacePage(context, page:  const SignInPage());
  //     });
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }
}
