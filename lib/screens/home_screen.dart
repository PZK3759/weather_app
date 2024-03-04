import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2*kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                //left
                alignment: AlignmentDirectional(3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff673AB7)
                  ),
                ),
              ),
              Align(
                //right
                alignment: AlignmentDirectional(-3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff673AB7)
                  ),
                ),
              ),
              Align(
                //middle
                alignment: AlignmentDirectional(0, -0.3),
                child: Container(
                  height: 400,
                  width: 400,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff673AB7)
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -1.2),
                child: Container(
                  height: 300,
                  width: 600,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Color(0xffFFAB40)
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('📍 Dhaka', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),),
                    const SizedBox(height: 8,),
                    Text('Good Morning', style: TextStyle(color: Colors.white,fontSize: 24, fontWeight: FontWeight.bold),),
                    Image.asset("assets/2.png"),
                    Center(child: Text('35°C', style: TextStyle(color: Colors.white,fontSize: 55, fontWeight: FontWeight.w600),)),
                    Center(child: Text('Rain', style: TextStyle(color: Colors.white,fontSize: 35, fontWeight: FontWeight.w500),)),
                    const SizedBox(height: 5,),
                    Center(child: Text('Monday, 04 *  09:06Pm', style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w300),)),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/11.png', scale: 8,),
                            const SizedBox(width: 5,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Sunrise', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),),
                                SizedBox(height: 3,),
                                Text('06:30 AM', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset('assets/12.png', scale: 8,),
                            const SizedBox(width: 5,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Sunset', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),),
                                SizedBox(height: 3,),
                                Text('06:30 AM', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Divider(color: Colors.grey,),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/13.png', scale: 8,),
                            const SizedBox(width: 5,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Max Temp', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),),
                                SizedBox(height: 3,),
                                Text('40°C', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset('assets/14.png', scale: 8,),
                            const SizedBox(width: 5,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Min Temp', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),),
                                SizedBox(height: 3,),
                                Text('34°C', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
