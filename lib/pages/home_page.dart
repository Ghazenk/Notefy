import 'package:flutter/material.dart';
import 'package:practice_isar/pages/create_note.dart';
import 'package:practice_isar/pages/update_note.dart';
import 'package:practice_isar/providers/note_database.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    readNotes();
    super.initState();
  }

  void readNotes() {
    context.read<NoteDatabase>().fetchNotes();
  }

  void deleteNote(int id) {
    context.read<NoteDatabase>().deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {
    final noteDatabase = context.watch<NoteDatabase>();

    final currentNotes = noteDatabase.currentNote;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (ctx) => CreateNote()),
          );
        },
        backgroundColor: Color.fromARGB(255, 197, 97, 60),
        child: Icon(Icons.add, color: Colors.white, size: 25),
      ),

      appBar: AppBar(
        title: Text(
          'Notefy',
          style: TextStyle(
            fontSize: 30,
            color: Color.fromARGB(255, 35, 32, 31),
          ),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.person, size: 30),
            ),
          ),
        ],
      ),

      body: currentNotes.isEmpty
          ? Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/empty-art.png'),

                    const SizedBox(height: 30),
                    const Text('No notes yet', style: TextStyle(fontSize: 28)),
                    const SizedBox(height: 10),

                    const Text(
                      'Tap the + button to create your very first beautifully organized note.',

                      textAlign: TextAlign.center,

                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: currentNotes.length,
                itemBuilder: ((context, index) {
                  final note = currentNotes[index];

                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(note.title),
                                const SizedBox(height: 12),
                                Text(note.content, softWrap: true),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UpdateNote(
                                        noteId: note.id,
                                        noteTitle: note.title,
                                        noteContent: note.content,
                                      ),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.edit),
                              ),

                              IconButton(
                                onPressed: () {
                                  deleteNote(note.id);
                                },

                                color: Theme.of(context).colorScheme.error,
                                icon: Icon(Icons.delete),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
    );
  }
}
