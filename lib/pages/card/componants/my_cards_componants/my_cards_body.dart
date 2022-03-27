import 'package:flutter/material.dart';
import 'package:save_my_pin/api/http_service_cards.dart';
import 'package:save_my_pin/pages/card/componants/my_cards_componants/my_card.dart';
import '../../../../auth/Auth.dart';
import '../../../../models/CreditCard.dart';
import '../basic_componants/card_header.dart';


class MyCardsBody extends StatefulWidget {

  @override
  State<MyCardsBody> createState() => _MyCardsBodyState();
}

class _MyCardsBodyState extends State<MyCardsBody> {
  HttpServiceCard service= new HttpServiceCard();
  List<CreditCard> cards = [];

  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size? size = MediaQuery?.of(context).size;
    // it enable scrolling on smalldevice
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CardHeader(size: size , title: "My Cards", image: Image.asset("assets/images/creditCard.gif"),),
        FutureBuilder(
          future: service.getCards() ,
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: cards.length,
                    itemBuilder: (context, index) {
                      return MyCard();
                    });
              }else{
                return Text("Loading");
              }
            })
      ],
    );
  }
}
