import 'dart:async';

import 'package:advanced_project/domain/model.dart';
import 'package:advanced_project/presentation/base/base_view_model.dart';
import 'package:advanced_project/presentation/resources/assets_manager.dart';
import 'package:advanced_project/presentation/resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    implements OnboardingViewModelInputs, OnboardingViewModelOutputs {
  // stream controller
  final StreamController _streamController =
      StreamController<SliderViewObject>();

  late final List<SliderObject> _list;
  int _currentIndex = 0;

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  int goNext() {
    _currentIndex = _currentIndex == _list.length - 1 ? 0 : _currentIndex + 1;
    _postDataToView();

    return _currentIndex;
  }

  @override
  int goPrevious() {
    _currentIndex = _currentIndex == 0 ? _list.length - 1 : _currentIndex - 1;
    _postDataToView();

    return _currentIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  // inputs
  @override
  Sink get inputSliderViewObject => _streamController.sink;

  // outputs
  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderObject) => sliderObject);

  void _postDataToView() {
    inputSliderViewObject.add(
      SliderViewObject(
        sliderObject: _list[_currentIndex],
        numberOfSlides: _list.length,
        currentIndex: _currentIndex,
      ),
    );
  }

  List<SliderObject> _getSliderData() {
    return [
      SliderObject(
        title: AppStrings.onBoardingTitle1,
        subTitle: AppStrings.onBoardingSubtitle1,
        image: ImageAssetsManager.onBoarding1,
      ),
      SliderObject(
        title: AppStrings.onBoardingTitle2,
        subTitle: AppStrings.onBoardingSubtitle2,
        image: ImageAssetsManager.onBoarding2,
      ),
      SliderObject(
        title: AppStrings.onBoardingTitle3,
        subTitle: AppStrings.onBoardingSubtitle3,
        image: ImageAssetsManager.onBoarding3,
      ),
      SliderObject(
        title: AppStrings.onBoardingTitle4,
        subTitle: AppStrings.onBoardingSubtitle4,
        image: ImageAssetsManager.onBoarding4,
      ),
    ];
  }
}

// note: inputs are the ones that the view model will receive from the view
abstract class OnboardingViewModelInputs {
  int goNext();
  int goPrevious();
  void onPageChanged(int index);

  Sink get inputSliderViewObject; // sink is a way to add data to the stream
}

// note: outputs are the ones that the view model will send to the view
abstract class OnboardingViewModelOutputs {
  Stream<SliderViewObject>
      get outputSliderViewObject; // stream is a way to receive data from the view model
}

class SliderViewObject {
  SliderObject sliderObject;
  int numberOfSlides;
  int currentIndex;

  SliderViewObject({
    required this.sliderObject,
    required this.numberOfSlides,
    required this.currentIndex,
  });
}
