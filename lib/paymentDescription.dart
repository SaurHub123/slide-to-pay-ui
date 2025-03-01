import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:gradient_slide_to_act/gradient_slide_to_act.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  double totalPrice = 399.0; // Total price including GST
  double gstRate = 18.0; // GST percentage

  double basePrice = 0; // Calculate base price
  double gstAmount = 0; // Calculate GST amount

  @override
  void initState() {
    // TODO: implement initState
    basePrice = totalPrice / (1 + (gstRate / 100)); // Calculate base price
    gstAmount = totalPrice - basePrice;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Container(
              height: 22.h,
              width: 100.w,
              padding: EdgeInsets.symmetric(horizontal: 6.w),
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2.h),
                  Text(
                    "Payment",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 22.sp,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    "Book your slot ",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(height: 3.h),
                ],
              ),
            ),

            // Price Breakdown Section
            Container(
              width: 100.w,
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
              decoration: const BoxDecoration(color: Color(0xFFF7F6F9)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Total Price Display
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '₹',
                        style: GoogleFonts.poppins(
                          fontSize: 24.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        totalPrice.toStringAsFixed(2),
                        style: GoogleFonts.poppins(
                          fontSize: 24.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        ' INR',
                        style: GoogleFonts.poppins(
                          fontSize: 20.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 1.h),
                  Divider(thickness: 1.5, color: Colors.black38),
                  SizedBox(height: 1.5.h),

                  // Price Breakdown
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      priceRow("Base Price", basePrice),
                      priceRow("GST (18%)", gstAmount),
                      priceRow("Total Amount", totalPrice, isBold: true),
                      SizedBox(height: 2.h),
                      Text(
                        "Includes 18% GST as per Indian Government regulations.",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Benefits Section
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "What's Included?",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 1.5.h),
                  featureRow("Messaging"),
                  featureRow("Analytics"),
                  featureRow("Priority Support"),
                  featureRow("Exclusive Discounts"),
                  SizedBox(height: 2.h),
                  Text(
                    "Learn More",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),

            // Payment Method Section
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 3.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4.h),
                   GradientSlideToAct(
                    dragableIcon: Icons.credit_card,
                    submittedIcon: Icons.done,
                    text: 'Pay using Card / UPI / Net Banking',
                      width: 400,
                      dragableIconBackgroundColor: Colors.greenAccent,
                      textStyle: TextStyle(color: Colors.white, fontSize: 15),
                      backgroundColor: Colors.grey,
                      onSubmit: () {},
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0Xff11998E),
                            Color(0Xff38EF7D),
                          ]),
                    ),
                    SizedBox(height: 4.h),
                    GradientSlideToAct(
                      dragableIcon: Icons.wallet,
                      text: 'Pay using Wallet Balance',
                      width: 400,
                      dragableIconBackgroundColor: Colors.greenAccent,
                      submittedIcon: Icons.done,
                      textStyle: TextStyle(color: Colors.white, fontSize: 15),
                      backgroundColor: Colors.grey,
                      onSubmit: () {},
                      gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0Xff11998E),
                            Color(0Xff38EF7D),
                          ]),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Price Breakdown Row Widget
  Widget priceRow(String title, double amount, {bool isBold = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 15.sp,
              fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
              color: isBold ? Colors.black : Colors.grey[700],
            ),
          ),
          Text(
            "₹${amount.toStringAsFixed(2)}",
            style: GoogleFonts.poppins(
              fontSize: 15.sp,
              fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
              color: isBold ? Colors.black : Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  // Feature Row Widget
  Widget featureRow(String feature) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.7.h),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.green, size: 18.sp),
          SizedBox(width: 2.w),
          Text(
            feature,
            style: GoogleFonts.poppins(fontSize: 16.sp),
          ),
        ],
      ),
    );
  }

  // Input Field Widget
  Widget buildInputField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 14.sp, color: Colors.black),
        ),
        SizedBox(height: 1.h),
        Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle:
                  GoogleFonts.poppins(fontSize: 16.sp, color: Colors.grey),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}