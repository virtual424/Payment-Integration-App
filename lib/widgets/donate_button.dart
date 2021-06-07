import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:payment_integration/models/capture.dart';
import 'package:payment_integration/models/card_model.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_integration/constants/color_constant.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class DonateButton extends StatefulWidget {
  GlobalKey? key1;
  Uint8List? bytes;
  int index;

  DonateButton(this.key1, this.bytes, this.index);
  @override
  _DonateButtonState createState() => _DonateButtonState();
}

class _DonateButtonState extends State<DonateButton> {
  late Razorpay razorpay;

  @override
  void initState() {
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentAccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerPaymentError);
    super.initState();
  }

  void sendMail() async {
    String username = "virtualettin586@gmail.com";
    String password = 'CortanaAndSiri';

    final smtpServer = gmail(username, password);
    // Use the SmtpServer class to configure an SMTP server:
    // final smtpServer = SmtpServer('smtp.domain.com');
    // See the named arguments of SmtpServer for further configuration
    // options.

    // Create our message.
    final message = Message()
      ..from = Address(username, 'Hardik Bhagat')
      ..recipients.add("virtualettin586@gmail.com")
      ..subject = 'Donation :: 😀 :: ${DateTime.now()}'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.';

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

  void openCheckout() {
    var options = {
      "key": "rzp_test_4U3tj84DSQHlPs",
      "name": cardData[widget.index]["user"],
      "description": "Payment for the donation",
      "amount": cardData[widget.index]["amount"],
      "prefill": {
        "contact": cardData[widget.index]["contact"],
        "email": cardData[widget.index]["Email"]
      },
    };

    try {
      razorpay.open(options);
    } catch (e) {
      print('paymentFaliure');
    }
  }

  void handlerPaymentAccess(response) async {
    final bytes = await Capture.capture(widget.key1);
    sendMail();
  }

  void handlerPaymentError() {
    print("payment error");
  }

  @override
  void dispose() {
    razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16,
      ),
      child: ElevatedButton(
        child: Text('Donate', style: GoogleFonts.inter(fontSize: 20)),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20),
          primary: btnColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
        ),
        onPressed: () {
          openCheckout();
        },
      ),
    );
  }
}
