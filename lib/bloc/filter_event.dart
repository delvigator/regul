part of 'filter_bloc.dart';

@immutable
abstract class FilterEvent {}

class ChangeFilterEvent extends FilterEvent{
final int numberFilter;

ChangeFilterEvent(this.numberFilter);
}