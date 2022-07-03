//------------------------------------------------------------------------------
// Classe: FacadeService
// Pattern: Processing
//------------------------------------------------------------------------------
using System;
using UnityEngine;

public class FacadeService
{
	//variaveis da abstract factory que a Facade acessa
	private ServiceTypeFactory ioFactory;
	private ServiceTypeFactory processingFactory;
	private ServiceTypeFactory daoFactory;

	private Service ioService;
	private Service processingService;
	private Service daoService;

	public FacadeService() //Abstract Factory é criado junto com a Facade
	{
		this.ioFactory = new IOFactory();
		this.processingFactory = new ProcessingFactory();
		this.daoFactory = new DAOFactory();

		this.ioService = ioFactory.createService();
		this.processingService = processingFactory.createService();
		this.daoService = daoFactory.createService();
	}

	public void controlHands() //Método para controle e processamento das mãos
	{
		processingService.doService((IOService) ioService, 1);
	}

	public void movimentoPlayer() //Método para processamento do movimento do player
	{
		processingService.doService(1);
	}

	public void camera() //Método para enviar dados para o Oculus Rift
	{
		processingService.doService((IOService) ioService, 2);
	}
}


