import 'package:cdpc/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cdpc/styles.dart';
import 'package:cdpc/res/validation.dart';

class Login extends StatefulWidget {
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<Login> {
  bool _isHidden = true;
  final textEditingController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Form(
          key: _formKey,
          // autovalidateMode: AutovalidateMode,
          child: Column(
            children: [
              SizedBox(height: height * 0.18),
              Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/rgukt_logo.jpg'),
                    radius: 75.0,
                  )),
              Style.textHeading('CDPC-RGUKTSKLM', Color(0xFF072F5F)),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: TextFormField(
                  controller: textEditingController,
                  validator: Validate.validateUsername,
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_circle),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: 'University ID',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: _isHidden,
                  validator: Validate.validatePassword,
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: 'Password',
                    suffix: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(
                          _isHidden ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 10, 0, 10),
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: ElevatedButton(
                      onPressed: _onSubmit,
                      style: elevatedButtonStyle,
                      child: Text('Login'),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('Forgot Password?'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _onSubmit() async {
    if (_formKey.currentState.validate()) {
      String email = textEditingController.text + '@rguktsklm.ac.in';

      dynamic result = await _auth.signIn(email, passwordController.text);
      if (result is String) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: Row(
              children: [
                Icon(
                  Icons.warning,
                  color: Color(0xFF1261A0),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(result)
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Ok'))
            ],
          ),
        );
      } else {
        print('signed in');
        print(result);
      }
    }
  }
}
