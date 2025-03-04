
import 'detail.dart';

class recomdation{
  String path;
  String location;
  String title;
  String month;
  String day;
  detail det;
  recomdation({required this.title,required this.path,required this.location,required this.month,required this.day,required this.det});
  static List<recomdation> getrec() {
    return [
      recomdation(
        title: 'Camp Granite Lake',
        path: 'assets/images/camping.jpg',
        location: 'Golden, Colorado, US',
        month: 'June',
        day: '22',
        det: detail(
          cpTitle: 'Camp Big Sky Adventure',
          location: 'Yellowstone National Park, Wyoming',
          description: 'Explore Yellowstone and beyond! Get your feet wet and your hands dirty, while you explore...',
          period: '3 Months',
          in_out: 'Outside',
          ages: '9-12 years old',
          meal: true,
        ),
      ),
      recomdation(
        title: 'Camp Granite Lake',
        path: 'assets/images/camping.jpg',
        location: 'Golden, Colorado, US',
        month: 'June',
        day: '22',
        det: detail(
          cpTitle: 'Camp Big Sky Adventure',
          location: 'Yellowstone National Park, Wyoming',
          description: 'Explore Yellowstone and beyond! Get your feet wet and your hands dirty, while you explore...',
          period: '3 Months',
          in_out: 'Outside',
          ages: '9-12 years old',
          meal: true,
        ),
      ),
      recomdation(
        title: 'Camp Granite Lake',
        path: 'assets/images/camping.jpg',
        location: 'Golden, Colorado, US',
        month: 'June',
        day: '22',
        det: detail(
          cpTitle: 'Camp Big Sky Adventure',
          location: 'Yellowstone National Park, Wyoming',
          description: 'Explore Yellowstone and beyond! Get your feet wet and your hands dirty, while you explore...',
          period: '3 Months',
          in_out: 'Outside',
          ages: '9-12 years old',
          meal: true,
        ),
      ),
      recomdation(
        title: 'Camp Granite Lake',
        path: 'assets/images/camping.jpg',
        location: 'Golden, Colorado, US',
        month: 'June',
        day: '22',
        det: detail(
          cpTitle: 'Camp Big Sky Adventure',
          location: 'Yellowstone National Park, Wyoming',
          description: 'Explore Yellowstone and beyond! Get your feet wet and your hands dirty, while you explore...',
          period: '3 Months',
          in_out: 'Outside',
          ages: '9-12 years old',
          meal: true,
        ),
      ),
    ];
  }
}