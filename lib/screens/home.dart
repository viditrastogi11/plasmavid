import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:plasmavid/screens/TabScreen.dart';
import 'package:plasmavid/screens/newprofile.dart';
import 'package:plasmavid/screens/otppage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home extends StatefulWidget {
  static const routeName = 'LoginPage';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController phoneController = TextEditingController();
  String countryCode = '+91';

  void submit() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await FirebaseAuth.instance.verifyPhoneNumber(
      timeout: const Duration(seconds: 90),
      phoneNumber: '+91' + phoneController.text,
      verificationCompleted: (PhoneAuthCredential credential) async {
        UserCredential user = await auth.signInWithCredential(credential);
        if (user.additionalUserInfo.isNewUser) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => NewProfilePage()));
        } else {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => TabScreen()));
        }
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int resendToken) async {
        String smsCode = await Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => OtpPage()));

        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);
        UserCredential user = await auth.signInWithCredential(credential);
        if (user.additionalUserInfo.isNewUser) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => NewProfilePage()));
        } else {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => TabScreen()));
        }
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return ListView(
        children: [
          Column(
            children: <Widget>[
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Container(
                        height: constraints.maxHeight * .5,
                        constraints: const BoxConstraints(maxWidth: 500),
                        margin: const EdgeInsets.only(top: 20),
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(210, 212, 219, 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                    ),
                    Center(
                      child: Container(
                          height: constraints.maxHeight * .4,
                          constraints: const BoxConstraints(maxHeight: 300),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 50),
                          child: Image.asset(
                            'assets/images/login.png',
                            fit: BoxFit.scaleDown,
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text('PlasmaVid',
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 30,
                          fontWeight: FontWeight.w800))),
              SizedBox(
                height: 10,
              ),
              Container(
                  constraints: const BoxConstraints(maxWidth: 500),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: 'We will send you an ',
                          style: TextStyle(
                            color: Colors.orange,
                          )),
                      TextSpan(
                          text: 'One Time Password ',
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: 'on this mobile number',
                          style: TextStyle(
                            color: Colors.orange,
                          )),
                    ]),
                  )),
              Container(
                height: 40,
                constraints: const BoxConstraints(maxWidth: 500),
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      countryCode,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 200,
                      child: CupertinoTextField(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        controller: phoneController,
                        clearButtonMode: OverlayVisibilityMode.editing,
                        keyboardType: TextInputType.phone,
                        maxLines: 1,
                        placeholder: '12345 67890',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                constraints: const BoxConstraints(maxWidth: 500),
                child: RaisedButton(
                  onPressed: () {
                    if (phoneController.text.length == 10) {
                      submit();
                    }
                  },
                  color: Colors.orange,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14))),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Next',
                          style: TextStyle(color: Colors.white),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            color: Colors.orange[200],
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    }));
  }
}
