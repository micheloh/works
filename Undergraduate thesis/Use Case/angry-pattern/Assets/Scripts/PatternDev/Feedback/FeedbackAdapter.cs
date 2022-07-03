//------------------------------------------------------------------------------
// Classe: FeedbackAdapter
// Pattern: Feedback
//------------------------------------------------------------------------------
using System;
using UnityEngine;

public class FeedbackAdapter
{
	public void write() {
		Sensor videoSensor = new VideoSensor (); //Instancia do VideoSensor a partir da classe abstrata Sensor
		videoSensor.write();
	}
}

