CREATE TABLE `ajTravelAJT` (
  `AJTId` int(11) NOT NULL AUTO_INCREMENT,
  `AJTTitulo` varchar(100) NOT NULL,
  `AJTConteudo` varchar(2000) NOT NULL,
  PRIMARY KEY (`AJTId`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

CREATE TABLE `ajTravelBanner` (
  `bannerId` int(11) NOT NULL AUTO_INCREMENT,
  `bannerURL` varchar(100) NOT NULL,
  `bannerConteudo` varchar(100) DEFAULT NULL,
  `bannerPosicao` int(11) NOT NULL,
  PRIMARY KEY (`bannerId`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;

CREATE TABLE `ajTravelContato` (
  `contatoId` int(11) NOT NULL,
  `contatoConteudo` varchar(1000) NOT NULL,
  PRIMARY KEY (`contatoId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `ajTravelSegmentos` (
  `segmentoId` int(11) NOT NULL AUTO_INCREMENT,
  `segmentoTitulo` varchar(100) NOT NULL,
  `segmentoURL` varchar(100) NOT NULL,
  PRIMARY KEY (`segmentoId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

CREATE TABLE `ajTravelEmpresas` (
  `empresaId` int(11) NOT NULL AUTO_INCREMENT,
  `empresaNome` varchar(100) NOT NULL,
  `empresaDesc` varchar(1000) NOT NULL,
  `empresaTipo` int(11) NOT NULL,
  `segmentoId` int(11) NOT NULL,
  PRIMARY KEY (`empresaId`),
  KEY `segmentoId` (`segmentoId`),
  CONSTRAINT `ajTravelEmpresas_ibfk_1` FOREIGN KEY (`segmentoId`) REFERENCES `ajTravelSegmentos` (`segmentoId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

CREATE TABLE `ajTravelHome` (
  `homeId` int(1) NOT NULL AUTO_INCREMENT,
  `homeTitulo` varchar(100) NOT NULL,
  `homeConteudo` varchar(2000) NOT NULL,
  `homeURL` varchar(100) NOT NULL,
  PRIMARY KEY (`homeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `ajTravelLogin` (
  `loginUser` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `loginSenha` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  UNIQUE KEY `loginUser` (`loginUser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `ajTravelParceiro` (
  `parceiroId` int(11) NOT NULL AUTO_INCREMENT,
  `parceiroTitulo` varchar(100) NOT NULL,
  `parceiroURL` varchar(100) NOT NULL,
  `parceiroDesc` varchar(2000) NOT NULL,
  PRIMARY KEY (`parceiroId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

CREATE TABLE `ajTravelServicos` (
  `ServicosId` int(11) NOT NULL AUTO_INCREMENT,
  `ServicosTitulo` varchar(100) NOT NULL,
  `ServicosConteudo` varchar(2000) NOT NULL,
  PRIMARY KEY (`ServicosId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

