package EJ3;

public class MotorcycleBuilder extends VehicleBuilder {
    public MotorcycleBuilder() {
        createNewVehicle();
    }

    public void buildEngine(String engine) {
        vehicle.engine = engine;
    }

    public void buildWheels() {
        vehicle.wheels = 2;
    }

    public void buildColor(boolean color, String color_vehicle) {
        vehicle.color = color;
        vehicle.color_vehicle = color_vehicle;
    }

    public void buildAudioSystem(boolean audioSystem) {
        vehicle.audioSystem = audioSystem;
    }

    public void buildTransmission(boolean transmission) {
        vehicle.transmission = transmission;
    }
}
