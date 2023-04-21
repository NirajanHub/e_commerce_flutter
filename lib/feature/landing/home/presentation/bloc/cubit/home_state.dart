part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class CarouselImagesLoaded extends HomeState {
  final List<String> carouselImages;
  const CarouselImagesLoaded({required this.carouselImages});
  @override
  List<Object> get props => [carouselImages];
}

class LoadingState extends HomeState {}

class HomeMenuLoaded extends HomeState {
  const HomeMenuLoaded({required this.homeMenuModel});
  final List<HomeMenusModel> homeMenuModel;
  @override
  List<List<HomeMenusModel>> get props => [homeMenuModel];
}

class HomePageLoaded extends HomeState {
  final List<String> carouselImages;
  final List<HomeMenusModel> homeMenuModel;
  const HomePageLoaded(
      {required this.carouselImages, required this.homeMenuModel});
  @override
  List<Object> get props => [carouselImages, homeMenuModel];
}

class ErrorState extends HomeState {
  const ErrorState({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
