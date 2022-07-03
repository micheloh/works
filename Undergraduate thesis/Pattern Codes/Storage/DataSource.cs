//------------------------------------------------------------------------------
// Classe: DataSource
// Pattern: Storage
//------------------------------------------------------------------------------
using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.Serialization.Formatters.Binary;
using System.IO;

public class DataSource
{
	private FileStream file;
	
	public bool openConnection() {
		if(!File.Exists(Application.persistentDataPath + "/highscore.gd")) {
			file = File.Create (Application.persistentDataPath + "/highscore.gd");
		}
		file = File.Open(Application.persistentDataPath + "/highscore.gd", FileMode.Open);
		return true;
	}
	
	public ResultSet executeQuery(string str) {
		return null;
	}
	
	public bool closeConnection() {
		file.Close();
		return true;
	}
	
}