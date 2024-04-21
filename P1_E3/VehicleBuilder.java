package P1_E3;

public abstract class VehicleBuilder {
    protected Vehicle vehicle;

    public Vehicle getVehicle() {
        return vehicle;
    }

    public void createNewVehicle() {
        vehicle = new Vehicle();
    }

    public abstract void buildEngine(String engine);
    public abstract void buildWheels();
    public abstract void buildColor(boolean customized, String color);
    public abstract void buildAudioSystem(boolean audioSystem);
    public abstract void buildTransmission(boolean transmission);
}