//------------------------------------------------------------------------------
// Classe: Service
// Pattern: Processing
//------------------------------------------------------------------------------
using System;
using UnityEngine;

public abstract class Service
{
	public abstract void doService(int opcao);
	public abstract void doService(IOService ios, int opcao);
}


