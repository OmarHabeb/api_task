part of 'get_data_cubit.dart';

@immutable
sealed class GetDataState {}

final class GetDataInitial extends GetDataState {}
final class get_done extends GetDataState {}
final class get_done2 extends GetDataState {}