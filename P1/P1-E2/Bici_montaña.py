from Bicicleta import Bicicleta
from copy import deepcopy

class Bici_montaña(Bicicleta):
    def Crear_bici(self):
        return "Creada bicicleta de montaña"
    
    def Clone(self):
        return deepcopy(self)