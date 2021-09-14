import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/avatar.png',
                  height: 100,
                  width: 100,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: "John",
                        style: TextStyle(),
                        decoration: InputDecoration(
                            labelText: "First Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        initialValue: "Adams",
                        style: TextStyle(),
                        decoration: InputDecoration(
                            labelText: "Last Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        initialValue: "HelloWorld Technologies",
                        style: TextStyle(),
                        decoration: InputDecoration(
                            labelText: "Business Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        initialValue: "15",
                        style: TextStyle(),
                        decoration: InputDecoration(
                            labelText: "Employee Count",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0))),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Update",
                        ),
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xff58d15a)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
