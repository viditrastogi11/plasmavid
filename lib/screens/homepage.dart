import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:plasmavid/screens/DonateMedicineForm.dart';
import 'package:plasmavid/screens/DonatePlasmaForm.dart';
import 'package:plasmavid/widgets/homePageCard.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      bool portrait = constraints.maxHeight > constraints.maxWidth;
      return Scaffold(
          body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 20),
          child: GridView(
            gridDelegate: portrait
                ? SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1.2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  )
                : SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400,
                    childAspectRatio: 1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, DonatePlasmaForm.routeName);
                  },
                  child: HomePageCard('Add Plasma Donor',
                      Icons.person_add_alt_1_rounded, portrait)),
              GestureDetector(
                child: HomePageCard('Search Plasma Donor',
                    Icons.person_search_rounded, portrait),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, DonateMedicineForm.routeName);
                  },
                  child: HomePageCard('Donate medicenes / Equipments',
                      Icons.medical_services, portrait)),
              GestureDetector(
                  child: HomePageCard('Search medicenes / Equipments',
                      Icons.search_sharp, portrait)),
            ],
          ),
        ),
      ));
    });
  }
}
