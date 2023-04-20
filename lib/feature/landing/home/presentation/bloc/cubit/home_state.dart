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

class CarouselImagesLoading extends HomeState {}

class PageLoadingCompleted extends HomeState {}

class ErrorState extends HomeState {
  const ErrorState({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
