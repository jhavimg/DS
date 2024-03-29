from abc import ABC, abstractmethod

class Factoria_carrera_y_bicicleta(ABC):
    @abstractmethod
    def crearCarrera(self):
        pass

    @abstractmethod
    def crearBicicleta(self):
        pass