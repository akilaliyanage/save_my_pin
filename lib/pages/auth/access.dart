import 'package:flutter/material.dart';
import 'package:save_my_pin/pages/auth/services.dart';
import 'package:save_my_pin/pages/auth/login.dart';

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
            "https://thumbs.dreamstime.com/b/data-protection-cyber-security-privacy-business-internet-technology-concept-97070175.jpg",
        name: "Secure Pin"),
    Service(
        image:
            "https://t3.ftcdn.net/jpg/02/22/85/00/360_F_222850000_8nml6uLzmekcXvWxUSUCHZtZ7n8NWMCV.jpg",
        name: "Secure Cards"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Save My Pin'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Login.routeName);
              },
              icon: Icon(Icons.logout))
        ],
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
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Access Key'),
                            content: TextField(
                              onChanged: (value) {
                                //  setState(() {
                                //    valueText = value;
                                //  });
                              },
                              decoration: const InputDecoration(
                                  hintText: "Insert Your Access Key"),
                            ),
                            actions: <Widget>[
                              FlatButton(
                                color: Colors.green,
                                textColor: Colors.white,
                                child: const Text('OK'),
                                onPressed: () {
                                  setState(() {
                                    //codeDialog = valueText;
                                    Navigator.pop(context);
                                  });
                                },
                              ),
                            ],
                          );
                        }),
                    child: SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Card(
                        elevation: 10,
                        margin: const EdgeInsets.all(10),
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
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(item.name,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25)),
                          ),
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
