import '../../constants.dart';

class Note {
  /// The note
  final String name;

  /// Number of beats of the note
  final double duration;

  Note({
    required this.name,
    this.duration = 4,
  });

  /// Gets the name of the note without the symbol
  String getNameWithoutSymbol() {
    return name[0] + name[name.length - 1];
  }

  /// Gets the name of the note without the octave
  static String getNameWithoutOctave(String name) {
    if (name.length == 3) {
      return name[0] + name[1];
    }
    return name[0];
  }

  /// Gets how high the note is on the octave
  int getOctaveNumAsInt() {
    return int.parse(name[name.length - 1]);
  }

  /// Gets whether note1 is higher on the keyboard than note2
  static bool greaterOrEqualTo(Note note1, Note note2) {
    // Checks if the notes octaves are different
    int noteLevel1 = note1.getOctaveNumAsInt();
    int noteLevel2 = note2.getOctaveNumAsInt();
    if (noteLevel1 != noteLevel2) return noteLevel1 > noteLevel2;

    // Checks if the notes are the same
    if (note1.getNameWithoutSymbol() == note2.getNameWithoutSymbol())
      return true;

    // Gets the value of the note
    int? num1 = noteValues[note1.name[0]];
    int? num2 = noteValues[note2.name[0]];
    if (note1.name.length == 3) {
      num1 = noteValues[note1.name[0] + note1.name[1]];
    }
    if (note2.name.length == 3) {
      num2 = noteValues[note2.name[0] + note2.name[1]];
    }

    // Checks if the note value are different
    int n1 = -2;
    int n2 = -1;
    if (num1 != null) n1 = num1;
    if (num2 != null) n2 = num2;
    return n1 > n2;
  }
}

enum Clef {
  treble,
  bass,
}
