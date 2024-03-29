from abc import ABC, abstractmethod

class Bicicleta(ABC):
    id = -1

    @abstractmethod
    def Crear_bici(self):
        pass

    @abstractmethod
    def Clone(self):
        pass