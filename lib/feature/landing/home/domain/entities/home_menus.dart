import 'package:equatable/equatable.dart';

abstract class HomeMenuEntity extends Equatable {
  final String itemName;
  final String itemIcon;

  const HomeMenuEntity(this.itemName, this.itemIcon);
  @override
  List<Object?> get props => [itemName, itemIcon];
}
