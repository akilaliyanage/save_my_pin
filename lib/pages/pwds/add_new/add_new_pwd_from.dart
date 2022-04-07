import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:save_my_pin/pages/pwds/constants.dart';
import 'package:save_my_pin/api/http_service_password.dart';

class NewPwdForm extends StatefulWidget {
  const NewPwdForm({Key? key}) : super(key: key);

  @override
  State<NewPwdForm> createState() => _NewPwdFormState();
}

class _NewPwdFormState extends State<NewPwdForm> {
  String website = '';
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(30, 40, 30, 40),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    this.website = value;
                    print(website);
                  },
                  decoration: InputDecoration(
                    hintText: "Enter the website",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: kIconColor,
                    //filled: true,
                    //enabledBorder: InputBorder.none,
                    //focusedBorder: InputBorder.none,
                    hintStyle: TextStyle(
                      color: kPrimaryColor.withOpacity(1),
                    ),
                    // surffix isn't working properly  with SVG
                    // thats why we use row
                    // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    this.username = value;
                    print(username);
                  },
                  decoration: InputDecoration(
                    hintText: "Enter the username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: kIconColor,
                    //filled: true,
                    //enabledBorder: InputBorder.none,
                    //focusedBorder: InputBorder.none,
                    hintStyle: TextStyle(
                      color: kPrimaryColor.withOpacity(1),
                    ),
                    // surffix isn't working properly  with SVG
                    // thats why we use row
                    // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    this.password = value;
                    print(password);
                  },
                  decoration: InputDecoration(
                    hintText: "Enter the password for secure",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: kIconColor,
                    //filled: true,
                    //enabledBorder: InputBorder.none,
                    //focusedBorder: InputBorder.none,
                    hintStyle: TextStyle(
                      color: kPrimaryColor.withOpacity(1),
                    ),
                    // surffix isn't working properly  with SVG
                    // thats why we use row
                    // suffixIcon: SvgPicture.asset("assets/icons/search.svg"),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            constraints: BoxConstraints(minHeight: 50.0),
            margin: EdgeInsets.all(10),
            child: RaisedButton(
              onPressed: () async {
                HttpServicePassword securePassword = new HttpServicePassword();

                bool response = await securePassword.savePwd(website, username, password);

                if (response) {
                  Alert(
                    context: context,
                    type: AlertType.success,
                    title: "PASSWORD SAVED SUCCESSSFULLY!!",
                    //desc: "Flutter is more awesome with RFlutter Alert.",
                    buttons: [
                      DialogButton(
                        child: Text(
                          "OK",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () => Navigator.pop(context),
                        color: Color.fromRGBO(0, 179, 134, 1.0),
                      )
                    ],
                  ).show();
                }else{
                  Alert(
                    context: context,
                    type: AlertType.error,
                    title: "SAVING NOT SUCCESSSFUL!!",
                    //desc: "Flutter is more awesome with RFlutter Alert.",
                    buttons: [
                      DialogButton(
                        child: Text(
                          "OK",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () => Navigator.pop(context),
                        color: Color.fromRGBO(0, 179, 134, 1.0),
                      )
                    ],
                  ).show();
                }
              },
              color: kPrimaryColor,
              child: Padding(
                padding: EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      const Text(
                        'Save Password',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
