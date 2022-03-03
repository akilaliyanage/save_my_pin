import 'package:flutter/material.dart';
import 'package:save_my_pin/pages/auth/services.dart';

class Access extends StatefulWidget {
  static const String routeName = '/access';
  const Access({Key? key}) : super(key: key);

  @override
  _AccessState createState() => _AccessState();
}

class _AccessState extends State<Access> {
  final List<Service> entries = <Service>[
    Service(
        image:
            "https://images.unsplash.com/photo-1619972898592-5de4b1c68025?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1031&q=80",
        name: "Secure Notes"),
    Service(
        image:
            "https://images.unsplash.com/photo-1634979149798-e9a118734e93?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80",
        name: "Secure Pin"),
    Service(
        image:
            "https://images.unsplash.com/photo-1609429019995-8c40f49535a5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1469&q=80",
        name: "Secure Cards"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Logout'),
      ),
      body: Column(
        children: [
          Flexible(
            flex: 8,
            child: ListView.builder(
                itemCount: entries.length,
                itemBuilder: (context, index) {
                  Service item = entries.elementAt(index);
                  return GestureDetector(
                    onTap: () => showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title: Text('Test'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            )),
                    child: SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Card(
                        elevation: 10,
                        margin: EdgeInsets.all(10),
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(item.image),
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                          child: Text(item.name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
