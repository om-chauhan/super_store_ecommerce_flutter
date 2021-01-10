import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:super_store/components/app_name.dart';
import 'package:super_store/view/home/home.dart';

class RegisterHome extends StatefulWidget {
  @override
  _RegisterHomeState createState() => _RegisterHomeState();
}

class _RegisterHomeState extends State<RegisterHome> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _displayName = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isSuccess;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppName(),
                    SizedBox(
                      height: 30.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create Account',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _displayName,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              labelText: 'Full Name',
                              hintText: 'John Doe',
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              labelText: 'Email',
                              hintText: 'example@example.com',
                            ),
                            validator: (value) {
                              if (value.isEmpty || !value.contains('@')) {
                                return 'Invalid Email';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            obscuringCharacter: "*",
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              labelText: 'Password',
                              hintText: 'Password',
                            ),
                            validator: (value) {
                              if (value.isEmpty || value.length <= 5) {
                                return 'Invalid Pasword';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            obscureText: true,
                            obscuringCharacter: "*",
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              labelText: 'Confirm Password',
                              hintText: 'Confirm Password',
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Password Don't match";
                              }
                              return null;
                            },
                            onSaved: (value) {},
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.40,
                          height: 50.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xffF7C356),
                                Color(0xffF7C356),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            color: Colors.greenAccent,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                          ),
                          child: MaterialButton(
                            height: 55.0,
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _registerAccount();
                              }
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'SIGN UP',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.normal),
                                ),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Have have an account? "),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/LogIn');
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          color: Color(0xffFB8308),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _registerAccount() async {
    final User user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;

    if (user != null) {
      if (!user.emailVerified) {
        await user.sendEmailVerification();
        final ScaffoldMessengerState loginErrordMsg =
            ScaffoldMessenger.of(context);
        loginErrordMsg.showSnackBar(
          const SnackBar(content: Text('User Account created Sucessfully')),
        );
      }
      await user.updateProfile(displayName: _displayName.text);
      final user1 = _auth.currentUser;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Home(
            user: user1,
          ),
        ),
      );
    } else {
      _isSuccess = false;
    }
  }
}
