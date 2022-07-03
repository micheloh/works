//------------------------------------------------------------------------------
// Classe: ProcessingFactory
// Pattern: Processing
//------------------------------------------------------------------------------
using System;

public class ProcessingFactory : ServiceTypeFactory
{
	public override Service createService() {
		return new ProcessingService();
	}
}


