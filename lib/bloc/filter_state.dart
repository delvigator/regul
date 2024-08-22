part of 'filter_bloc.dart';

@immutable
final class FilterState {
  final filters = ['Красный', 'Синий', 'Зеленый'];
  final int currentFilter;

  FilterState({this.currentFilter=0});

  FilterState copyWith({
    int? currentFilter,
  }) {
    return FilterState(
      currentFilter: currentFilter ?? this.currentFilter,
    );
  }
}
