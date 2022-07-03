//------------------------------------------------------------------------------
// Classe: IOFactory
// Pattern: Processing
//------------------------------------------------------------------------------
using System;

public class IOFactory : ServiceTypeFactory
{
	public override Service createService() {
		return new IOService();
	}
}


