import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:plasmavid/screens/TabScreen.dart';

class DonateMedicineForm extends StatefulWidget {
  static const routeName = 'DonateMedicineForm';
  @override
  _DonateMedicineFormState createState() => _DonateMedicineFormState();
}

class _DonateMedicineFormState extends State<DonateMedicineForm> {
  ScrollController _controller;

  @override
  void initState() {
    //Initialize the  scrollController
    _controller = ScrollController();
    super.initState();
  }

  void scrollCallBack(DragUpdateDetails dragUpdate) {
    setState(() {
      // Note: 3.5 represents the theoretical height of all my scrollable content. This number will vary for you.
      _controller.position.moveTo(dragUpdate.globalPosition.dy * 1);
    });
  }

  final _formKey = GlobalKey<FormState>();
  DateTime _choosenDate;
  Map<String, Object> args = {
    'name': '',
    'fatherName': '',
    'address': '',
    'Medicine/Equipment Name': null,
    'pincode': '',
    'Quantity': '',
    'phone': '',
    'anyNote': '',
  };

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Add Donor'),
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    child: Form(
                        key: _formKey,
                        child: ListView(
                          controller: _controller,
                          children: [
                            TextFormField(
                              decoration: InputDecoration(labelText: 'Name'),
                              textInputAction: TextInputAction.next,
                              onSaved: (val) {},
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter name';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Father\'sName'),
                              textInputAction: TextInputAction.next,
                              onSaved: (val) {},
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter Father\'sName';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Medicine/Equipment Name'),
                              textInputAction: TextInputAction.next,
                              onSaved: (val) {},
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter Medicine/Equipment Name';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Quantity'),
                              textInputAction: TextInputAction.next,
                              onSaved: (val) {},
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter Medicine/Equipment Quantity';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Phone Number'),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.phone,
                              onSaved: (val) {},
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter Phone Number';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: InputDecoration(labelText: 'Address'),
                              textInputAction: TextInputAction.next,
                              onSaved: (val) {},
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter pickup address';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration: InputDecoration(labelText: 'Pincode'),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              onSaved: (val) {},
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter pincode';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Any Note'),
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              onSaved: (val) {},
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            RaisedButton(
                              onPressed: () {
                                // loginStore.validateOtpAndLogin(context, text);
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        TabScreen()));
                              },
                              color: Theme.of(context).primaryColor,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14))),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'Submit',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
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
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
