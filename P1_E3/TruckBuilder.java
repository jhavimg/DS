package P1_E3;

public class TruckBuilder extends VehicleBuilder {
    public TruckBuilder() {
        createNewVehicle();
    }

    public void buildEngine(String engine) {
        vehicle.engine = engine;
    }

    public void buildWheels() {
        vehicle.wheels = 6;
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