import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'view_task_state.dart';

class ViewTaskCubit extends Cubit<ViewTaskState> {
  ViewTaskCubit() : super(ViewTaskInitial());
}
