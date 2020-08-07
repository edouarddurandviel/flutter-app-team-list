import 'dart:math';

import 'package:flutter/material.dart';
import 'package:myapp/members/models/Model_team.dart';
import 'package:myapp/theme.dart' as Theme;

import 'package:myapp/members/models/Model_short_team.dart';

import 'package:myapp/members/Service.dart';
import 'package:myapp/members/DB_provider.dart';

import 'package:myapp/Routes.dart';

import 'package:myapp/pages/team_detail.dart';

class SearchForm extends StatefulWidget {
  final Members member;

  SearchForm({Key key, this.member}) : super(key: key);
  // This widget is the root of your application.
  @override
  _SearchFormState createState() {
    return _SearchFormState(this.member);
  }
}

class _SearchFormState extends State<SearchForm> with TickerProviderStateMixin {
  final Members member;

  _SearchFormState(this.member);

  AnimationController animation;
  Animation<double> _fadeIn;

  // create a global key that identifies the form
  var isLoading = false;
  var isLoadingData = false;
  final String id = '';
  final _formKey = GlobalKey<FormState>();
  final TextEditingController inputController = TextEditingController();
  Future<Team> _members;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    inputController.dispose();
    animation.dispose();
    super.dispose();
    _members = fetchMember(inputController.text);
  }

  @override
  Widget build(context) {
    return new Flexible(
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          color: Theme.TabColors.appBarIconColor,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
              Form(
                key: _formKey,
                child: Container(
                  height: 50,
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  child: TextFormField(
                    controller: inputController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: 'Type between 1 and 5'),
                    style: Theme.TextStyles.formFields,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please type number you are looking for !';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Center(
                child: IconButton(
                  iconSize: 50,
                  icon: Icon(Icons.add_circle_outline),
                  color: Colors.red,
                  hoverColor: Colors.blue,
                  focusColor: Colors.blue,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        isLoadingData = true;
                      });
                      setState(() {
                        animation = AnimationController(
                          vsync: this,
                          duration: Duration(milliseconds: 120),
                        );
                        _fadeIn = Tween<double>(begin: 0.1, end: 1.0)
                            .animate(animation);
                        _members = fetchMember(inputController.text);
                      });
                      animation.forward();
                      setState(() {
                        isLoadingData = false;
                      });
                    }
                  },
                ),
              ),
              FutureBuilder<Team>(
                  future: _members,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Container(
                        height: 75,
                        margin: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        padding: const EdgeInsets.all(0),
                        child: Center(
                          child: Text('Result container'),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Container(
                        height: 75,
                        margin: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        padding: const EdgeInsets.all(0),
                        child: Center(
                          child: Text("${snapshot.error}"),
                        ),
                      );
                    } else {
                      return Container(
                        height: 75,
                        margin: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        padding: const EdgeInsets.all(0),
                        child: FadeTransition(
                          opacity: _fadeIn,
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('${snapshot.data.name}',
                                        style: Theme.TextStyles.listTitle),
                                    Ink(
                                      decoration: const ShapeDecoration(
                                        color: Colors.red,
                                        shape: CircleBorder(),
                                      ),
                                      child: IconButton(
                                        padding: const EdgeInsets.all(10),
                                        icon: Icon(Icons.save_alt),
                                        color: Colors.white,
                                        iconSize: 25,
                                        onPressed: () {
                                          setState(() {
                                            DBProvider.db
                                                .createEmployee(snapshot.data);
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      );
                    }
                  }),
              FutureBuilder(
                future: DBProvider.db.getAllEmployees(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text('Blank');
                  } else {
                    return Container(
                      alignment: Alignment.topCenter,
                      height: 420,
                      margin: const EdgeInsets.all(0),
                      //padding: const EdgeInsets.all(0),
                      child: ListView.builder(
                        itemCount: snapshot.data.length,
                        physics: (snapshot.data.length <= 4)
                            ? const NeverScrollableScrollPhysics()
                            : const AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            elevation: 4,
                            child: ListTile(
                              leading: Ink(
                                child: IconButton(
                                  icon: Icon(Icons.arrow_forward),
                                  color: Colors.white,
                                  onPressed: () {
                                    Routes.navigateTo(
                                        context, '${snapshot.data[index].id}');
                                  },
                                ),
                                padding: EdgeInsets.all(10),
                                // child: Text('${index + 1}',
                                //     style: Theme.TextStyles.listInk),
                                decoration: const ShapeDecoration(
                                  color: Colors.red,
                                  shape: CircleBorder(),
                                ),
                              ),
                              title: Text(
                                  '${snapshot.data[index].name} ${snapshot.data[index].username}',
                                  style: Theme.TextStyles.listTitle),
                              subtitle: Text('${snapshot.data[index].email}',
                                  style: Theme.TextStyles.listEmail),
                              trailing: Ink(
                                decoration: const ShapeDecoration(
                                  color: Colors.lightBlue,
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.delete),
                                  color: Colors.white,
                                  onPressed: () {
                                    setState(() {
                                      DBProvider.db.deleteAndGetAllEmployees(
                                          snapshot.data[index].id);
                                    });
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
