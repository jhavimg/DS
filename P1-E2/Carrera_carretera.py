from Carrera import Carrera
from copy import deepcopy

class Carrera_carretera(Carrera):
    def Crear_carrera(self):
        print("Creada carrera carretera")
    
    def Clone(self):
        return deepcopy(self)