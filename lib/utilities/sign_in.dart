import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<bool> isNewUser(User user) async {
  QuerySnapshot result = await FirebaseFirestore.instance
      .collection("users")
      .where("email", isEqualTo: user.email)
      .get();
  final List<DocumentSnapshot> docs = result.docs;
  return docs.length == 0
      ? Future<bool>.value(true)
      : Future<bool>.value(false);
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

Future<String> signInWithGoogle() async {
  await Firebase.initializeApp();

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult =
      await _auth.signInWithCredential(credential);
  final User user = authResult.user;

  if (user != null) {
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

    print("signInWithGoogle succeeded: $user");

    if (await isNewUser(currentUser) == true) {
      addUser(currentUser);
    }

    return '$user';
  }
  return null;
}

Future<void> signOutGoogle() async {
  await googleSignIn.signOut();

  print("User signed out");
}
