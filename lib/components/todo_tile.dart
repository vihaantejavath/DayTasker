import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class TodoTile extends StatelessWidget {

  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;



  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:25.0, right:25, top:25),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: const Color.fromARGB(255, 124, 13, 13),
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color:Color.fromRGBO(29, 63, 88, 1),
          borderRadius: BorderRadius.circular(12)
          ),
        child: Row(
          children: [

            Checkbox(value: taskCompleted,
              onChanged: onChanged,
              activeColor: Color.fromARGB(255, 20, 119, 36),
              ),


            Text(taskName,
            style: TextStyle(
              color: Color.fromRGBO(208, 214, 214, 1),
              fontSize: 20,
              decoration: taskCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,

            ),
            ),
          ],
        ),
      ),
      )
    );
  }
}