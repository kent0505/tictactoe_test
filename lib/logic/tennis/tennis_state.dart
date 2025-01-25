part of 'tennis_bloc.dart';

@immutable
sealed class TennisState {}

final class TennisInitial extends TennisState {}

final class TennisLoading extends TennisState {}

final class TennisLoaded extends TennisState {}
