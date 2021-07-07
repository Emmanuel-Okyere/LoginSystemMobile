import 'package:flutter/material.dart';
import 'package:web_architecture/screens/login_screen.dart';
class ForgotPassword extends StatelessWidget {
  static String id = 'forgot-password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        backgroundColor: Color(0xFF2B2E4A),
        title: Text('Password Reset', style: TextStyle(fontFamily: 'RaleWay')),
        actions: <Widget> [
          // ignore: deprecated_member_use
          FlatButton(
            hoverColor: Color(0xCEC10A0A),
            child: Row(
              children: <Widget> [
                Text('Login', style: TextStyle(fontSize: 16)),
                Icon(Icons.person_add)
              ],
            ),
            textColor: Colors.white,
            onPressed: (){
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);

            },
          )
        ],
      ),
      backgroundColor: Color(0xFF272D34),
      body: Form(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Enter your Email',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              TextFormField(

                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Email',
                  icon: Icon(
                    Icons.mail,
                    color: Colors.white,
                  ),
                  errorStyle: TextStyle(color: Colors.white),
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value)
                  {
                    if(value!.isEmpty || !value.contains('@')){
                      return 'Invalid Email';
                    }
                    return null;
                  }

              ),
              SizedBox(height: 20),
              // ignore: deprecated_member_use
              MaterialButton(
                height: 60.0,
                minWidth: double.infinity,
                color: Color(0xFF05B142),
                textColor: Colors.white,
                child: new Text("Send Reset Email",style: TextStyle(fontSize: 16)),
                onPressed: (){

                },
                splashColor: Colors.black,
                shape:RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}