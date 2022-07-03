//------------------------------------------------------------------------------
// Classe: Device
// Pattern: Communication
//------------------------------------------------------------------------------
using System;
using UnityEngine;

	public abstract class Device : IOOperation
	{
		public abstract object read();

		public abstract void write();
	}

