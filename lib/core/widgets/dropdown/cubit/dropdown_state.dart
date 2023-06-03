part of 'dropdown_cubit.dart';

abstract class DropdownState extends Equatable {
  const DropdownState();

  @override
  List<Object> get props => [];
}

class InitialState extends DropdownState {
  @override
  List<Object> get props => [];
}

class InitialDropdownState<T> extends DropdownState {
  final T item;
  const InitialDropdownState({required this.item});
  @override
  List<Object> get props => [item as Object];
}

class SelectDropdownItemState<T> extends DropdownState {
  final T item;
  const SelectDropdownItemState({required this.item});
  @override
  List<Object> get props => [item as Object];
}
