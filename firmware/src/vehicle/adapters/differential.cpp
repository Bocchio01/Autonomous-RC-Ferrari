#include "vehicle/interfaces/kinematic.hpp"
#include "vehicle/kinematics/differential.hpp"
#include "vehicle/actuators/steering.hpp"
#include "vehicle/actuators/propulsion.hpp"

KinematicDifferential::KinematicDifferential()
    : actuator_propulsion_right(nullptr),
      actuator_propulsion_left(nullptr)
{
    this->kinematic_type = Type::DIFFERENTIAL;
}

void KinematicDifferential::bindActuatorPropulsion(ActuatorPropulsion &actuator_propulsion, KinematicDifferential::ActuatorPropulsionSide side)
{
    switch (side)
    {
    case KinematicDifferential::ActuatorPropulsionSide::LEFT:
        this->actuator_propulsion_left = &actuator_propulsion;
        this->actuator_propulsion_left->reset();
        this->actuator_propulsion_left->disarm();
        break;

    case KinematicDifferential::ActuatorPropulsionSide::RIGHT:
        this->actuator_propulsion_right = &actuator_propulsion;
        this->actuator_propulsion_right->reset();
        this->actuator_propulsion_right->disarm();
        break;
    }
}

void KinematicDifferential::executeMotionCommand(const ferrari_common::motion_cmd &motion_cmd)
{
    int16_t throttle_left = motion_cmd.vehicle_yaw_rate - static_cast<int16_t>(motion_cmd.vehicle_longitudinal_rate / 2);
    int16_t throttle_right = motion_cmd.vehicle_yaw_rate + static_cast<int16_t>(motion_cmd.vehicle_longitudinal_rate / 2);

    this->actuator_propulsion_right->setThrottle(throttle_right);
    // this->actuator_propulsion_right->update();

    this->actuator_propulsion_left->setThrottle(throttle_left);
    // this->actuator_propulsion_left->update();
}

bool KinematicDifferential::executeArming()
{
    this->actuator_propulsion_left->arm();
    this->actuator_propulsion_right->arm();

    return true;
}

bool KinematicDifferential::executeDisarming()
{
    this->actuator_propulsion_left->disarm();
    this->actuator_propulsion_right->disarm();

    return true;
}

bool KinematicDifferential::isArmed()
{
    return this->actuator_propulsion_left->isArmed() && this->actuator_propulsion_right->isArmed();
}