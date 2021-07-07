import 'package:flutter/material.dart';
import '../models/authentication.dart';
import 'package:provider/provider.dart';
import 'login_screen.dart';
import '../screens/home_screen.dart';
class SignupScreen extends StatefulWidget {
static const routeName='/signup';
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class  _SignupScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _formkey=GlobalKey();
  TextEditingController _passwordController=new TextEditingController();
  Map<String, dynamic> _authData={
    'email': '',
    'password':''
  };

  void _showErrorDialog(String msg){
    showDialog(context: context,
        builder: (ctx)=>AlertDialog(
          title:Text('An error occurred'),
          content: Text(msg),
          actions:<Widget>[
            // ignore: deprecated_member_use
            FlatButton(onPressed: (){
              Navigator.of(ctx).pop();
            }, child: Text('Okay'))
          ],
        )
    );
  }

  Future<void> _submit() async {
  if(!_formkey.currentState!.validate()){
    return;
  }
  _formkey.currentState!.save();
  try{
    await Provider.of<Authentication>(context, listen: false).signUp(_authData['email'], _authData['password']);

    Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
  }catch(error){
    var errorMessage= 'Authentication Failed (Error 1316)';
    _showErrorDialog(errorMessage);
  }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        backgroundColor: Color(0xFF2B2E4A),
        title: Text('User Registration'),
        actions: <Widget> [
          // ignore: deprecated_member_use
          FlatButton(
            hoverColor: Color(0xCEC10A0A),
            child: Row(
              children: <Widget> [
                Text('Login',style: TextStyle(fontSize: 16)),
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
      body: Stack(
        children: <Widget> [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xFF009688),
                      Color(0xFF2B2E4A),
                    ]
                )
            ),
          ),
          Center(
            child: Card(
              color: Color(0xDC2B2E4A),
              elevation: 80.0,
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                  height: 300,
                  width: 300,
                  padding: EdgeInsets.all(16),
                  child:Form(
                    key:_formkey ,
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          //First Name

                          //Email
                          TextFormField(
                            style: TextStyle(fontSize: 16,color: Colors.white),
                            decoration: InputDecoration( hintText: "Email",
                              hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.teal,
                                ),
                              ),
                              prefixIcon: const Icon(
                                Icons.person_pin_outlined,
                                color: Colors.white,
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (value)
                            {
                              if(value!.isEmpty || !value.contains('@')){
                                return 'Invalid Email';
                              }
                              return null;
                            },
                            onSaved: (value){
                              _authData['email']=value!;
                            },
                          ),
                          //Password
                          TextFormField(
                            style: TextStyle(fontSize: 16,color: Colors.white),
                            decoration: InputDecoration( hintText: "Password",
                              hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.teal,
                                ),
                              ),
                              prefixIcon: const Icon(
                                Icons.security,
                                color: Colors.white,
                              ),),
                            obscureText: true,
                            controller: _passwordController,
                            validator: (value){
                              if(value!.isEmpty ||value.length<=6){
                                return 'Invalid Password';
                              }
                              return null;
                            },
                            onSaved: (value){
                              _authData['password']=value!;
                            },
                          ),
                          //Confirm Password
                          TextFormField(
                            style: TextStyle(fontSize: 16,color: Colors.white),
                            decoration: InputDecoration( hintText: "Confirm Password",
                              hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.teal,
                                ),
                              ),
                              prefixIcon: const Icon(
                                Icons.security,
                                color: Colors.white,
                              ),
                            ),
                            obscureText: true,
                            validator: (value){
                              if(value!.isEmpty ||value !=_passwordController.text){
                                return 'Invalid Password';
                              }
                              return null;
                            },
                            onSaved: (value){
                            },
                          ),
                          //submit Button
                          SizedBox(
                            height: 40,
                          ),
                          // ignore: deprecated_member_use
                          MaterialButton(
                            height: 60.0,
                            minWidth: double.infinity,
                            color: Color(0xFF05B142),
                            textColor: Colors.white,
                            child: new Text("Sign Up",style: TextStyle(fontSize: 16)),
                            onPressed: (){
                              _submit();
                            },
                            splashColor: Colors.black,
                            shape:RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),

                        ],
                      ),
                    ),
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}
