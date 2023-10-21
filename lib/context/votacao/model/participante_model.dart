// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ParticipanteEliminationModel {
  
  int id;
  String name;
  String img;
  int votes;
  bool eliminated;

  ParticipanteEliminationModel({
    required this.id,
    required this.name,
    required this.img,
    required this.votes,
    required this.eliminated,
  });
  

  ParticipanteEliminationModel copyWith({
    int? id,
    String? name,
    String? img,
    int? votes,
    bool? eliminated,
  }) {
    return ParticipanteEliminationModel(
      id: id ?? this.id,
      name: name ?? this.name,
      img: img ?? this.img,
      votes: votes ?? this.votes,
      eliminated: eliminated ?? this.eliminated,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'img': img,
      'votes': votes,
      'eliminated': eliminated,
    };
  }

  factory ParticipanteEliminationModel.fromMap(Map<String, dynamic> map) {
    return ParticipanteEliminationModel(
      id: map['id'] as int,
      name: map['name'] as String,
      img: map['img'] as String,
      votes: map['votes'] as int,
      eliminated: map['eliminated'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ParticipanteEliminationModel.fromJson(String source) => ParticipanteEliminationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ParticipanteEliminationModel(id: $id, name: $name, img: $img, votes: $votes, eliminated: $eliminated)';
  }

  @override
  bool operator ==(covariant ParticipanteEliminationModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.img == img &&
      other.eliminated == eliminated &&
      other.votes == votes;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      img.hashCode ^
      eliminated.hashCode ^
      votes.hashCode;
  }
}
