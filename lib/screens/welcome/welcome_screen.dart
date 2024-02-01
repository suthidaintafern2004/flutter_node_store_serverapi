import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_node_store/utils/app_route.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) async {

    // Set ค่าให้กับ SharedPreferences เพื่อบอกว่าเคยแสดง Intro แล้ว
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('welcomeStatus', true);
    // Navigator.of(context).pushReplacement(
    //   MaterialPageRoute(builder: (_) => const HomePage()),
    // );
    // ไปหน้า Login โดยการเปิดซ้อนหนเาเดิม
    //Navigator.pushNamed(context, AppRouter.login);
    // ไปหน้า Login
    Navigator.pushReplacementNamed(context, AppRouter.login);
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset(
      'assets/images/$assetName',
      width: width,
    );
  }

  @override
  Widget build(BuildContext context) {
    // display vertical
    SystemChrome.setPreferredOrientations([
      // display horizontal
      // DeviceOrientation.portraitUp,
      // DeviceOrientation.landscapeLeft,
      // DeviceOrientation.landscapeRight,
    ]);

    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return SafeArea(
      child: IntroductionScreen(
        key: introKey,
        globalBackgroundColor: Colors.white,
        // allowImplicitScrolling: true,
        // autoScrollDuration: 3000,
        // infiniteAutoScroll: true,
        pages: [
          PageViewModel(
            title: "ระบบจัดการสต็อกสมัยใหม่",
            body:
                "เริ่มต้นใช้ระบบกับเราเพียง 3 ขั้นตอนง่ายๆ และเริ่มต้นใช้งานได้ทันที",
            image: Padding(
              padding: const EdgeInsets.only(top:100.0),
              child: _buildImage('slide1.png'),
            ),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "ภาพรวมระบบในหนึ่งเดียว",
            body:
                "ดูภาพรวมของระบบได้ทุกที่ทุกเวลา ด้วยระบบที่ออกแบบมาเพื่อความง่าย",
            image: Padding(
              padding: const EdgeInsets.only(top:100.0),
              child: _buildImage('slide2.png'),
            ),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "ซื้อขายได้ตลอดเวลา",
            body:
                "ติดตามการซื้อขายได้ทุกที่ทุกเวลา ด้วยระบบที่ออกแบบมาเพื่อความง่าย",
            image: Padding(
              padding: const EdgeInsets.only(top:100.0),
              child: _buildImage('slide3.png'),
            ),
            decoration: pageDecoration,
          ),
        ],
        onDone: () => _onIntroEnd(context),
        onSkip: () => _onIntroEnd(context), // You can override onSkip callback
        showSkipButton: true,
        skipOrBackFlex: 0,
        nextFlex: 0,
        showBackButton: false,
        //rtl: true, // Display as right-to-left
        back: const Icon(Icons.arrow_back),
        skip: const Text('ข้าม', style: TextStyle(fontWeight: FontWeight.w600)),
        next: const Icon(Icons.arrow_forward),
        done: const Text('เสร็จสิ้น', style: TextStyle(fontWeight: FontWeight.w600)),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: kIsWeb
            ? const EdgeInsets.all(12.0)
            : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        dotsContainerDecorator: const ShapeDecoration(
          color: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }
}
