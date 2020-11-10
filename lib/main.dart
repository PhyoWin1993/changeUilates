import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: "Changing UI",
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _homeCtrl = new TextEditingController();
  Future _goToNextScreen(BuildContext context) async {
    Map res =
        await Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
      return new SecScreen(getName: _homeCtrl.text.toString());
    }));

    if (res.containsKey('name') && res != null) {
      print("All Dome");
      // _homeCtrl = res['name'];
      print("${res['name'].toString()}");
      _homeCtrl.text = res['name'].toString();
    } else {
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Home Screen"),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      backgroundColor: Colors.black54,

      body: new ListView(
        children: [
          new ListTile(
            title: new TextField(
              keyboardType: TextInputType.text,
              controller: _homeCtrl,
              cursorColor: Colors.white,
              style: new TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
              decoration: new InputDecoration(
                labelText: "Enter Your Name",
                labelStyle: new TextStyle(color: Colors.white),
                hintText: "e.g Mr.Phyo",
              ),
            ),
          ),

          //

          new ListTile(
            title: new FlatButton(
                color: Colors.blueAccent,
                onPressed: () {
                  // var router = new MaterialPageRoute(builder: (_) {
                  //   return new SecScreen();
                  // });
                  // Navigator.of(context).push(router);

                  _goToNextScreen(context);
                },
                child: new Text("Send to Back")),
          )
        ],
      ),
      //
    );
  }
}

class SecScreen extends StatefulWidget {
  final String getName;

  const SecScreen({Key key, this.getName}) : super(key: key);
  @override
  _SecScreenState createState() => _SecScreenState();
}

class _SecScreenState extends State<SecScreen> {
  var _secCtrl = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Second Screen"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.black54,

      body: new ListView(
        children: [
          new ListTile(
            title: new Text(
              "${widget.getName}",
              style: new TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.3,
              ),
            ),
          ),

          //
          new ListTile(
            title: new TextField(
              keyboardType: TextInputType.text,
              controller: _secCtrl,
              cursorColor: Colors.white,
              style: new TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
              decoration: new InputDecoration(
                labelText: "Enter Your Name",
                labelStyle: new TextStyle(color: Colors.white),
                hintText: "e.g Mr.Phyo",
              ),
            ),
          ),

          //

          new ListTile(
            title: new FlatButton(
                color: Colors.blueAccent,
                onPressed: () {
                  Navigator.pop(context, {"name": _secCtrl.text});
                },
                child: new Text("Send to Back")),
          )
        ],
      ),
      //
    );
  }
}
