

import 'package:flutter/material.dart';
import 'package:flutter_particle_background/flutter_particle_background.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: 
           ParticleBackground(
             
              backgroundColor:Color(0xFF101010),
              multiColor: false,
              particleColor: Colors.white.withOpacity(.6),
              numberOfParticles: 250,
              biggestSize: 7,
              smallestSize: 4,
              blur: false,
              allFilled: true,
              highestSpeed: 1.5,
              slowestSpeed: 0.2,
            ),
           
        
      
    );
  }
}