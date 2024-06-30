import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:to_do_app/core/constants.dart';
import 'package:to_do_app/core/todo_theme.dart';
import 'package:to_do_app/data/data_sources/local/data_source/local_datasource.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/domain/entity/todo_entity.dart';
import 'package:to_do_app/presentation/bloc/todo_bloc.dart';
import 'package:to_do_app/presentation/widgets/btn_cancel.dart';
import 'package:to_do_app/presentation/widgets/listtile_checkbox.dart';
import 'package:to_do_app/presentation/widgets/listtile_subtitle_add_tag.dart';
import 'package:to_do_app/presentation/widgets/listtile_title.dart';
import 'package:to_do_app/presentation/widgets/slidable_action.dart';
import 'dart:math';

class ToDoHome extends StatelessWidget {
  const ToDoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (contextBloc, state) {
        if (state is LoadingState) {
          return ProjectConstants.circularLoadingBar;
        }
        if (state is LoadedState) {
          return DefaultTabController(
            length: 4,
            child: Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              appBar: _buildAppBar(contextBloc),
              body: SizedBox(
                height: MediaQuery.of(contextBloc).size.height * 0.75,
                child: ListView.builder(
                    itemCount: todoDB.length,
                    itemBuilder: (context, index) {
                      return Slidable(
                        endActionPane:
                            ActionPane(motion: const DrawerMotion(), children: [
                          const SlidableActionWidget(
                              onPressed: null,
                              icon: ProjectConstants.actionPaneFirstItem),
                          const SlidableActionWidget(
                              onPressed: null,
                              icon: ProjectConstants.actionPaneSecondItem),
                          SlidableActionWidget(
                              onPressed: (context) {
                                showDeleteDialog(context, contextBloc, index);
                              },
                              icon: ProjectConstants.actionPaneThirdItem)
                        ]),
                        child: _buildToDoListtile(index, context, contextBloc),
                      );
                    }),
              ),
              floatingActionButton: _buildFAB(contextBloc),
            ),
          );
        }
        return const Center(child: LinearProgressIndicator());
      },
    );
  }

  FloatingActionButton _buildFAB(BuildContext contextBloc) {
    String? title;
    DateTime? date;

    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: contextBloc,
            builder: (BuildContext context2) {
              // String? firstTag;
              return SizedBox(
                height: 400,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) {
                            title = value;
                          },
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: ProjectConstants.todoHintText),
                        ),
                      ),
                      Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                getTagValueDialog(contextBloc, todoDB.length);
                              },
                              child: const Text(ProjectConstants.addTag)),
                          const SizedBox(width: 16),
                          TextButton(
                              onPressed: () async {
                                DateTime? picked = await showDatePicker(
                                    context: context2,
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(ProjectConstants
                                        .lastTimeForDatePicker));
                                date = picked;
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(ProjectConstants.datePickerIcon),
                                  SizedBox(width: 4),
                                  Text(ProjectConstants.addDate),
                                ],
                              ))
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const CancelButton(),
                          const SizedBox(width: 16),
                          ElevatedButton(
                              onPressed: () {
                                if (title == null ||
                                    title == '' ||
                                    date == null) {
                                  return;
                                }
                                BlocProvider.of<TodoBloc>(contextBloc).add(
                                    CreateToDoItem(
                                        todoItem: ToDoEntity(
                                            title: title ?? '',
                                            date: date ?? DateTime.now(),
                                            done: false)));

                                title = '';
                                date = null;
                                Navigator.pop(context2);
                              },
                              child: const Text(ProjectConstants.createToDo)),
                          // _createToDoButton(title, date, contextBloc, context2)
                        ],
                      )
                    ],
                  ),
                ),
              );
            });
      },
      shape: const CircleBorder(),
      child: const Icon(ProjectConstants.addIcon),
    );
  }

  ListTile _buildToDoListtile(
      int index, BuildContext context, BuildContext contextBloc) {
    return ListTile(
      leading: ListtileCheckbox(index: index),
      title: ListtileTitle(index: index),
      subtitle: Row(
        children: [
          ListtileSubtitleAddTag(
            index: index,
            onPressed: () {
              getTagValueDialog(contextBloc, index);
            },
          ),
          const SizedBox(width: 4),
          CircularPercentIndicator(
            radius: 12,
            lineWidth: 3,
            backgroundColor: ProjectColors.alpineBlue.color!,
            percent: Random().nextDouble(),
            progressColor: ProjectColors.aquaLake.color,
          )
        ],
      ),
    );
  }

  Future<dynamic> showDeleteDialog(
      BuildContext context, BuildContext contextBloc, int index) {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            backgroundColor: ProjectColors.white.color,
            title: const Text(ProjectConstants.deleteToDoWarningText),
            actions: [
              CancelButton(
                btnName: ProjectConstants.delete,
                onPressed: () {
                  BlocProvider.of<TodoBloc>(contextBloc)
                      .add(DeleteToDoItem(index: index));
                  Navigator.pop(contextBloc);
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(contextBloc);
                  },
                  child: const Text(ProjectConstants.cancel))
            ],
          );
        });
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      bottom: PreferredSize(
          preferredSize: _tabBar.preferredSize,
          child: Material(
            color: ProjectColors.white.color,
            child: _tabBar,
          )),
      backgroundColor: ProjectColors.etherealWhite.color,
      title: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: ProjectColors.blackisBack.color?.withOpacity(0.04)),
          height: 24,
          width: 110,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            '🔅 ${DateFormat(ProjectConstants.dateFormat).format(DateTime.now())}',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: ProjectColors.blackisBack.color),
          )),
      leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_outlined,
            color: ProjectColors.jungleMist.color,
          )),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: SizedBox(
            height: 32,
            width: 32,
            child: CircleAvatar(
              backgroundImage: Image.asset(
                'assets/beforesunset1.png',
              ).image,
            ),
          ),
        )
      ],
    );
  }

  Future<dynamic> getTagValueDialog(BuildContext context, int index) {
    String? tag;
    return showDialog(
        context: context,
        builder: (context3) {
          return AlertDialog(
            title: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    tag = value;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const CancelButton(),
                    const SizedBox(width: 8),
                    ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<TodoBloc>(context)
                              .add(UpdateToDoItem(tag: tag!, index: index));
                          Navigator.pop(context3);
                        },
                        child: const Text(ProjectConstants.save))
                  ],
                ),
              ],
            ),
          );
        });
  }

  TabBar get _tabBar =>
      const TabBar(isScrollable: true, tabAlignment: TabAlignment.start, tabs: [
        Tab(text: ProjectConstants.today),
        Tab(text: ProjectConstants.tomorrow),
        Tab(text: ProjectConstants.restOfTheWeek),
        Tab(text: ProjectConstants.later)
      ]);
}
