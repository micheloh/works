//------------------------------------------------------------------------------
// Classe: Communicator
// Pattern: Communicator
//------------------------------------------------------------------------------
using System;

public abstract class Communicator : Device
{
	public override abstract object read();
	public override abstract void write();
}


