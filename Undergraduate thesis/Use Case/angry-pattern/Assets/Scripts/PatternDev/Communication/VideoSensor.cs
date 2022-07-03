//------------------------------------------------------------------------------
// Classe: VideoSensor
// Pattern: Communication
//------------------------------------------------------------------------------
using System;
using UnityEngine;

public class VideoSensor : Sensor
{	
	public GameObject OVRController = GameObject.Find("LeapOVRCameraRig");

	public override object read() {
		return null;
	}

	public override HandModel[] readHands() {
		return null;
	}

	public override void write() {
		if (!OVRController.GetComponent<OVRCameraRig> ()) {
			OVRCameraRig ocg = OVRController.AddComponent<OVRCameraRig> ();
			OVRManager om = OVRController.AddComponent<OVRManager> ();
		}
	}	
}

