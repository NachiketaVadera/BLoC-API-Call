part of 'this_for_that_cubit.dart';

@immutable
abstract class ThisForThatState {}

class ThisForThatInitial extends ThisForThatState {}

class ThisForThatLoading extends ThisForThatState {}

class ThisForThatLoaded extends ThisForThatState {
  final ThisForThat thisForThat;

  ThisForThatLoaded(this.thisForThat);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ThisForThatLoaded && o.thisForThat == thisForThat;
  }

  @override
  int get hashCode => thisForThat.hashCode;
}

class ThisForThatError extends ThisForThatState {
  final String message;
  ThisForThatError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ThisForThatError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
