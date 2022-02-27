import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:animate_icons/animate_icons.dart';

class secure_notes_home extends StatefulWidget {
  secure_notes_home({Key? key}) : super(key: key);

  @override
  State<secure_notes_home> createState() => _secure_notes_homeState();
}

// ignore: camel_case_types
class _secure_notes_homeState extends State<secure_notes_home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SECURE NOTES")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Center(
                  child: Row(
                    children: const [
                      CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        child: Text('AL'),
                        radius: 50,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 6,
                        child: Text(
                          "Akila Liyanage",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            ListTile(
              title: Center(
                child: RichText(
                  text: const TextSpan(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      WidgetSpan(
                        child: Icon(
                          Icons.home,
                          size: 30,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () => {},
            ),
            ListTile(
              tileColor: Colors.blue,
              title: const Center(
                  child: Text(
                "CREATE NEW SECURE NOTE",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              onTap: () => {},
            ),
            ListTile(
              tileColor: Colors.white,
              title: const Center(
                  child: Text(
                "EDIT A SECURE NOTE",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              onTap: () => {},
            ),
            ListTile(
              tileColor: Colors.blue,
              title: const Center(
                  child: Text(
                "DELETE A SECURE NOTE",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              onTap: () => {},
            ),
            ListTile(
              tileColor: Colors.white,
              title: const Center(
                  child: Text(
                "ALL NOTES",
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
              onTap: () => {},
            )
          ],
        ),
      ),
      body: const Center(
          child: Text(
        "Home page",
        textScaleFactor: 2,
      )),
    );
  }
}
