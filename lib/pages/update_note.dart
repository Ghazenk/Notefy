import 'package:flutter/material.dart';
import 'package:practice_isar/providers/note_database.dart';
import 'package:provider/provider.dart';

class UpdateNote extends StatefulWidget {
  const UpdateNote({
    super.key,
    required this.noteId,
    required this.noteTitle,
    required this.noteContent,
  });

  final int noteId;
  final String noteTitle;
  final String noteContent;

  @override
  State<UpdateNote> createState() => _UpdateNoteState();
}

class _UpdateNoteState extends State<UpdateNote> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  void updateNote(int id, String title, String content) {
    context.read<NoteDatabase>().updateNote(id, title, content);
  }

  @override
  Widget build(BuildContext context) {
    titleController.text = widget.noteTitle;
    contentController.text = widget.noteContent;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Note'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ElevatedButton(
              onPressed: () {
                updateNote(
                  widget.noteId,
                  titleController.text,
                  contentController.text,
                );
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 197, 97, 60),
              ),
              child: Text('Update', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: contentController,
              decoration: InputDecoration(
                // hintText: 'Start writing...',
                border: .none,
              ),
              maxLines: 25,
            ),
          ],
        ),
      ),
    );
  }
}
