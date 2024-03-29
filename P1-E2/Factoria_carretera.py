from Factoria_carrera_y_bicicleta import Factoria_carrera_y_bicicleta
from Carrera_carretera import Carrera_carretera
from Bici_carretera import Bici_carretera

import random, time

class Factoria_carretera(Factoria_carrera_y_bicicleta):
    def crearCarrera(self):
        carrera = Carrera_carretera()
        carrera.Crear_carrera()

        carrera.Bicicleta.clear()
        carrera.Num_bicicletas = random.randint(5, 10)

        bici_prototipo = self.crearBicicleta()
        contador = 0
        print("Bicicletas que comienzan:")
        for i in range (0, carrera.Num_bicicletas):
            contador += 1
            nueva_bici = bici_prototipo.Clone()
            nueva_bici.id = contador
            print ("Bici: " + str(nueva_bici.id))
            carrera.Bicicleta.append(nueva_bici)

        retirada = carrera.Num_bicicletas * 0.1

        random.shuffle(carrera.Bicicleta)
        for i in range(0, int(retirada)):
            carrera.Bicicleta.pop()

        carrera.Num_bicicletas = len(carrera.Bicicleta)

        time.sleep(60)

        print ("Bicicletas que acaban:")
        for i in range(0, carrera.Num_bicicletas):
            print ("Bici :" + str(carrera.Bicicleta[i].id))

        return carrera
    
    def crearBicicleta(self):
        return Bici_carretera()