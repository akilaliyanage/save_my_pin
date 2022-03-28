import 'package:flutter/material.dart';
import 'package:save_my_pin/pages/akila/constants.dart';

class NewSecureNoteForm extends StatelessWidget {
  const NewSecureNoteForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 8),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: TextField(
                  onChanged: (value) {
                    print(value);
                  },
                  decoration: InputDecoration(
                    hintText: "Enter the secure note name",
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
                    print(value);
                  },
                  maxLines: 20,
                  decoration: InputDecoration(
                    hintText: "Enter or paste the secure note here...",
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
          Container(
            constraints: BoxConstraints( minHeight: 50.0),
            margin: EdgeInsets.all(10),
            child: RaisedButton(
              onPressed: () {},
              color: Theme.of(context).accentColor,
              child: Padding(
                padding: EdgeInsets.all(0),
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      const Text(
                        'Save Note',
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
