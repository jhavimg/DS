from abc import ABC, abstractmethod

class Carrera(ABC):
    Bicicleta = []
    Num_bicicletas = 0

    @abstractmethod
    def Crear_carrera(self):
        pass
    
    @abstractmethod
    def Clone(self):
        pass