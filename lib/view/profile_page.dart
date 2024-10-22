import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Profile",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Icon(
                      Icons.notifications_outlined,
                      size: 35,
                    )
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.black54,
                      backgroundImage: NetworkImage(
                          "${FirebaseAuth.instance.currentUser!.photoURL}"),
                    ),
                    SizedBox(width: size.width * 0.06),
                    Text.rich(
                      TextSpan(
                        text:
                            "${FirebaseAuth.instance.currentUser!.displayName}\n",
                        style:
                            const TextStyle(fontSize: 20, color: Colors.black),
                        children: const [
                          TextSpan(
                            text: "Show profile",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios)
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(color: Colors.black12),
                const SizedBox(height: 10),
                Card(
                  elevation: 4,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 25,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text.rich(
                          TextSpan(
                            text: "Airbnb your place\n",
                            style: TextStyle(
                              height: 2.5,
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text:
                                    "It's simple to get set up and \nstart earning.",
                                style: TextStyle(
                                  height: 1.2,
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Image.network(
                          "https://static.vecteezy.com/system/resources/previews/034/950/530/non_2x/ai-generated-small-house-with-flowers-on-transparent-background-image-png.png",
                          height: 140,
                          width: 135,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(color: Colors.black12),
                const SizedBox(height: 15),
                const Text(
                  "Settings",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 20),
                profileInfo(Icons.person_2_outlined, "Personal information"),
                profileInfo(Icons.security, "Login & security"),
                profileInfo(Icons.payments_outlined, "Payments and payouts"),
                profileInfo(Icons.settings_outlined, "Accessibility"),
                profileInfo(Icons.note_outlined, "Taxes"),
                profileInfo(Icons.person_2_outlined, "Personal information"),
                profileInfo(Icons.translate, "Translation"),
                profileInfo(Icons.notifications_outlined, "Notifications"),
                profileInfo(Icons.lock_outline, "Privacy and sharing"),
                profileInfo(Icons.card_travel, "Travel for work"),
                const SizedBox(height: 15),
                const Text(
                  "Hosting",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 25),
                profileInfo(Icons.add_home_outlined, "List your space"),
                profileInfo(Icons.home_outlined, "Learn about hosting"),
                const SizedBox(height: 15),
                const Text(
                  "Support",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 25),
                profileInfo(Icons.help_outline, "Visit the Help Center"),
                profileInfo(Icons.health_and_safety_outlined,
                    "Get help with a safert issue"),
                profileInfo(Icons.ac_unit, "How Airbnb works"),
                profileInfo(Icons.edit_outlined, "Give us feedback"),
                const SizedBox(height: 15),
                const Text(
                  "Legal",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 25),
                profileInfo(Icons.menu_book_outlined, "Terms of Service"),
                profileInfo(Icons.menu_book_outlined, "Privacy Policy"),
                profileInfo(Icons.menu_book_outlined, "Open source licenses"),
                const SizedBox(height: 10),
                const Text(
                  "Log out",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(
                  color: Colors.black12,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Version 24.34 (28004615)",
                  style: TextStyle(fontSize: 10),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding profileInfo(icon, name) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 35,
                color: Colors.black.withOpacity(0.7),
              ),
              const SizedBox(width: 20),
              Text(
                name,
                style: const TextStyle(fontSize: 17),
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios)
            ],
          ),
          const SizedBox(height: 12),
          const Divider(
            color: Colors.black12,
          ),
        ],
      ),
    );
  }
}
