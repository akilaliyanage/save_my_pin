import 'package:flutter/material.dart';
import 'package:save_my_pin/pages/auth/login.dart';

class Members extends StatefulWidget {
  static const String routeName = '/members';
  const Members({Key? key}) : super(key: key);

  @override
  _MembersState createState() => _MembersState();
}

class _MembersState extends State<Members> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> entries = <String>[
    'Member 01',
    'Member 02',
    'Member 03',
    'Member 04'
  ];
  final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(Login.routeName);
              },
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: Column(
        children: [
          Flexible(
              flex: 5,
              child: ListView.separated(
                padding: const EdgeInsets.all(5),
                itemCount: entries.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 8,
                    child: ListTile(
                      title: Text('${entries[index]}'),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              )),
          Flexible(
              flex: 5,
              child: Scaffold(
                body: Container(
                    child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        child: const Center(
                          child: Text(
                            "Add new Member",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: Form(
                                      key: _formKey,
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Material(
                                              elevation: 5.0,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              child: TextFormField(
                                                controller:
                                                    TextEditingController(
                                                        text: ""),
                                                onChanged: (value) {
                                                  // user.email = value;
                                                },
                                                validator: (String? value) {
                                                  if (value!.isEmpty) {
                                                    return 'Name is Required';
                                                  }
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                  border: InputBorder.none,
                                                  prefixIcon: Icon(
                                                    Icons.person,
                                                    color: Colors.blue,
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.only(top: 15),
                                                  hintText: 'Name',
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Material(
                                              elevation: 5.0,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              child: TextFormField(
                                                controller:
                                                    TextEditingController(
                                                        text: ""),
                                                onChanged: (value) {
                                                  // user.password = value;
                                                },
                                                validator: (String? value) {
                                                  if (value!.isEmpty) {
                                                    return 'Access Code is Required';
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                decoration:
                                                    const InputDecoration(
                                                  border: InputBorder.none,
                                                  prefixIcon: Icon(
                                                    Icons.key,
                                                    color: Colors.blue,
                                                  ),
                                                  contentPadding:
                                                      EdgeInsets.only(top: 15),
                                                  hintText: 'Access Code',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            FlatButton(
                              color: Colors.blue,
                              padding: const EdgeInsets.all(20.0),
                              minWidth: 200.0,
                              hoverColor: Colors.blue,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // save();
                                }
                              },
                              child: Text('Add',
                                  style: TextStyle(color: Colors.white)),
                              focusColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Colors.blue,
                                      width: 1,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
              ))
        ],
      ),
    );
  }
}
