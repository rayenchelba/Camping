import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/views/Addcalendar.dart';
import '../main.dart';


class Detailview extends StatefulWidget {
  final dynamic p;
  const Detailview({super.key,required this.p});

  @override
  State<Detailview> createState() => _DetailviewState();
}

class _DetailviewState extends State<Detailview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              CarouselSlider(
                items: List.generate(4, (index) {
                  return Stack(
                    children: [
                      Container(
                        height: 400,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/camping.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 330,
                        left:MediaQuery.of(context).size.width/2-10,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black.withOpacity(0.3)
                          ),
                          child: Text(
                            '${index + 1}/4',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.white,

                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        left:15,
                        right: 15,
                        child: Row(children: [
                          GestureDetector(
                            onTap:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
                            },
                            child: CircleAvatar(
                                radius:24,
                                backgroundColor: Colors.white,
                                child: Icon(Icons.keyboard_arrow_left,size: 30,)),
                          ),
                          SizedBox(
                            width:MediaQuery.of(context).size.width/2 ,),
                          CircleAvatar(
                              radius:24,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.bookmark_outline_sharp,size: 30,)),
                          SizedBox(width: 15,),
                          CircleAvatar(
                              radius:24,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.share_outlined,size:30,))
                        ],),
                      ),
                    ],
                  );
                }),
                options: CarouselOptions(
                  height: 400,
                  viewportFraction: 1.0,
                ),
              ),

              Positioned(
                top: 380,
                left: 0,
                right: 0,
                child: ClipRRect(
                  borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(30)),
                  child: Container(
                    width: double.infinity,
                    height: (MediaQuery.of(context).size.height-380),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            color:  Colors.white,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.p.det.cpTitle,
                                        style: const TextStyle(
                                          fontSize: 21,
                                          fontWeight:
                                          FontWeight.w900,
                                        ),
                                      ),
                                      SizedBox(height: 6,),
                                      Row(
                                        children: [
                                          Icon(Icons.location_on_outlined,color: Colors.grey,size: 17,),
                                          Text(
                                            widget.p.det.location,
                                            style: const TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding:
                                        const EdgeInsets.all(7),
                                        decoration: BoxDecoration(
                                            color: const Color(0xff89AC46)
                                                .withOpacity(0.7),
                                            borderRadius: BorderRadius.circular(5)
                                        ),
                                        child: Text(
                                          widget.p.day,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600
                                          ),
                                        ),
                                      ),
                                      Text(
                                        widget.p.month,
                                        style: const TextStyle(
                                          fontSize: 13.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8, bottom: 15, top: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Description',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600, fontSize: 19),
                                ),
                                SizedBox(height: 10,),
                                Text(widget.p.det.description,style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600
                                ),)
                              ],
                            ),
                          ),
                          Text(
                            'Camp Details',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 19),
                          ),
                          SizedBox(height: 20,),
                          Padding(
                            padding: EdgeInsets.only(left: 10,right: 10),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius:25,
                                          backgroundImage: AssetImage(widget.p.path),
                                        ),
                                        SizedBox(width: 20,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('period',style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey
                                            ),),
                                            Text(widget.p.det.period,style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 15
                                            ),)
                                          ],)
                                      ],),
                                    SizedBox(height: 20,),
                                    Row(children: [
                                      CircleAvatar(
                                        radius:25,
                                        backgroundImage: AssetImage(widget.p.path),
                                      ),
                                      SizedBox(width: 20,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Inside/Outside',style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey
                                          ),),
                                          Text(widget.p.det.in_out,style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 15
                                          ),)
                                        ],)
                                    ],)
                                  ],
                                ),
                                SizedBox(width: 40,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(children: [
                                      CircleAvatar(
                                        radius:25,
                                        backgroundImage: AssetImage(widget.p.path),
                                      ),
                                      SizedBox(width: 20,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Age Group',style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey
                                          ),),
                                          Text(widget.p.det.ages,style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 15
                                          ),)
                                        ],)
                                    ],),
                                    SizedBox(height: 20,),
                                    Row(children: [
                                      CircleAvatar(
                                        radius:25,
                                        backgroundImage: AssetImage(widget.p.path),
                                      ),
                                      SizedBox(width: 20,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Meals Provided',style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey
                                          ),),
                                          Text(widget.p.det.meal?'Yes':'Non',style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 15
                                          ),)
                                        ],)
                                    ],)
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(20,15,20,15),
        child: Row(
          children: [
            Expanded(
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Color(0xff677E32),
                ),
                onPressed: () {},
                child: Padding(

                    padding:EdgeInsets.only(top: 15,bottom: 15),
                    child: Text('Reserve a spot')),
              ),
            ),
            SizedBox(width: 10,),
            FloatingActionButton(
              backgroundColor: Colors.white,
              shape: CircleBorder(),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Addcalendar()));
              },
              child: Icon(Icons.calendar_today_outlined),
            ),
          ],
        ),
      ),

    );
  }
}
