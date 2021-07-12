import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plasmavid/screens/TabScreen.dart';
import 'package:plasmavid/screens/homepage.dart';
import 'package:plasmavid/screens/newprofile.dart';

class OtpPage extends StatefulWidget {
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: Theme.of(context).accentColor.withAlpha(20),
              ),
              child: Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).primaryColor,
                size: 16,
              ),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          brightness: Brightness.light,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                        'Enter 6 digits verification code sent to your number',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            fontWeight: FontWeight.w500))),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: constraints.maxWidth * .9 > 500
                      ? 500
                      : constraints.maxWidth * .9,
                  child: TextFormField(
                    // initialValue: value.user.mobile ?? "",
                    keyboardType: TextInputType.phone,
                    controller: otpController,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.blueGrey,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      labelText: 'OTP',
                      suffixStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: RaisedButton(
                    onPressed: () {
                      // loginStore.validateOtpAndLogin(context, text);
                      if (otpController.text.length == 6) {
                        Navigator.of(context).pop(otpController.text);
                      }
                    },
                    color: Theme.of(context).primaryColor,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(14))),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Confirm',
                            style: TextStyle(color: Colors.white),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              color: Theme.of(context).accentColor,
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
          ),
        ),
      );
    });
  }
}
