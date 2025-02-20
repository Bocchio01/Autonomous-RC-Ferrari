#pragma once

typedef struct 
{
    double wheelBase;
    double wheelTrack;
} kinematicsData_t;

typedef struct 
{
    double maxSteeringAngle;
    double maxVelocity;
} actuatorsData_t;

typedef struct 
{
    double length;
    double width;
    double height;
} boundingBox_t;

typedef struct 
{
    char name[20];
    const char *kinematicsType;
    kinematicsData_t kinematicsData;
    actuatorsData_t actuatorsData;
    // sensorsData_t sensorsData;
    boundingBox_t boundingBox;
} vehicleInfo_t;

class VehicleCore
{
public:
    virtual ~VehicleCore() {}
    virtual void move(double input1, double input2) = 0;
    // virtual std::string getKinematicsType() = 0;
};




template <typename KinematicModel>
class Vehicle : public VehicleCore
{
private:
    KinematicModel kinematicModel;

public:
    template <typename... Args>
    Vehicle(Args &...args);

    void move(double input1, double input2) override;

    // std::string getKinematicsType() override;
};

template <typename KinematicModel>
template <typename... Args>
Vehicle<KinematicModel>::Vehicle(Args &...args)
    : kinematicModel(args...) {}

template <typename KinematicModel>
void Vehicle<KinematicModel>::move(double input1, double input2)
{
    kinematicModel.move(input1, input2);
}

// template <typename KinematicModel>
// std::string Vehicle<KinematicModel>::getKinematicsType()
// {
//     return KinematicModel::type();
// }