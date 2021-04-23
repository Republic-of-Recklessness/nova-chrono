import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthProvider {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  String userID;

  AuthProvider(this.firebaseAuth);

  Stream<User> get authState => firebaseAuth.idTokenChanges();

  Future<bool> isNewUser(User user) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('User is not new.');
        return Future<bool>.value(false);
      } else {
        print('User is new.');
        return Future<bool>.value(true);
      }
    });
  }

  Future<void> addUser(User currentUser) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(currentUser.uid)
        .set({
          'uid': currentUser.uid,
          'email': currentUser.email,
          'name': currentUser.displayName,
          'profile_photo': currentUser.photoURL
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  // Sign in Method
  Future<String> signIn() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await firebaseAuth.signInWithCredential(credential);
    final User user = authResult.user;

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = firebaseAuth.currentUser;
      assert(user.uid == currentUser.uid);

      print("signInWithGoogle succeeded: $user");

      if (await isNewUser(currentUser) == true) {
        addUser(currentUser);
      }

      userID = currentUser.uid;

      return '$user';
    }
    return null;
  }

  // Sign out method
  Future<void> signOut() async {
    await googleSignIn.signOut();
    await firebaseAuth.signOut();

    print("User signed out");
  }
}
