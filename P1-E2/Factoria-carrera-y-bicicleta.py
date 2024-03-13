from abc import ABC, abstractmethod
import random

class Factoria_carrera_y_bicicleta(ABC):
    @abstractmethod
    def crearCarrera(self):
        pass

    @abstractmethod
    def crearBicicleta(self):
        pass





class Factoria_montaña(Factoria_carrera_y_bicicleta):
    def crearCarrera(self):
        return Carrera_montaña()
    
    def crearBicicleta(self):
        return Bici_montaña()
    
class Factoria_carretera(Factoria_carrera_y_bicicleta):
    def crearCarrera(self):
        return Carrera_carretera()
    
    def crearBicicleta(self):
        return Bici_carretera()
    




    
class Carrera(ABC):
    Bicicleta = []
    Num_bicicletas = random.randint(10, 100)

    @abstractmethod
    def Crear_carrera(self):
        pass
    
    @abstractmethod
    def Clone(self):
        pass

class Carrera_montaña(Carrera):
    def Crear_carrera(self):
        return "Creada carrera montaña"
    
    def Clone(self):
        return 
    
class Carrera_carretera(Carrera):
    def Crear_carrera(self):
        return "Creada carrera carretera"
    



class Bicicleta(ABC):
    @abstractmethod
    def Crear_bici(self):
        pass

    @abstractmethod
    def Clone(self):
        pass
    
class Bici_montaña(Bicicleta):
    def Crear_bici(self):
        return "Creada bicicleta de montaña"

class Bici_carretera(Bicicleta):
    def Crear_bici(self):
        return "Creada bicicleta de carretera"
    
# uso carrera
    
factory = Factoria_montaña()
carrera = factory.crearCarrera()
bici = factory.crearBicicleta()
print (carrera.Crear_carrera())
print (bici.Crear_bici())


# uso bicicleta

# factory_bici = Factoria_carretera()
# bici = factory_bici.crearBicicleta()
# print (bici.Crear_bici())