import 'package:flutter/material.dart';
import 'package:myapp/widgets/GradientAppBar.dart';
import 'package:myapp/members/models/Model_team.dart';
import 'package:myapp/members/Service.dart';
import 'package:myapp/theme.dart' as Theme;

class TeamDetails extends StatelessWidget {
  final List<String> memberId;
  @override
  TeamDetails(this.memberId);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new TeamDetailsBody(memberId),
    );
  }
}

class TeamDetailsBody extends StatefulWidget {
  final List<String> memberId;
  @override
  TeamDetailsBody(this.memberId);

  @override
  TeamDetailsBodyState createState() => new TeamDetailsBodyState(memberId);
}

class TeamDetailsBodyState extends State<TeamDetailsBody> {
  final List<String> memberId;
  @override
  TeamDetailsBodyState(this.memberId);

  Future<Members> _memberDescription;

  @override
  void initState() {
    super.initState();
    _memberDescription = fetchDetail(this.memberId[0]);
  }

  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
      child: Container(
        height: 400,
        color: Theme.TabColors.appBarIconColor,
        child: Column(
          children: <Widget>[
            new GradientAppBar("Member detail"),
            FutureBuilder<Members>(
                future: _memberDescription,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return Center(
                      child: Card(
                        child: ListTile(
                          leading: Text('${snapshot.data.name}',
                              style: TextStyle(fontSize: 20.0)),
                        ),
                      ),
                    );
                  }
                }),
            // suite
          ],
        ),
      ),
    );
  }
}
