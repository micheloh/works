//------------------------------------------------------------------------------
// Classe: Sensor
// Pattern: Communication
//------------------------------------------------------------------------------
using System;
using UnityEngine;

public abstract class Sensor : Device
{
	public override abstract object read();
	public abstract HandModel[] readHands();
	public override abstract void write();

}


