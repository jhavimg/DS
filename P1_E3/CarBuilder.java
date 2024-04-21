package P1_E3;

public class CarBuilder extends VehicleBuilder {
    public CarBuilder() {
        createNewVehicle();
    }

    public void buildEngine(String engine) {
        vehicle.engine = engine;
    }

    public void buildWheels() {
        vehicle.wheels = 4;
    }

    public void buildColor(boolean customized, String color) {
        vehicle.color = customized;
        vehicle.color_vehicle = color;
    }

    public void buildAudioSystem(boolean audioSystem) {
        vehicle.audioSystem = audioSystem;
    }

    public void buildTransmission(boolean transmission) {
        vehicle.transmission = transmission;
    }
}