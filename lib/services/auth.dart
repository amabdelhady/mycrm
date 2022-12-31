import 'package:firebase_auth/firebase_auth.dart';
import 'database_services.dart';

class AuthAPIServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  Future<String?> getCurrentUID() async {
    String currentUserID = "";
    User? currentUser;
    FirebaseAuth.instance.authStateChanges().listen((currentUser) {
      if (currentUser != null) {
        print(currentUser.uid);
      }
    });
    currentUserID = currentUser!.uid.toString();
  }

  //Register User
  Future registerUserFirebase(email, password, firstName, lastName,
      phoneNumber, gender) async{
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password);
      DatabaseService().addUser(email, firstName, lastName,
          phoneNumber, gender);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //signIn
  Future signInFirebase(email, password)async{
    try {
      _auth.signInWithEmailAndPassword(
          email: email,
          password: password);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    catch (e) {
      print(e.toString());
    }
  }
  //Verify User Email
  Future verifyUserEmail() async {
    User? user = _auth.currentUser;
    user!.sendEmailVerification();

    await user.reload();
    if (!user.emailVerified) {
      await user.sendEmailVerification();
    }
  }
}
