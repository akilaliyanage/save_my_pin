import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'constants.dart';

// ignore: camel_case_types
class PwdnavBarCustom extends StatelessWidget {
  const PwdnavBarCustom({
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
                color: kPrimaryColor2,
              ),
              child: Center(
                child: Row(
                  children: const [
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 255, 255, 255),
                      child: Text('U'),
                      radius: 40,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 6,
                      child: Text(
                        "User Name",
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
                        color: kPrimaryColor2,
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
            onTap: () => {},
            
          ),
          const Divider(
              color: Color.fromARGB(255, 204, 204, 204)
          ),
          ListTile(
            title: const Center(
                child: Text(
              "Secure Notes",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            onTap: () => {},
          ),
          const Divider(
              color: Color.fromARGB(255, 204, 204, 204)
          ),
          ListTile(
            title: const Center(
                child: Text(
              "Secure Card Details",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            onTap: () => {},
          ),
          const Divider(
              color: Color.fromARGB(255, 204, 204, 204)
          ),
          ListTile(
            title: const Center(
                child: Text(
              "My Profile",
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            onTap: () => {},
          ),
          const Divider(
              color: Color.fromARGB(255, 204, 204, 204)
          ),
          // ListTile(
          //   title: const Center(
          //       child: Text(
          //     "ALL NOTES",
          //     style: TextStyle(fontWeight: FontWeight.bold),
          //   )),
          //   onTap: () => {},
          // )
        ],
      ),
    );
  }
}
