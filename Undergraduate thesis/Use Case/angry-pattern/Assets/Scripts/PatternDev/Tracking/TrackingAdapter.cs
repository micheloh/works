//------------------------------------------------------------------------------
// Classe: TrackingAdapter
// Pattern: Tracking
//------------------------------------------------------------------------------
using System;
using UnityEngine;

public class TrackingAdapter
{
	public object read(int opt)
	{
		switch (opt) {
		case 1: //ler as maos
			Sensor motionSensor = new MotionSensor(); //Instancia da MotionSensor a partir da classe abstrata Sensor
			return motionSensor.readHands();
			//break;
		default:
			Debug.LogWarning("Invalid option in TrackingAdapter.");
			break;
		}
		return null;
	}
}
	