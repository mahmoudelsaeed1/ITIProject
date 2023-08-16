import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "About App",
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: const Color(0xff35B700),
      ),
      body: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(16.0),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to our cutting-edge eCommerce app, where shopping becomes an immersive and convenient experience like never before. Discover a world of limitless possibilities at your fingertips, as we redefine the way you shop.",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              "Explore a wide range of products from fashion to electronics, all in one place. Effortlessly search, browse categories, and enjoy hassle-free transactions. Get real-time order updates and reliable customer support. Shop securely with multiple payment options. Easy returns and exchanges ensure your satisfaction.",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              "Join our growing community of happy shoppers. Elevate your shopping experience – download the app now!",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
