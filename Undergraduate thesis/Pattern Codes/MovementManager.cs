//------------------------------------------------------------------------------
// Classe para instanciar o pattern no Unity
//------------------------------------------------------------------------------
using UnityEngine;
using System.Collections;

public class MovementManager : MonoBehaviour {
  public GameObject leapMotionOVRController = null;
  public HandController handController = null;

	public FacadeService fs;
	// Use this for initialization
	void Start () {
		fs = new FacadeService();
	}
	
	// Update is called once per frame
	void Update () {
		fs.controlHands ();

	}
}
