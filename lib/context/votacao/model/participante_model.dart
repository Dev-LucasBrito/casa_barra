// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ParticipanteEliminationModel {
  
  int id;
  String name;
  String img;
  int votes;

  ParticipanteEliminationModel({
    required this.id,
    required this.name,
    required this.img,
    required this.votes,
  });
  

  ParticipanteEliminationModel copyWith({
    int? id,
    String? name,
    String? img,
    int? votes,
  }) {
    return ParticipanteEliminationModel(
      id: id ?? this.id,
      name: name ?? this.name,
      img: img ?? this.img,
      votes: votes ?? this.votes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'img': img,
      'votes': votes,
    };
  }

  factory ParticipanteEliminationModel.fromMap(Map<String, dynamic> map) {
    return ParticipanteEliminationModel(
      id: map['id'] as int,
      name: map['name'] as String,
      img: map['img'] as String,
      votes: map['votes'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ParticipanteEliminationModel.fromJson(String source) => ParticipanteEliminationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ParticipanteEliminationModel(id: $id, name: $name, img: $img, votes: $votes)';
  }

  @override
  bool operator ==(covariant ParticipanteEliminationModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.img == img &&
      other.votes == votes;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      img.hashCode ^
      votes.hashCode;
  }
}
