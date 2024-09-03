import 'package:airbnb_app_ui/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("Conform your number"),
      ),
      body: Column(
        children: [
          const Divider(color: Colors.black12),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Enter the code we've sent via SMS to +977 9812345670:",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Container(
                  height: size.height * 0.065,
                  width: size.width * 0.5,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26, width: 1.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("_"),
                      Text("_"),
                      Text("_"),
                      Text("_"),
                      Text("_"),
                      Text("_"),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  children: [
                    Text(
                      "Haven't receive a code?   ",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "More options",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(height: size.height * 0.05),
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
                      color: Colors.black26,
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
                SizedBox(height: size.height * 0.05),
                const Center(
                  child: Text(
                    "Need help?",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            iconSize: 30,
            elevation: 0,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.black45,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            currentIndex: selectedIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Image.network(
                  "https://cdn3.iconfinder.com/data/icons/feather-5/24/search-512.png",
                  height: 30,
                  color:
                      selectedIndex == 0 ? Colors.pinkAccent : Colors.black45,
                ),
                label: "Explore",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border,
                  color:
                      selectedIndex == 1 ? Colors.pinkAccent : Colors.black45,
                ),
                label: "Wishlist",
              ),
              BottomNavigationBarItem(
                icon: Image.network(
                  "https://cdn-icons-png.flaticon.com/512/1144/1144760.png",
                  color:
                      selectedIndex == 2 ? Colors.pinkAccent : Colors.black45,
                  height: 30,
                ),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
