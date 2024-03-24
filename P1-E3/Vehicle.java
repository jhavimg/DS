package EJ3;

public class Vehicle {
    public double baseCost;
    public String engine;
    public int wheels;
    public boolean color;
    public String color_vehicle;
    public boolean audioSystem;
    public boolean transmission;

    public double calculateCost(double baseCost) {
        this.baseCost = baseCost;
        double additionalCost = 0;

        additionalCost += color ? 500 : 0;
        additionalCost += audioSystem ? 1000 : 0;
        additionalCost += transmission ? 1500 : 0;
        
        return baseCost + additionalCost;
    }

    @Override
    public String toString() {
        String colorString = color ? "Personalizado" : "No personalizado";
        String audioSystemString = audioSystem ? "Personalizado" : "No personalizado";
        String transmissionString = transmission ? "Personalizada" : "No personalizada";

        return String.format("\nMotor: %s\nRuedas: %d\nColor: %s\nColor del vehiculo: %s\nSistema de audio: %s\nTransmision: %s",
                engine, wheels, colorString, color_vehicle, audioSystemString, transmissionString);
    }
}
