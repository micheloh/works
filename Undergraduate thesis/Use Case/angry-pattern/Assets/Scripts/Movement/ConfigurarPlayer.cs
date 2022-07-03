//------------------------------------------------------------------------------
// Classe para instanciar o pattern no Unity
//------------------------------------------------------------------------------
using System;
using UnityEngine;

public class ConfigurarPlayer : MonoBehaviour
{
	void Awake() {
		FacadeService fs = new FacadeService();
		fs.camera();
		fs.movimentoPlayer();
	}

}

