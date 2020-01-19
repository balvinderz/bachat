import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Bachat"),
              SizedBox(
                height: 50,
              )
              ,
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(

                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.teal
                      ),
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    hintText: "username/email"
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal :20.0,vertical: 0.0),
                child: TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(

                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.teal
                          ),
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      hintText: "password"
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: MaterialButton(
                    color: Colors.tealAccent,
                    child: Text("Login"),
                    onPressed: (){},
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
