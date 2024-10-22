import 'package:airbnb_app_ui/Components/my_icon_button.dart';
import 'package:flutter/material.dart';
import '../model/message_model.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  List<String> messagesScreenType = ["All", "Traveling", "Support"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(),
                  const Spacer(),
                  MyIconButton(
                    radius: 23,
                    icon: Icons.search,
                    color: Colors.black12.withOpacity(0.03),
                  ),
                  const SizedBox(width: 10),
                  MyIconButton(
                    radius: 23,
                    icon: Icons.tune,
                    color: Colors.black12.withOpacity(0.03),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                "MessagesScreen",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    messagesScreenType.length,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 22,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? Colors.black
                                : Colors.black12.withOpacity(0.04),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            messagesScreenType[index],
                            style: TextStyle(
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ...messages.map((message) => _buildMessageItem(message)),
            ],
          ),
        ),
      ),
    );
  }

  // Build message item UI
  Widget _buildMessageItem(Message message) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 85,
                width: 75,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(message.image),
                  ),
                ),
              ),
              Positioned(
                bottom: -10,
                right: -18,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(message.vendorImage),
                  backgroundColor: Colors.white,
                  radius: 25,
                ),
              ),
            ],
          ),
          const SizedBox(width: 25),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      message.name,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                      ),
                    ),
                    Text(
                      message.date,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                Text(
                  message.description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    height: 1.1,
                    fontSize: 17,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  message.duration,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    height: 1.4,
                    fontSize: 17,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
