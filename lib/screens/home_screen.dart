import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_integration/constants/color_constant.dart';
import 'package:payment_integration/models/card_model.dart';
import 'package:payment_integration/widgets/donate_button.dart';
import 'package:payment_integration/widgets/invoice_card.dart';
import 'package:payment_integration/widgets/widgetToImage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _userName = "";
  String _userEmail = "";
  GlobalKey? key1;
  Uint8List? bytes;
  int index = 0;

  void getDetails(int index) {
    setState(() {
      _userName = getUserName(index);
      _userEmail = getEmail(index);
      this.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1F2933),
      body: Container(
        margin: EdgeInsets.only(top: 8),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Container(
              margin: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('assets/svg/drawer_icon.svg'),
                  Container(
                    height: 59,
                    width: 59,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/images/user-image3.png'),
                      ),
                    ),
                  )
                ],
              ),
            ),

            //Card Section

            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                bottom: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Good Morning',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: primaryTextColor,
                    ),
                  ),
                  Text(
                    'Hardik Bhagat',
                    style: GoogleFonts.inter(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: secondaryTextColor,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 199,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 16, right: 16),
                itemCount: cards.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    height: 199,
                    width: 344,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      color: Color(
                        cards[index].cardBackground as int,
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        getDetails(index);
                      },
                      child: Stack(
                        children: [
                          Positioned(
                            left: 29,
                            top: 48,
                            child: Text(
                              'CARD NUMBER',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: cards[index].textColor,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 29,
                            top: 65,
                            child: Text(
                              cards[index].cardNumber as String,
                              style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: cards[index].textColor,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 21,
                            top: 35,
                            child: Image.asset(
                              cards[index].cardType as String,
                              width: 27,
                              height: 27,
                            ),
                          ),
                          Positioned(
                            left: 29,
                            bottom: 45,
                            child: Text(
                              'CARD HOLDER NAME',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: cards[index].textColor,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 29,
                            bottom: 21,
                            child: Text(
                              cards[index].user as String,
                              style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: cards[index].textColor,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 202,
                            bottom: 45,
                            child: Text(
                              'EXPIRY DATE',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: cards[index].textColor,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 202,
                            bottom: 21,
                            child: Text(
                              cards[index].cardExpired as String,
                              style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: cards[index].textColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            WidgetToImage(
              builder: (key) {
                this.key1 = key;
                return InvoiceCard(_userName, _userEmail, index);
              },
            ),
            DonateButton(key1, bytes, index),
          ],
        ),
      ),
    );
  }
}
