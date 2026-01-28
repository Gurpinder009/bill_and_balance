import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_tasks_page_state.dart';

class AddTasksPageCubit extends Cubit<AddTasksPageState> {
  AddTasksPageCubit() : super(AddTasksPageInitial());
}
