//------------------------------------------------------------------------------
// Classe: DAOFactory
// Pattern: Processing
//------------------------------------------------------------------------------
using System;

public class DAOFactory : ServiceTypeFactory
{
	public override Service createService() {
		return new DAOService();
	}
}


