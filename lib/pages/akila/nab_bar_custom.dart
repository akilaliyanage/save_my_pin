import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: camel_case_types
class navBarCustom extends StatelessWidget {
  const navBarCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
