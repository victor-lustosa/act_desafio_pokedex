import 'package:flutter/cupertino.dart';

@immutable
abstract class GenericState {}

@immutable
class InitialState extends GenericState{
  InitialState();
}

@immutable
class LoadingState extends GenericState{
  LoadingState();
}

@immutable
class NoConnectionState extends GenericState {
  NoConnectionState();
}


@immutable
class ExceptionState extends GenericState{
  final String message;
  ExceptionState({required this.message});
}

@immutable
class DataFetchedState<T> extends GenericState {
  final T? entities;
  DataFetchedState({this.entities});
}