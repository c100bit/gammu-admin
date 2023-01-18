part of 'sms_bloc.dart';

@immutable
abstract class SmsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchSms extends SmsEvent {
  final Folder folder;
  final String name;

  FetchSms({
    required this.folder,
    required this.name,
  }) {
    debugPrint('$this');
  }

  @override
  List<Object> get props => [folder, name];
}
