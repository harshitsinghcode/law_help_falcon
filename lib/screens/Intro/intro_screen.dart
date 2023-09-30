// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:law_help/screens/login/login_method.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (value) {
              setState(() {
                onLastPage = value == 3;
              });
            },
            controller: _controller,
            children: [
              buildIntroductionPage(),
              buildClientFeaturesPage(),
              buildLawyerFeaturesPage(),
              buildCourtFeaturesPage(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        _controller.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
                    ),
                  ),
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 4,
                  ),
                  GestureDetector(
                    child: Text(
                      onLastPage ? "Done" : "Next",
                      style: const TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      if (onLastPage) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIntroductionPage() {
    return Container(
      color: Colors.blueGrey[800],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(100.0),
            child: Column(
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.orangeAccent),
                ),
                Text(
                  "to",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  "न्याय Sahaya",
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/law.png',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 16),
                const Text(
                  "Empowering Undertrial Prisoners",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Legal Aid, Simplified and Accessible.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildClientFeaturesPage() {
    return Container(
      color: Colors.blueGrey[700],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "For undertrials",
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/profile.png',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 16),
                const Text(
                  "Your Path to Fairness",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildBulletPoint("Legal Education and Awareness"),
                    buildBulletPoint("Case Monitoring and Updates"),
                    buildBulletPoint("Direct Comms with Your Lawyer"),
                    buildBulletPoint("Emotional Support and Counseling"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLawyerFeaturesPage() {
    return Container(
      color: Colors.blueGrey[600],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "For Lawyers",
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/lawyer.png',
                  width: 100,
                  height: 150,
                ),
                const SizedBox(height: 16),
                const Text(
                  "Your Ultimate Legal Toolkit",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildBulletPoint("Effortless Case Management"),
                    buildBulletPoint("Courtroom Preparation"),
                    buildBulletPoint("Stay Updated on Legal Trends"),
                    buildBulletPoint("Client Relationship Management"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCourtFeaturesPage() {
    return Container(
      color: Colors.blueGrey[500],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "For Court Officials",
            style: TextStyle(
                fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/court.png',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 16),
                const Text(
                  " Pioneering Judicial Efficiency ",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildBulletPoint("Integration with Court Systems"),
                    buildBulletPoint("Streamlined Case Tracking"),
                    buildBulletPoint("Efficient Hearing Management"),
                    buildBulletPoint("Paperless Court Record Management"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.check_circle,
            size: 16,
            color: Colors.white,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
