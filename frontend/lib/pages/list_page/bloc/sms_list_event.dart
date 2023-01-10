part of 'sms_list_bloc.dart';

@immutable
abstract class SmsListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchSmsList extends SmsListEvent {
  final Folder folder;

  FetchSmsList({required this.folder}) {
    print(this);
  }

  @override
  List<Object> get props => [folder];
}
