import random
clientes = [1,2,3,4] 
vehiculos =[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]
dias = [1,2,3,4,5,6,7,8,9,10,11,12,13,14]
fechas = ['20221211','20221210','20221209','20221208','20221207','20221206','20221205','20221204','20221203']

for i in range(1,51):
    cliente = random.choice(clientes)
    vehi = random.choice(vehiculos)
    dia = random.choice(dias)
    fecha = random.choice(fechas)

    print("EXEC AlquilarVehiculo {},{},{},'{}'".format(cliente,vehi,dia,fecha))