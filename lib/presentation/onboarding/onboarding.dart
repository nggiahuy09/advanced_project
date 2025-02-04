import 'package:advanced_project/presentation/onboarding/onboardingItem.dart';
import 'package:advanced_project/presentation/resources/assets_manager.dart';
import 'package:advanced_project/presentation/resources/color_manager.dart';
import 'package:advanced_project/presentation/resources/strings_manager.dart';
import 'package:advanced_project/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final List<SliderObj> _list = _getSliderData();

  final PageController _pageController = PageController(initialPage: 0);

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: _list.length,
        onPageChanged: (value) {
          setState(() => _currentIndex = value);
        },
        itemBuilder: (context, index) {
          return OnBoardingPage(
            sliderObj: _list[index],
          );
        },
      ),
      bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                AppStrings.skip,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          Container(
            color: ColorManager.primary,
            child: _getBottomSheetWidget(),
          ),
        ],
      ),
    );
  }

  List<SliderObj> _getSliderData() {
    return [
      SliderObj(
        title: AppStrings.onBoardingTitle1,
        subTitle: AppStrings.onBoardingSubtitle1,
        image: ImageAssetsManager.onBoarding1,
      ),
      SliderObj(
        title: AppStrings.onBoardingTitle2,
        subTitle: AppStrings.onBoardingSubtitle2,
        image: ImageAssetsManager.onBoarding2,
      ),
      SliderObj(
        title: AppStrings.onBoardingTitle3,
        subTitle: AppStrings.onBoardingSubtitle3,
        image: ImageAssetsManager.onBoarding3,
      ),
      SliderObj(
        title: AppStrings.onBoardingTitle4,
        subTitle: AppStrings.onBoardingSubtitle4,
        image: ImageAssetsManager.onBoarding4,
      ),
    ];
  }

  Widget _getProperCircle(int index) {
    return Icon(
      index == _currentIndex ? Icons.circle : Icons.circle_outlined,
      size: AppSize.s16,
      color: ColorManager.white,
    );
  }

  Widget _getBottomSheetWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: IconButton(
            onPressed: () {
              _pageController.previousPage(
                duration: AppDuration.d300,
                curve: Curves.easeInOut,
              );
            },
            icon: Icon(
              Icons.arrow_back,
              size: AppSize.s28,
              color: ColorManager.white,
            ),
          ),
        ),
        Row(
          children: [
            for (int i = 0; i < _list.length; i++)
              Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: _getProperCircle(i),
              )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: IconButton(
            onPressed: () {
              _pageController.nextPage(
                duration: AppDuration.d300,
                curve: Curves.easeInOut,
              );
            },
            icon: Icon(
              Icons.arrow_forward,
              size: AppSize.s28,
              color: ColorManager.white,
            ),
          ),
        ),
      ],
    );
  }
}

class SliderObj {
  final String title;
  final String subTitle;
  final String image;

  SliderObj({
    required this.title,
    required this.subTitle,
    required this.image,
  });
}
