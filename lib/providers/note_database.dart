import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:practice_isar/models/databases/note.dart';

class NoteDatabase extends ChangeNotifier {
  //isar object
  static late Isar isar;

  //initializing isar
  static Future<void> setupIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([NoteSchema], directory: dir.path);
  }

  //holds datas
  List<Note> currentNote = [];

  //add new notes
  Future<void> addNote(String title, String content) async {
    // creating an note object
    final newNote = Note()
      ..title = title
      ..content = content;

    // putting the new note in database
    await isar.writeTxn(() async {
      await isar.notes.put(newNote);
    });

    //read notes
    await fetchNotes();
  }

  // gets notes
  Future<void> fetchNotes() async {
    final fetchedNotes = await isar.notes.where().findAll();
    currentNote.clear();
    currentNote.addAll(fetchedNotes);
    notifyListeners();
  }

  //update a existing note
  Future<void> updateNote(int id, String newTitle, String newContent) async {
    // find the note
    final existingNote = await isar.notes.get(id);

    //if it is not empty fill with new valuse
    if (existingNote != null) {
      existingNote.title = newTitle;
      existingNote.content = newContent;

      await isar.writeTxn(() async {
        await isar.notes.put(existingNote);
      });
      // than get my notes updated
      await fetchNotes();
    }
  }

  //delete note
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() async {
      await isar.notes.delete(id);
    });

    await fetchNotes();
  }
}
