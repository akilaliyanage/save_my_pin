import 'package:flutter/material.dart';
import 'package:save_my_pin/pages/user/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/tap_bounce_container.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../auth/Auth.dart';
import '../../models/User.dart';
import '../../utils/connection.dart';

class Members extends StatefulWidget {
  static const String routeName = '/members';
  const Members({Key? key}) : super(key: key);

  @override
  _MembersState createState() => _MembersState();
}

class _MembersState extends State<Members> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static final storage = new FlutterSecureStorage();
  User user = User('', '', '', '', '');
  String username = "";
  String access_key = "";

  late List<User> members = [];
  late String _groupId;

  Future getUsers() async {
    final String groupId = await Auth.getGroupId();
    setState(() {
      _groupId = groupId;
    });
    var res = await http.get(
        Uri.parse(Connection.baseUrl + "/user/group/" + _groupId),
        headers: <String, String>{
          'Content-Type': 'application/json;charSet=UTF-8'
        }).then((response) {
      var result = jsonDecode(response.body);
      setState(() {
        Iterable list = json.decode(response.body);
        members = list.map((model) => User.fromJson(model)).toList();
      });
    });
  }

  Future addMember() async {
    var adminId = await Auth.getUserId();
    var res = await http.post(
        Uri.parse(Connection.baseUrl + "/user/add_member"),
        headers: <String, String>{
          'Content-Type': 'application/json;charSet=UTF-8'
        },
        body: jsonEncode(<String, String>{
          'username': username,
          'access_code': access_key,
          'admin': adminId
        }));
    var result = jsonDecode(res.body);
    if (result['status'] == 201) {
      showTopSnackBar(
        context,
        const CustomSnackBar.success(
          message: "New Member Added!",
        ),
      );
      Navigator.pushNamed(context, '/members');
    } else if (result['status'] == 401) {
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: "Member Already exist!",
        ),
      );
    } else {
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: "Something went rong!",
        ),
      );
    }
  }

  Future removeMember(id) async {
    var res = await http.delete(
        Uri.parse(Connection.baseUrl + "/user/remove_member/" + id),
        headers: <String, String>{
          'Content-Type': 'application/json;charSet=UTF-8'
        });
    var result = jsonDecode(res.body);
    if (result['status'] == 200) {
      showTopSnackBar(
        context,
        CustomSnackBar.success(
          message: "Member Removed!",
        ),
      );
      getUsers();
      Navigator.pushNamed(context, '/members');
    } else {
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: "Something went rong!",
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

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
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Flexible(
              flex: 5,
              child: ListView.separated(
                padding: const EdgeInsets.all(5),
                itemCount: members.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 8,
                    child: ListTile(
                      title: Text(members[index].username),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          removeMember(members[index].id);
                        },
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
                                                  username = value;
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
                                                  access_key = value;
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
                                  addMember();
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
