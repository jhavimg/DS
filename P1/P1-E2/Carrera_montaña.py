from Carrera import Carrera
from copy import deepcopy

class Carrera_montaña(Carrera):
    def Crear_carrera(self):
        print("Creada carrera montaña")
    
    def Clone(self):
        return deepcopy(self)