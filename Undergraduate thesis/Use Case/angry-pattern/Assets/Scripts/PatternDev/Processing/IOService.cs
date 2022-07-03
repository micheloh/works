//------------------------------------------------------------------------------
// Classe: IOService
// Pattern: Processing
//------------------------------------------------------------------------------
using System;
using UnityEngine;

public class IOService : Service
{
	private HandModel[] _hand = null;

	public override void doService(int opcao) {
		switch (opcao) {
		case 1: //TrackingAdapter
			TrackingAdapter ta = new TrackingAdapter();
			_hand = (HandModel[]) ta.read(1);
			break;
		case 2: //FeedbackAdapter
			FeedbackAdapter fa = new FeedbackAdapter();
			fa.write();
			break;
		case 3: //Wifi
			Communicator wifi = new Wifi();
			break;
		case 4: //Bluetooth
			Communicator bt = new Bluetooth();
			break;
		default:
			Debug.LogWarning("Invalid option in IOService.");
			break;
		}
	}

	public override void doService(IOService serv, int opcao) {

	}

	public HandModel[] hand { 
		get { return _hand;}
		set { _hand = value;}
	}
}


