import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_ecomm/Pages/home.dart';


class Login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<Login> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth =  FirebaseAuth.instance;
  SharedPreferences preferences;
  bool loading = false;
  bool isLoggedin = false;

  @override
  void initState(){
    super.initState();
    isSignedIn();
  }
  void isSignedIn() async{
    setState(() {
      loading = true;
    });
    preferences= await SharedPreferences.getInstance();
    isLoggedin = await googleSignIn.isSignedIn();
    if(isLoggedin){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    setState(() {
    loading= false;
    });
  }

  Future handleSignIn() async {
    preferences = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
    });
    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication = await googleUser
        .authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    FirebaseUser firebaseUser = (await firebaseAuth.signInWithCredential(
        credential)).user;

    if (firebaseUser != null) {
      final QuerySnapshot result = await Firestore.instance.collection('users')
          .where("id", isEqualTo: firebaseUser.uid)
          .getDocuments();
      final List<DocumentSnapshot> documents = result.documents;
      if (documents.length == 0) {
        //insert the user to our collection
        Firestore.instance.collection("users")
            .document(firebaseUser.uid)
            .setData(
            {"id": firebaseUser.uid,
              "username": firebaseUser.displayName,
              "profilePicture": firebaseUser.photoUrl
            });
        await preferences.setString("id", firebaseUser.uid);
        await preferences.setString("username", firebaseUser.displayName);
        await preferences.setString("photoUrl", firebaseUser.photoUrl);
      } else {
        await preferences.setString("photoUrl", documents[0]['id']);
        await preferences.setString("username", documents[0]['username']);
        await preferences.setString("photoUrl", documents[0]['photoUrl']);
      }
      Fluttertoast.showToast(msg: "Login Successfull");
      setState(() {
        loading = false;
      });
// This is the missing Code
      Navigator.pushReplacement(

          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
//Missing Code
      Fluttertoast.showToast(msg: "Login failed");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        backgroundColor: Colors.white,

        centerTitle: true,

        title: new Text(

          "Login",

          style: TextStyle(color: Colors.red.shade900),

        ),

      ),

      body: Stack(

        children: <Widget>[

          Visibility(

              visible: loading ?? true,

              child: Center(

                child: Container(

                  alignment: Alignment.center,

                  color: Colors.white.withOpacity(0.9),

                  child: CircularProgressIndicator(

                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),

                  ),

                ),

              ))

        ],

      ),

      bottomNavigationBar: Container(

        child: Padding(

          padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0, bottom: 8.0),

          child: FlatButton(

              color: Colors.red,

              onPressed: () {

                handleSignIn();

              },

              child: Text(

                "Sign in / Sign up with google",

                style: TextStyle(color: Colors.white),

              )),

        ),

      ),

    );

  }

}

