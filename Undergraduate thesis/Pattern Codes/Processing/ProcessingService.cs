//------------------------------------------------------------------------------
// Classe: ProcessingService
// Pattern: Processing
//------------------------------------------------------------------------------
using System;
using System.Collections;
using UnityEngine;

public class ProcessingService : Service
{
	//Variaveis
	private static GameObject playerObj = GameObject.Find("Player");
	private static HandController handController = playerObj.GetComponentInChildren<HandController>();

	public override void doService(int opcao) {
		switch (opcao) {
		case 1: //Inclui os processamentos do movimento do Player e o movimento do Oculus Rift

			FreeMovementMotor fmm = playerObj.AddComponent<FreeMovementMotor>();
			PlayerMoveController pmc = playerObj.AddComponent<PlayerMoveController>();

			//OVRMainMenu omm = playerObj.AddComponent<OVRMainMenu>();
			OVRGamepadController ogc = playerObj.AddComponent<OVRGamepadController>();
			OVRPlayerController opc = playerObj.AddComponent<OVRPlayerController>();
			break;
		default:
			Debug.LogWarning("Invalid option in ProcessingService.");
			break;
		}
	}

	//metodo para interacao IOService -> ProcessingService
	public override void doService(IOService ios, int opcao) {
		switch (opcao) {
		case 1: //processar movimento das maos para movimentar o player para frente
			if (playerObj == null || handController == null)
				return;

			ios.doService(1); //busca na IOService as maos do Leap
			HandModel[] hands = ios.hand;

            if (hands.Length >= 1)
			{
				Vector3 direction0 = (hands[0].GetPalmPosition() - handController.transform.position).normalized;
				Vector3 normal0 = hands[0].GetPalmNormal().normalized;
			
				if (Vector3.Dot(direction0, normal0) > direction0.sqrMagnitude * 0.5f)
				{
					Vector3 target = hands[0].GetPalmPosition();
                    GameObject player = GameObject.Find("Player");
                    MovementMotor mm = (MovementMotor)player.GetComponent<FreeMovementMotor>();
                    Quaternion qt = Quaternion.Euler(Camera.main.transform.eulerAngles.x, 
                        Camera.main.transform.eulerAngles.y, Camera.main.transform.eulerAngles.z);
                    Vector3 v3 = qt * Vector3.forward;
                    mm.movementDirection = Input.GetAxis("Vertical") * v3;
				}
                
                
			}
			break;
		case 2: //Envia dados para a camera do Oculus Rift
			ios.doService(2);
			break;
		default:
			Debug.LogWarning("Invalid option in ProcessingService.");
			break;
		}
	}

    public static Vector3 PlaneRayIntersection(Plane plane, Ray ray)
    {
        float dist;
        plane.Raycast(ray, out dist);
        return ray.GetPoint(dist);
    }

    public static Vector3 ScreenPointToWorldPointOnPlane(Vector3 screenPoint, Plane plane, Camera camera)
    {
        // Set up a ray corresponding to the screen position
        Ray ray = camera.ScreenPointToRay(screenPoint);

        // Find out where the ray intersects with the plane
        return PlaneRayIntersection(plane, ray);
    }

}


