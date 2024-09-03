import 'package:airbnb_app_ui/view/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

// class CustomCarousel extends StatefulWidget {
//   @override
//   _CustomCarouselState createState() => _CustomCarouselState();
// }

// class _CustomCarouselState extends State<CustomCarousel> {
//   int _currentIndex = 0;
//   final int _totalSlides = 5; // Update this to the total number of slides

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(
//             height: 400,
//             child: AnotherCarousel(
//               images: [
//                 Container(
//                   color: Colors.red,
//                 ),
//                 Container(
//                   color: Colors.blue,
//                 ),
//                 Container(
//                   color: Colors.green,
//                 ),
//                 Container(
//                   color: Colors.yellow,
//                 ),
//                 Container(
//                   color: Colors.orange,
//                 ),
//               ],
//               onImageChange: (previousIndex, currentIndex) {
//                 setState(() {
//                   _currentIndex = currentIndex;
//                 });
//               },
//               dotBgColor: Colors.transparent, // Hide the dot indicators
//               showIndicator: false, // Disable default indicators
//               autoplay: true,
//               boxFit: BoxFit.cover,
//             ),
//           ),
//           const SizedBox(height: 10.0),
//           Text(
//             '${_currentIndex + 1} / $_totalSlides',
//             style: const TextStyle(fontSize: 18.0),
//           ),
//         ],
//       ),
//     );
//   }
// }