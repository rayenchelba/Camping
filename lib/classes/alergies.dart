import 'package:flutter/material.dart';

enum alergies{
  Gluten(name:"Gluten",icon:'assets/icons/peanut-beans-icon.svg'),
  Dairy(name:"Dairy",icon:'assets/icons/peanut-beans-icon.svg'),
  Egg(name: "Egg",icon:'assets/icons/peanut-beans-icon.svg'),
  Soy(name:"Soy",icon:'assets/icons/peanut-beans-icon.svg'),
  Peanut(name:"Peanut",icon:'assets/icons/peanut-beans-icon.svg'),
  Shellfish(name:"Shellfish",icon:'assets/icons/peanut-beans-icon.svg');
  final String name;
  final String icon;
  const alergies({required this.name,required this.icon});

}
enum Hobby {
  soccer(name: 'Football', color: Color(0xFF2E7D32)),
  basketball(name: 'Basketball', color: Color(0xFFEF6C00)),
  swimming(name: 'Natation', color: Color(0xFF0277BD)),
  cycling(name: 'Vélo', color: Color(0xFF6A1B9A)),
  yoga(name: 'Yoga', color: Color(0xFFAD1457)),
  painting(name: 'Peinture', color: Color(0xFF283593)),
  photography(name: 'Photographie', color: Color(0xFFF9A825)),
  writing(name: 'Écriture', color: Color(0xFF4E342E)),
  dancing(name: 'Danse', color: Color(0xFFC62828)),
  pottery(name: 'Poterie', color: Color(0xFFD84315)),
  gardening(name: 'Jardinage', color: Color(0xFF558B2F)),
  hiking(name: 'Randonnée', color: Color(0xFF00695C)),
  birdWatching(name: 'Ornithologie', color: Color(0xFF9E9D24)),
  foraging(name: 'Cueillette', color: Color(0xFF64DD17)),
  astronomy(name: 'Astronomie', color: Color(0xFF7C4DFF)),
  coding(name: 'Programmation', color: Color(0xFF37474F)),
  gaming(name: 'Jeux vidéo', color: Color(0xFF6A1B9A)),
  robotics(name: 'Robotique', color: Color(0xFF0097A7)),
  drones(name: 'Drones', color: Color(0xFF616161)),
  vr(name: 'Réalité Virtuelle', color: Color(0xFFF50057));

  final String name;
  final Color color;

  const Hobby({
    required this.name,
    required this.color,
  });
}