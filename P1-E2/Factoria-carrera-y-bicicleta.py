from abc import ABC, abstractmethod

class FactoriaCarreraYBicicleta(ABC):
    @abstractmethod
    def crearCarrera(self): pass
    def crearBicicleta(self): pass

class FactoriaMontaña(FactoriaCarreraYBicicleta):
    def crearCarrera(self): return CarreraMontaña()
    def crearBicicleta(self): return BicicletaMontaña()

class FactoriaCarretera(FactoriaCarreraYBicicleta):
    def crearCarrera(self): return CarreraCarretera()
    def crearBicicleta(self): return BicicletaCarretera()




class Carrera(ABC):
    @abstractmethod
    def crearCarrera(self): pass

class CarreraMontaña(Carrera):
    def crearCarrera(self): return "Creando carrera de montaña"

class CarreraCarretera(Carrera):
    def crearCarrera(self): return "Creando carrera de carretera"



class Bicicleta(ABC):
    @abstractmethod
    def crearBicicleta(self): pass

class BicicletaMontaña(Bicicleta):
    def crearBicicleta(self): return "Creando bicicleta de montaña"

class BicicletaCarretera(Bicicleta):
    def crearBicicleta(self): return "Creando bicicleta de carretera"

#Uso
    
#Uso carretera
carreteraFactory = FactoriaCarretera()

carreraC = carreteraFactory.crearCarrera()
print(carreraC.crearCarrera())

bicicletaC = carreteraFactory.crearBicicleta()
print(bicicletaC.crearBicicleta())

########################################################


#Uso montaña
montañaFactory = FactoriaMontaña()

carreraM = montañaFactory.crearCarrera()
print(carreraM.crearCarrera())

bicicletaM = montañaFactory.crearBicicleta()
print(bicicletaM.crearBicicleta())

#Preguntarle sobre si debemos implementar el patron prototipo en el diagrama UML
#Pregunttarle si podemos dejar todas las clases en un mismo archivo, en vez de un archivo por cada clase