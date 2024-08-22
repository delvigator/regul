

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filter_event.dart';

part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterState()) {
   on<ChangeFilterEvent>(_onChangeFilter);
  }

  _onChangeFilter(ChangeFilterEvent event, Emitter<FilterState> emit) {
    emit(state.copyWith(currentFilter: event.numberFilter));
  }
}
