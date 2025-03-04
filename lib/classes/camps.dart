class camps{
  String name;
  String path;
  camps({required this.name,required this.path});
  static List<camps> getcamps(){
    List<camps> ls=[];
    ls.add(camps(name: 'Los Angeles', path: 'assets/images/camping.jpg'));
    ls.add(camps(name: 'Chicago', path: 'assets/images/camping.jpg'));
    ls.add(camps(name: 'Houston', path: 'assets/images/camping.jpg'));
    ls.add(camps(name: 'San Diago', path: 'assets/images/camping.jpg'));
    return ls;

  }
}