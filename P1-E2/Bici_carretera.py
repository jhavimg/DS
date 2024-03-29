from Bicicleta import Bicicleta
from copy import deepcopy

class Bici_carretera(Bicicleta):
    def Crear_bici(self):
        return "Creada bicicleta de carretera"
    
    def Clone(self):
        return deepcopy(self)