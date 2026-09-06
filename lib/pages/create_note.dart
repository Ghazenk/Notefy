import 'package:flutter/material.dart';
import 'package:practice_isar/providers/note_database.dart';
import 'package:provider/provider.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  void saveNote(String title, String content) {
    context.read<NoteDatabase>().addNote(title, content);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Note'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ElevatedButton(
              onPressed: () {
                saveNote(titleController.text, contentController.text);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 197, 97, 60),
              ),
              child: Text('Save', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(hint: Text("Title")),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: contentController,

              decoration: InputDecoration(
                hintText: 'Start writing...',
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
