package P1_E3;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Bienvenido al configurador de vehículos.");
        System.out.println("Por favor, elija el tipo de vehículo (car/motorcycle/truck):");
        String vehicleType = scanner.nextLine().toLowerCase();

        VehicleBuilder builder = null;
        double baseCost = 0;
        switch (vehicleType) {
            case "car":
                builder = new CarBuilder();
                baseCost = 5000;
                break;
            case "motorcycle":
                builder = new MotorcycleBuilder();
                baseCost = 2500;
                break;
            case "truck":
                builder = new TruckBuilder();
                baseCost = 10000;
                break;
            default:
                System.out.println("Tipo de vehículo no válido. Saliendo del programa.");
                System.exit(1);
        }

        System.out.println("¿Que motor tiene su vehiculo? (gasolina/diesel):");
        String engineOption = scanner.nextLine().toLowerCase();
        if (engineOption.equals("gasolina")) {
            builder.buildEngine(engineOption);
        } else if (engineOption.equals("diesel")) {
            builder.buildEngine(engineOption);
        } else {
            System.out.println("Opción no valida. Saliendo del programa.");
            System.exit(1);
        }

        System.out.println("¿Desea pintar su coche? (y/n):");
        String colorOption = scanner.nextLine().toLowerCase();
        if (colorOption.equals("y")) {
            System.out.println("¿De qué color?");
            String colorVehicleOption = scanner.nextLine().toLowerCase();
            builder.buildColor(true, colorVehicleOption);
        } else if (colorOption.equals("n")){
            builder.buildColor(false, "color base");
        } else {
            System.out.println("Opción no valida. Saliendo del programa.");
            System.exit(1);
        }

        System.out.println("¿Desea personalizar la transmisión? (y/n):");
        String transmissionOption = scanner.nextLine().toLowerCase();
        if (transmissionOption.equals("y")) {
            builder.buildTransmission(true);
        } else if (transmissionOption.equals("n")){
            builder.buildTransmission(false);
        } else {
            System.out.println("Opción no valida. Saliendo del programa.");
            System.exit(1);
        }

        System.out.println("¿Desea personalizar el sistema de audio? (y/n):");
        String audioSystemOption = scanner.nextLine().toLowerCase();
        if (audioSystemOption.equals("y")) {
            builder.buildAudioSystem(true);
        } else if (audioSystemOption.equals("n")){
            builder.buildAudioSystem(false);
        } else {
            System.out.println("Opción no valida. Saliendo del programa.");
            System.exit(1);
        }

        VehicleDirector director = new VehicleDirector(builder);
        director.constructVehicle();
        Vehicle vehicle = builder.getVehicle();

        System.out.println("\n\nEste es su vehículo personalizado:");
        System.out.println(vehicle);
        System.out.printf("Costo total del vehículo: $%.2f\n", vehicle.calculateCost(baseCost));

        scanner.close();
    }
}