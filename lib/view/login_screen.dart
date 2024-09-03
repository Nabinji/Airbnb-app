import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/bottom_nav_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Log in or sign up",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                color: Colors.black12,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Welcome to Airbnb",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    phoneNumberField(size),
                    const SizedBox(height: 10),
                    RichText(
                      text: const TextSpan(
                        text:
                            "We'll call or text you to conform your number. Standart message and data rates apply.  ",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Privacy Policy',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const BottomNavBar(),
                          ),
                        );
                      },
                      child: Container(
                        width: size.width,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.pink,
                        ),
                        child: const Center(
                          child: Text(
                            "Continue",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.026),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.black26,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "or",
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: Colors.black26,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: size.height * 0.015),
                    sociaIcons(
                      size,
                      Icons.facebook,
                      "Continue with Facebook",
                      Colors.blue,
                      30,
                    ),
                    sociaIcons(
                      size,
                      FontAwesomeIcons.google,
                      "Continue with Google",
                      Colors.pink,
                      27,
                    ),
                    sociaIcons(
                      size,
                      Icons.apple,
                      "Continue with Apple",
                      Colors.black,
                      30,
                    ),
                    sociaIcons(
                      size,
                      Icons.email_outlined,
                      "Continue with email",
                      Colors.black,
                      30,
                    ),
                    const SizedBox(height: 10),
                    const Center(
                      child: Text(
                        "Need help?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(
      //     border: Border.all(
      //       color: Colors.black12,
      //     ),
      //   ),
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 30),
      //     child: BottomNavigationBar(
      //       backgroundColor: Colors.white,
      //       iconSize: 30,
      //       elevation: 0,
      //       selectedItemColor: Colors.black,
      //       unselectedItemColor: Colors.black45,
      //       selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      //       unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      //       currentIndex: selectedIndex,
      //       type: BottomNavigationBarType.fixed,
      //       onTap: (index) {
      //         setState(() {
      //           selectedIndex = index;
      //         });
      //       },
      //       items: [
      //         BottomNavigationBarItem(
      //           icon: Image.network(
      //             "https://cdn3.iconfinder.com/data/icons/feather-5/24/search-512.png",
      //             height: 30,
      //             color:
      //                 selectedIndex == 0 ? Colors.pinkAccent : Colors.black45,
      //           ),
      //           label: "Explore",
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Icon(
      //             Icons.favorite_border,
      //             color:
      //                 selectedIndex == 1 ? Colors.pinkAccent : Colors.black45,
      //           ),
      //           label: "Wishlist",
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Image.network(
      //             "https://cdn-icons-png.flaticon.com/512/1144/1144760.png",
      //             color:
      //                 selectedIndex == 2 ? Colors.pinkAccent : Colors.black45,
      //             height: 30,
      //           ),
      //           label: "Profile",
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  Container phoneNumberField(Size size) {
    return Container(
      width: size.width,
      height: 130,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10, left: 10, top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Country/Regin",
                  style: TextStyle(
                    color: Colors.black45,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nepal(+977)",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_sharp,
                      size: 30,
                    )
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Phone number",
                hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black45,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding sociaIcons(Size size, icon, name, color, double iconSize) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        width: size.width,
        padding: const EdgeInsets.symmetric(vertical: 11),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: size.width * 0.05),
            Icon(
              icon,
              color: color,
              size: iconSize,
            ),
            SizedBox(width: size.width * 0.18),
            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
