//------------------------------------------------------------------------------
// Classe: DAOService
// Pattern: Processing
//------------------------------------------------------------------------------
using System;
using UnityEngine;

public class DAOService : Service
{
	public override void doService(int opcao) {
		switch (opcao) {
		case 1: //createDAO
			break;
		case 2: //ReadDAO
			break;
		case 3: //UpdateDAO
			break;
		case 4: //DeleteDAO
			break;
		default:
			Debug.LogWarning("Invalid option in DAOService.");
			break;
		}
	}

	public override void doService(IOService ios, int opcao) {

	}
}


