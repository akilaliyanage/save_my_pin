import 'package:flutter/material.dart';

import 'constants.dart';

class PasswordList extends StatelessWidget {
  const PasswordList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(
            // left: kDefaultPadding,
            // right: kDefaultPadding,
            bottom: kDefaultPadding * 0.5,
          ),
          child: Column(
            children: <Widget>[
              ListCard(),
              ListCard(),
              ListCard(),
              ListCard(),
              ListCard(),
              ListCard(),
            ],
          ),
        ));
  }


}


class ListCard extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.95,
      child: Padding(
        padding: const EdgeInsets.only(
          left: kDefaultPadding /2,
          right: kDefaultPadding / 2,
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.only(
            left: kDefaultPadding,
            bottom: kDefaultPadding * 0.5,
          ),
          elevation: 2,
          child: Padding(padding: const EdgeInsets.only(
            right: kDefaultPadding,
              top: kDefaultPadding /2,
              bottom: kDefaultPadding / 2,
            ),
            child: Row(
              children: [
                Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(
                        left: kDefaultPadding * 0.8,
                        right: kDefaultPadding * 0.8
                      ),
                      child: Icon(
                        Icons.lock,
                        color: kPrimaryColor,
                      ),
                    )
                  ],
                ),
                Column(
                  children: const [
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'Website Name',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'Username',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 15.0, color: Colors.black54),
                      ),
                    ),
                    
                    Text(
                      'Password',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 15.0, color: Colors.black54),
                    ),
                    
                  ],
                ),
                Spacer(),
                Column(
                  children: const [
                    Padding(padding: EdgeInsets.only(right: kDefaultPadding * 0.3),
                      child: Text(
                      'Edit',
                      style: TextStyle(fontSize: 15.0, color: Colors.blue),
                      
                    ),
                    )
                  ],
                ),
                Column(
                  children: [
                    // Icon(
                    //   Icons.edit,
                    //   color: Colors.blue,
                    // ),
                    Icon(
                      Icons.delete,
                      color: Color.fromARGB(255, 236, 153, 152),
                    )
                  ],
                )
              ],
            )
          )
        )
      )
    );
  }

}