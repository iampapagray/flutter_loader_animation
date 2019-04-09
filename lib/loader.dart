import 'package:flutter/material.dart';
import 'dart:math';

class Loader extends StatefulWidget {
	@override
	_LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {

	AnimationController controller;
	Animation<double> animation_rotation;
	Animation<double> animation_radius_in;
	Animation<double> animation_radius_out;

	final double initialRad = 20.0;
	double rad = 0.0;

	@override
	void initState(){
		super.initState();

		controller = AnimationController(vsync: this, duration: Duration(seconds: 5));

		animation_rotation = Tween<double>(
			begin:0.0,
			end:1.0
		).animate(CurvedAnimation(
			parent:controller,curve:Interval(0.0,1.0, curve:Curves.linear)));
		animation_radius_in = Tween<double>(
			begin: 1.0,
			end: 0.0,
		).animate(CurvedAnimation(
			parent: controller, 
			curve: Interval(0.75,1.0, curve: Curves.elasticIn)));
		animation_radius_out = Tween<double>(
			begin: 0.0,
			end: 1.0,
		).animate(CurvedAnimation(
			parent: controller,
			curve: Interval(0.0,0.25, curve: Curves.elasticOut)));

		controller.addListener((){
			setState((){
				if(controller.value >= 0.75 && controller.value <= 1.0){
					rad = animation_radius_in.value * initialRad;
				}else if(controller.value >= 0.0 && controller.value <= 0.25){
					rad = animation_radius_out.value * initialRad;
				}
			});
		});

		controller.repeat();
	}

	@override
	Widget build(BuildContext context){
		return Container(
			width: 100.0,
			height: 100.0,
			child: Center(
				child: RotationTransition(
					turns: animation_rotation,
					child: Stack(
						children: <Widget>[
							Dot(
								radius: 20.0,
								color: Colors.black12
							),

							Transform.translate(
								offset: Offset(rad * cos(pi/4), rad * sin(pi/4)),
								child: Dot(
									radius: 5.0,
									color: Colors.red
								)
							),

							Transform.translate(
								offset: Offset(rad * cos(2*pi/4), rad * sin(2*pi/4)),
								child: Dot(
									radius: 5.0,
									color: Colors.redAccent
								)
							),

							Transform.translate(
								offset: Offset(rad * cos(3*pi/4), rad * sin(3*pi/4)),
								child: Dot(
									radius: 5.0,
									color: Colors.greenAccent
								)
							),

							Transform.translate(
								offset: Offset(rad * cos(4*pi/4), rad * sin(4*pi/4)),
								child: Dot(
									radius: 5.0,
									color: Colors.blue
								)
							),

							Transform.translate(
								offset: Offset(rad * cos(5*pi/4), rad * sin(5*pi/4)),
								child: Dot(
									radius: 5.0,
									color: Colors.amber
								)
							),

							Transform.translate(
								offset: Offset(rad * cos(6*pi/4), rad * sin(6*pi/4)),
								child: Dot(
									radius: 5.0,
									color: Colors.orange
								)
							),

							Transform.translate(
								offset: Offset(rad * cos(7*pi/4), rad * sin(7*pi/4)),
								child: Dot(
									radius: 5.0,
									color: Colors.yellow
								)
							),

							Transform.translate(
								offset: Offset(rad * cos(8*pi/4), rad * sin(8*pi/4)),
								child: Dot(
									radius: 5.0,
									color: Colors.purple
								)
							),
						]
					)
				)
			)
		);
	}
}


class Dot extends StatelessWidget {
	
	final double radius;
	final Color color;

	Dot({this.radius, this.color});

	@override
	Widget build(BuildContext context){
		return Center(
			child: Container(
				width: this.radius,
				height: this.radius,
				decoration: BoxDecoration(
					color: this.color,
					shape: BoxShape.circle
				)
			)
		);
	}
}

