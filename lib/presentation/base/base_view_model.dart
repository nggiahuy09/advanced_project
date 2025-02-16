
abstract class BaseViewModel implements BaseViewModelInputs, BaseViewModelOutputs {
  // shared variables and functions that will be used through any view model
}

abstract class BaseViewModelInputs {
  void start(); // called when view model is created
  void dispose(); // called when view model is disposed
}

abstract class BaseViewModelOutputs {}

