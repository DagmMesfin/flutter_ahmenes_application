import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_ahmenes_application/global/common/toast.dart';


class FirebaseAuthService{
  FirebaseAuth _auth= FirebaseAuth.instance;
  Future<User?> signUpWithEmailAndPassword(String email, String password) async {

try{
  UserCredential credential =await _auth.createUserWithEmailAndPassword(email: email, password: password);

  return credential.user;
} on FirebaseAuthException catch(e){

  if(e.code == 'email-ready-in-use'){
    showToast(message: 'The email adress is alrady in use.');
  }else {
    showToast(message: 'An error occured: ${e.code}');
  }
}

return null;
  }


   Future<User?> signInWithEmailAndPassword(String email, String password) async {

try{
  UserCredential credential =await _auth.signInWithEmailAndPassword(email: email, password: password);

  return credential.user;
} on FirebaseAuthException catch(e){
  if(e.code == 'user-not-found' || e.code == 'wrong password'){
    showToast(message: 'Invalid email or password.');
  } else{
    showToast(message: 'An error occured: ${e.code}');
  }
}
return null;
  }

  

}