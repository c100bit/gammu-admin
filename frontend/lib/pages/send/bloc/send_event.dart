part of 'send_bloc.dart';

@immutable
abstract class SendEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class Send extends SendEvent {
  final String phone;
  final String text;

  Send({
    required this.phone,
    required this.text,
  }) {
    debugPrint('$this');
  }
}
