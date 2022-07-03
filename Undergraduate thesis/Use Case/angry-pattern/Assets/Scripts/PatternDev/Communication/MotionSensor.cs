//------------------------------------------------------------------------------
// Classe: MotionSensor
// Pattern: Communication
//------------------------------------------------------------------------------
using System;
using UnityEngine;

public class MotionSensor : Sensor
{
	private static HandController handC; 

	public override object read() {
		return null;
	}

	public override HandModel[] readHands() {
		handC = GameObject.Find("Player").GetComponentInChildren<HandController>();
		return handC.GetAllGraphicsHands ();
	}

	public override void write() {
		
	}
	
}


