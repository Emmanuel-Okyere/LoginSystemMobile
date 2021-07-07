import 'package:flutter/material.dart';
import 'package:web_architecture/screens/login_screen.dart';
class HomeScreen extends StatelessWidget {
  static const routeName='/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.lightBlue,
        title:Text('Home Page'),
        actions: <Widget> [
          // ignore: deprecated_member_use
          FlatButton(
            child: Row(
              children: <Widget> [
                Text('Logout',style: TextStyle(fontSize: 16)),
                Icon(Icons.person)
              ],
            ),
            textColor: Colors.white,
            onPressed: (){
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);

            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                child: Icon(
                  Icons.person_pin_outlined,
                  size: 120,
                  color: Colors.lightGreenAccent,
                )),
            Container(
              color: Colors.lightBlue,
              child: ListTile(
                title: Text('HOME', style: TextStyle(color: Colors.white)),
                leading: Icon(Icons.home, color: Colors.lightGreenAccent),
                onTap: () {
                  // Update the state of the app.
                  // ...

                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              color: Colors.lightBlue,
              child: ListTile(
                title: Text('MESSAGE',
                    style: TextStyle(color: Colors.white)),
                leading: Icon(Icons.message, color: Colors.lightGreenAccent),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              color: Colors.lightBlue,
              child: ListTile(
                title: Text("CALL",
                    style: TextStyle(color: Colors.white)),
                leading: Icon(Icons.call, color: Colors.lightGreenAccent),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),

          ],
        ),
      ),
      backgroundColor: Color(0xFF272D34),
      body: Center(

        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text('Welcome to your home page',style: TextStyle(fontSize: 20,color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
