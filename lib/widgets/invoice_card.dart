import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:payment_integration/constants/color_constant.dart';
import 'package:payment_integration/models/card_model.dart';

class InvoiceCard extends StatefulWidget {
  String userName = "";
  String userEmail = "";
  int index;

  TextEditingController _amountController = TextEditingController();

  InvoiceCard(this.userName, this.userEmail, this.index);

  @override
  _InvoiceCardState createState() => _InvoiceCardState();
}

class _InvoiceCardState extends State<InvoiceCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 35,
        left: 35,
        right: 35,
      ),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: invoiceBackgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(
              40,
            ),
          )),
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Invoice',
                    style: GoogleFonts.inter(
                      color: kBlackColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '#20/03/2021',
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '22 September 2021',
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.inventory_outlined,
                color: kBlackColor,
                size: 70,
              ),
            ],
          ),
          Divider(
            height: 35,
            color: Colors.white,
          ),
          Text(
            'Details :',
            style: GoogleFonts.inter(
                color: kBlackColor,
                fontSize: 17,
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
          ),
          SizedBox(height: 10),
          Text(
            'Name : ${widget.userName}',
            style: GoogleFonts.inter(
              color: kBlackColor,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Email : ${widget.userEmail}',
            style: GoogleFonts.inter(
              color: kBlackColor,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Payment type : Card',
            style: GoogleFonts.inter(
              color: kBlackColor,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 40),
          Container(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Amount:',
                  style: GoogleFonts.inter(
                    color: kBackgroundColor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 100,
                  child: TextField(
                    style: GoogleFonts.inter(
                      color: kBackgroundColor,
                      fontSize: 28,
                      fontWeight: FontWeight.w300,
                    ),
                    decoration: InputDecoration(
                      hintText: '0.00',
                      border: InputBorder.none,
                      hintStyle: GoogleFonts.inter(
                        color: kBackgroundColor,
                        fontSize: 28,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    cursorColor: kBackgroundColor,
                    cursorHeight: 28,
                    controller: widget._amountController,
                    onSubmitted: (value) {
                      cardData[widget.index]["amount"] = num.parse(value) * 100;
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
