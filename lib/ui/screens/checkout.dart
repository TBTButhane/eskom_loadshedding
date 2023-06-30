import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';


class CheckOutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CheckOutPageState();
  }
}

class CheckOutPageState extends State<CheckOutPage> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Credit Card View Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title:Text("Check Out"),
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
            Navigator.of(context).pop();
          }),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              CreditCardWidget(
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: CreditCardForm(
                    onCreditCardModelChange: onCreditCardModelChange,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right:50, left: 50, bottom: 25),
                alignment: Alignment.center,
                
                child: FlatButton(
                  color: Colors.green,
                  onPressed: (){}, child: Row(
                    children: <Widget>[
                      Text("            Proceeed to Pay", style: TextStyle(color:Colors.white), textAlign: TextAlign.center,),
                      SizedBox(width:20),
                      Icon(Icons.payment)
                    ],
                  )),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}