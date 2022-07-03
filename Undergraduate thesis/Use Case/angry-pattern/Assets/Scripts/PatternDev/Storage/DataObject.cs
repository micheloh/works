//------------------------------------------------------------------------------
// Classe: DataObject
// Pattern: Storage
//------------------------------------------------------------------------------
using System;

public class DataObject
{
	private string _highscore;
	
	public string score {
		get { return _highscore; }
		set { _highscore = value; }
	}
	
}