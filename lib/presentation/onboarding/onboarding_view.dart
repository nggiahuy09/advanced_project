import 'package:advanced_project/presentation/onboarding/onboarding_item_view.dart';
import 'package:advanced_project/presentation/onboarding/onboarding_viewmodel.dart';
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
  final PageController _pageController = PageController(initialPage: 0);
  OnBoardingViewModel _viewModel = OnBoardingViewModel();

  void _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputSliderViewObject,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        SliderViewObject sliderViewObject = snapshot.data!;
        return Scaffold(
          body: PageView.builder(
            controller: _pageController,
            itemCount: sliderViewObject.numberOfSlides,
            onPageChanged: (index) {
              _viewModel.onPageChanged(index);
            },
            itemBuilder: (context, index) {
              return OnBoardingPage(
                sliderObj: sliderViewObject.sliderObject,
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
                child: _getBottomSheetWidget(sliderViewObject),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _getProperCircle(int index, SliderViewObject sliderViewObject) {
    return Icon(
      index == sliderViewObject.currentIndex
          ? Icons.circle
          : Icons.circle_outlined,
      size: AppSize.s16,
      color: ColorManager.white,
    );
  }

  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: IconButton(
            onPressed: () {
              _pageController.animateToPage(
                _viewModel.goPrevious(),
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
            for (int i = 0; i < sliderViewObject.numberOfSlides; i++)
              Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: _getProperCircle(i, sliderViewObject),
              )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: IconButton(
            onPressed: () {
              _pageController.animateToPage(
                _viewModel.goNext(),
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
