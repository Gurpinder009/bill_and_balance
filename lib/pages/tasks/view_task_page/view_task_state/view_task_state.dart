part of 'view_task_cubit.dart';

sealed class ViewTaskState extends Equatable {
  const ViewTaskState();
}

final class ViewTaskInitial extends ViewTaskState {
  @override
  List<Object> get props => [];
}
