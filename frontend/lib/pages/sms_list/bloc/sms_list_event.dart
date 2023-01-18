part of 'sms_list_bloc.dart';

@immutable
abstract class SmsListEvent extends Equatable {
  SmsListEvent() {
    debugPrint('$this');
  }

  @override
  List<Object> get props => [];
}

class FetchSmsList extends SmsListEvent {
  final Folder folder;

  FetchSmsList({required this.folder});

  @override
  List<Object> get props => [folder];
}

class FilterSmsList extends SmsListEvent {
  final String text;
  final Folder folder;

  FilterSmsList({required this.folder, required this.text});

  @override
  List<Object> get props => [folder, text];
}
