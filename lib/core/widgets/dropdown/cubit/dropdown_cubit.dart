import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'dropdown_state.dart';

@injectable
class DropdownCubit extends Cubit<DropdownState> {
  DropdownCubit() : super(InitialState());

  void setInitialValue<T>(T? item) {
    emit(InitialDropdownState<T?>(item: item));
  }

  void onSelectItem<T>(T item) {
    emit(SelectDropdownItemState<T>(item: item));
  }
}
