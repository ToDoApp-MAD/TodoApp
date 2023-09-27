// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/widgets/task_widgets.dart';

import '../data/firestore.dart';

class StreamNote extends StatelessWidget {
  bool done;
  StreamNote(this.done, {super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirestoreDatasource().stream(done),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          final noteslist = FirestoreDatasource().getNotes(snapshot);
          return ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final note = noteslist[index];
              return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    FirestoreDatasource().deleteNote(note.id);
                  },
                  child: TaskWidget(note));
            },
            itemCount: noteslist.length,
          );
        });
  }
}