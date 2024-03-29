package EJ3;

public class VehicleDirector {
    private VehicleBuilder builder;

    public VehicleDirector(VehicleBuilder builder) {
        this.builder = builder;
    }

    public void constructVehicle() {
        builder.buildEngine(builder.vehicle.engine);
        builder.buildWheels();
        builder.buildColor(builder.vehicle.color, builder.vehicle.color_vehicle);
        builder.buildAudioSystem(builder.vehicle.audioSystem);
        builder.buildTransmission(builder.vehicle.transmission);
    }
}
