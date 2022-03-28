import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:save_my_pin/api/http_service_cards.dart';
import 'package:save_my_pin/pages/card/componants/my_cards_componants/my_card.dart';
import 'package:save_my_pin/pages/card/providers/device_provider.dart';
import '../../../../auth/Auth.dart';
import '../../../../models/CreditCard.dart';
import '../../../pwds/constants.dart';
import '../basic_componants/card_header.dart';


class MyCardsBody extends StatefulWidget {

  @override
  State<MyCardsBody> createState() => _MyCardsBodyState();
}

class _MyCardsBodyState extends State<MyCardsBody> {
  HttpServiceCard service= new HttpServiceCard();
  List<CreditCard> cards = [];

  Future<List<CreditCard>> getserCards() async {
    cards = await service.getCards();
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size? size = MediaQuery?.of(context).size;
    // it enable scrolling on smalldevice
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CardHeader(size: size , title: "My Cards", image: Image.asset("assets/images/creditCard.gif"),),
        Container(
          height: DeviceProvider.deviceHeight(context) * 0.65,
          child: FutureBuilder(
            future: getserCards() ,
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: cards.length,
                      itemBuilder: (context, index) {
                        return MyCard(cardNumber:cards[index].cardNumber , expiryDate:cards[index].expiryDate , cardHolderName:cards[index].cardHolderName , cvvCode:cards[index].cvvCode.toString());
                      });
                }else{
                  return Text("Loading");
                }
              }),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.fromLTRB(100, 10, 100, 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),
                primary: kPrimaryColor2

            ),
            onPressed: () async {
            },
            child: Container(
              child: const Text(
                'Add New Card',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            )
        )
      ],
    );
  }
}
