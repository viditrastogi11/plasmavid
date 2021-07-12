import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:plasmavid/screens/TabScreen.dart';
import 'package:plasmavid/screens/home.dart';
import 'package:plasmavid/screens/homepage.dart';

class NewProfilePage extends StatefulWidget {
  @override
  _NewProfilePageState createState() => _NewProfilePageState();
}

class _NewProfilePageState extends State<NewProfilePage> {
  TextEditingController nameTEC = TextEditingController();
  TextEditingController emailTEC = TextEditingController();
  TextEditingController orgTEC = TextEditingController();
  TextEditingController orgNumTEC = TextEditingController();
  String imagePath = "";
  bool isOrganisation = false;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Register'),
        ),
        body: Center(
          child: Container(
            width: constraints.maxWidth * .9 > 500
                ? 500
                : constraints.maxWidth * .9,
            child: ListView(
              children: [
                SizedBox(height: 30),
                TextFormField(
                  controller: nameTEC,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    labelText: 'Name',
                    hintText: 'Name',
                    suffixStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: emailTEC,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    labelText: 'Email',
                    hintText: 'abc@gmail.com',
                    suffixStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),
                SwitchListTile(
                  value: isOrganisation,
                  onChanged: (val) {
                    setState(() {
                      isOrganisation = val;
                    });
                  },
                  title: Text(
                    'Are you an organisation?',
                    style: TextStyle(fontSize: 16.5),
                  ),
                  subtitle: Text(
                    'Hospital, NGO, etc',
                  ),
                ),
                if (isOrganisation)
                  TextFormField(
                    textCapitalization: TextCapitalization.words,
                    // initialValue: value.user.mobile ?? "",
                    controller: orgTEC,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      labelText: 'Organisation Name',
                      suffixStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                SizedBox(height: 5),
                if (isOrganisation)
                  TextFormField(
                    // initialValue: value.user.mobile ?? "",
                    keyboardType: TextInputType.phone,
                    controller: orgNumTEC,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      labelText: 'Phone Num',
                      suffixStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                if (isOrganisation)
                  TextFormField(
                    // initialValue: value.user.mobile ?? "",
                    keyboardType: TextInputType.phone,
                    controller: orgNumTEC,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      labelText: 'Pincode',
                      suffixStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                SizedBox(height: 20),
                RaisedButton(
                  onPressed: () {
                    // loginStore.validateOtpAndLogin(context, text);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => TabScreen()));
                  },
                  color: Theme.of(context).primaryColor,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(14))),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Save',
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
              ],
            ),
          ),
        ),
      );
    });
  }
}
