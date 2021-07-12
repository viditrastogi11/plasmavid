import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:plasmavid/screens/TabScreen.dart';

class DonatePlasmaForm extends StatefulWidget {
  static const routeName = 'donatePlasmaForm';
  @override
  _DonatePlasmaFormState createState() => _DonatePlasmaFormState();
}

class _DonatePlasmaFormState extends State<DonatePlasmaForm> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    //Initialize the  scrollController
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
    'bloodGroup': null,
    'pincode': '',
    'coronaNegativeDate': '',
    'coronaPositiveDate': '',
    'isRecentlyDonated': null,
    'lastDonated': '',
    'phone': '',
    'isVacinated': null,
    'lastVacination': '',
    'gender': null,
    'everPregnant': null,
    'anyNote': '',
  };
  void _dateSubmit() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _choosenDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Add Donor'),
        ),
        body: Stack(
          children: [
            Scrollbar(
              isAlwaysShown: true,
              controller: _controller,
              child: Container(
                padding: EdgeInsets.all(15),
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
                              DropdownButtonFormField(
                                value: args['gender'],
                                items: [
                                  DropdownMenuItem(
                                    child: Text('Male'),
                                    value: 'Male',
                                  ),
                                  DropdownMenuItem(
                                    child: Text('Female'),
                                    value: 'Female',
                                  ),
                                ],
                                hint: Text('Click to Choose Gender'),
                                onChanged: (value) {
                                  setState(() {
                                    args['gender'] = value;
                                    if (value == "Male") {
                                      args['everPregnant'] = null;
                                    }
                                  });
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              if (args['gender'] == 'Female')
                                DropdownButtonFormField(
                                  value: args['everPregnant'],
                                  items: [
                                    DropdownMenuItem(
                                      child: Text('Yes- I have been Pregnant'),
                                      value: true,
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                          'No- I never have been Pregnant'),
                                      value: false,
                                    ),
                                  ],
                                  hint: Text('Have You Ever Been Pregnant?'),
                                  onChanged: (value) {
                                    setState(() {
                                      args['everPregnant'] = value;
                                    });
                                  },
                                ),
                              SizedBox(
                                height: 10,
                              ),
                              if (args['everPregnant'] == null ||
                                  !args['everPregnant'])
                                Column(
                                  children: [
                                    TextFormField(
                                      decoration:
                                          InputDecoration(labelText: 'Address'),
                                      keyboardType: TextInputType.streetAddress,
                                      textInputAction: TextInputAction.next,
                                      onSaved: (val) {},
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please enter Address';
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
                                          InputDecoration(labelText: 'Pincode'),
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
                                    DropdownButtonFormField(
                                      value: args['isRecentlyDonated'],
                                      items: [
                                        DropdownMenuItem(
                                          child: Text(
                                              'Yes - i recently donated plasma.'),
                                          value: true,
                                        ),
                                        DropdownMenuItem(
                                          child: Text(
                                              'No - i have not donated plasma'),
                                          value: false,
                                        ),
                                      ],
                                      hint: Text(
                                          'Have You donated plasma recently?'),
                                      onChanged: (value) {
                                        setState(() {
                                          args['isRecentlyDonated'] = value;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    if (args['isRecentlyDonated'] != null &&
                                        args['isRecentlyDonated'] == true)
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Last Plasma Donation Date:",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          RaisedButton(
                                            color: Colors.orange[200],
                                            onPressed: _dateSubmit,
                                            child: Text(
                                              _choosenDate == null
                                                  ? 'Choose Date'
                                                  : '${DateFormat.yMMMd().format(_choosenDate)}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    DropdownButtonFormField(
                                      value: args['isVaccinated'],
                                      items: [
                                        DropdownMenuItem(
                                          child: Text(
                                              'Yes - i have taken covid vaccine.'),
                                          value: true,
                                        ),
                                        DropdownMenuItem(
                                          child: Text(
                                              'No - i haven\'t taken covid vaccine.'),
                                          value: false,
                                        ),
                                      ],
                                      hint: Text(
                                          'Have You Taken A Vaccination Dose?'),
                                      onChanged: (value) {
                                        setState(() {
                                          args['isVaccinated'] = value;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    if (args['isVaccinated'] != null &&
                                        args['isVaccinated'] == true)
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Last vaccine dose taken:",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          RaisedButton(
                                            color: Colors.orange[200],
                                            onPressed: _dateSubmit,
                                            child: Text(
                                              _choosenDate == null
                                                  ? 'Choose Date'
                                                  : '${DateFormat.yMMMd().format(_choosenDate)}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    DropdownButtonFormField(
                                      value: args['bloodGroup'],
                                      items: [
                                        DropdownMenuItem(
                                          child: Text('A+'),
                                          value: 'A+',
                                        ),
                                        DropdownMenuItem(
                                          child: Text('A-'),
                                          value: 'A-',
                                        ),
                                        DropdownMenuItem(
                                          child: Text('B+'),
                                          value: 'B+',
                                        ),
                                        DropdownMenuItem(
                                          child: Text('B-'),
                                          value: 'B-',
                                        ),
                                        DropdownMenuItem(
                                          child: Text('AB+'),
                                          value: 'AB+',
                                        ),
                                        DropdownMenuItem(
                                          child: Text('AB-'),
                                          value: 'AB-',
                                        ),
                                        DropdownMenuItem(
                                          child: Text('O+'),
                                          value: 'O+',
                                        ),
                                        DropdownMenuItem(
                                          child: Text('O-'),
                                          value: 'O-',
                                        ),
                                      ],
                                      hint: Text('Click to Choose Blood Group'),
                                      onChanged: (value) =>
                                          args['bloodGroup'] = value,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Covid +ve Date:",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        RaisedButton(
                                          color: Colors.orange[200],
                                          onPressed: _dateSubmit,
                                          child: Text(
                                            _choosenDate == null
                                                ? 'Choose Date'
                                                : '${DateFormat.yMMMd().format(_choosenDate)}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Covid -ve Date:",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        RaisedButton(
                                          color: Colors.orange[200],
                                          onPressed: _dateSubmit,
                                          child: Text(
                                            _choosenDate == null
                                                ? 'Choose Date'
                                                : '${DateFormat.yMMMd().format(_choosenDate)}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              SizedBox(
                                height: 10,
                              ),
                              if (args['everPregnant'] != null &&
                                  args['everPregnant'])
                                Center(
                                  child: Text(
                                    'Women who have ever been pregnant cannot donate plasma.',
                                    style: TextStyle(color: Colors.red),
                                  ),
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
            ),
          ],
        ),
      );
    });
  }
}
