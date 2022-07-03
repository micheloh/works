//------------------------------------------------------------------------------
// Classe para instanciar o pattern no Unity
//------------------------------------------------------------------------------
using System;
using UnityEngine;

public class CameraOVR : MonoBehaviour
{
	void Awake() {
		new FacadeService().camera();
	}
}

