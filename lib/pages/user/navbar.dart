import 'package:flutter/material.dart';
import 'package:save_my_pin/auth/Auth.dart';
import 'package:save_my_pin/pages/user/login.dart';

class navBar extends StatefulWidget {
  const navBar({Key? key}) : super(key: key);

  @override
  State<navBar> createState() => _navBarState();
}

class _navBarState extends State<navBar> {
  String username = Auth.user.username;

  Future logout() async {
    await Auth.logoutUser();
    Navigator.pushNamed(context, Login.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
              child: Center(
                child: Row(
                  children: [
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
                        username,
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
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () => {Navigator.pushNamed(context, '/access')},
          ),
          const Divider(color: Color.fromARGB(255, 204, 204, 204)),
          ListTile(
            title: Center(
              child: RichText(
                text: const TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.logout,
                        size: 30,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () => {logout()},
          ),
        ],
      ),
    );
  }
}
