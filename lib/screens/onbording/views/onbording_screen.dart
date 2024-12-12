import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trubuy/components/dot_indicators.dart';
import 'package:trubuy/constants.dart';
import 'package:trubuy/route/route_constants.dart';

import 'components/onbording_content.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;
  List colors = const [
    // Color(0xffDAD3C8),
    // Color(0xffFFE5DE),
    // Color(0xffDCF6E6),
    Color(0xfff6e6dc),
    Color(0xffdce4f6),
    Color(0xfff6dcf5),
  ];
  final List<Onbord> _onbordData = [
    Onbord(
      image: "assets/images/image1.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_0.png",
      title: "Welcome to TruBuy",
      description:
          "Discover a world of endless shopping possibilities with Trubuy, your go-to multi-vendor eCommerce platform. Browse through a diverse range of products from various sellers, all in one place.",
    ),
    Onbord(
      image: "assets/images/onboarding1.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_1.png",
      title: "Shop Smart",
      description:
          "Find exactly what you need with our powerful search and filter options. Enjoy personalized recommendations and exclusive deals tailored just for you",
    ),
    Onbord(
      image: "assets/images/image3.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_2.png",
      title: "Easy & Secure Checkout",
      description: "Experience a seamless and secure checkout process. Choose from multiple payment options and track your orders effortlessly, ensuring a hassle-free shopping experience every time.",
    ),
    // Onbord(
    //   image: "assets/Illustration/Illustration-3.png",
    //   imageDarkTheme: "assets/Illustration/Illustration_darkTheme_3.png",
    //   title: "Package tracking",
    //   description:
    //       "In particular, Shoplon can pack your orders, and help you seamlessly manage your shipments.",
    // ),
    // Onbord(
    //   image: "assets/Illustration/Illustration-4.png",
    //   imageDarkTheme: "assets/Illustration/Illustration_darkTheme_4.png",
    //   title: "Nearby stores",
    //   description:
    //       "Easily track nearby shops, browse through their items and get information about their prodcuts.",
    // ),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[_pageIndex],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, logInScreenRoute);
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge!.color),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _onbordData.length,
                  onPageChanged: (value) {
                    setState(() {
                      _pageIndex = value;
                    });
                  },
                  itemBuilder: (context, index) => OnbordingContent(
                    title: _onbordData[index].title,
                    description: _onbordData[index].description,
                    image: (Theme.of(context).brightness == Brightness.dark &&
                            _onbordData[index].imageDarkTheme != null)
                        ? _onbordData[index].imageDarkTheme!
                        : _onbordData[index].image,
                    isTextOnTop: index.isOdd,
                  ),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    _onbordData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: defaultPadding / 4),
                      child: DotIndicator(isActive: index == _pageIndex),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_pageIndex < _onbordData.length - 1) {
                          _pageController.nextPage(
                              curve: Curves.ease, duration: defaultDuration);
                        } else {
                          Navigator.pushNamed(context, logInScreenRoute);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Arrow - Right.svg",
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding),
            ],
          ),
        ),
      ),
    );
  }
}

class Onbord {
  final String image, title, description;
  final String? imageDarkTheme;

  Onbord({
    required this.image,
    required this.title,
    this.description = "",
    this.imageDarkTheme,
  });
}
