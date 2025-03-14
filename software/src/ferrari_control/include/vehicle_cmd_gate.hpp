/**
 * @file vehicle_cmd_gate.cpp
 * @brief The vehicle_cmd_gate is used to select wheter to use the internal controller or the external controller, and send the command to the vehicle.
 *
 * @author Tommaso Bocchietti
 * @date 28/02/2025
 * @link https://autowarefoundation.github.io/autoware-documentation/main/
 */

#include <ros/ros.h>
#include "ferrari_common/control_cmd.h"
#include "ferrari_common/set_gate_mode.h"
#include "ferrari_common/get_gate_mode.h"

enum class GateMode
{
    INTERNAL,
    EXTERNAL
};

class VehicleCmdGate
{
private:
    ros::NodeHandle nh;
    ros::Subscriber sub_internal_control_cmd;
    ros::Subscriber sub_external_control_cmd;
    ros::Publisher pub_control_cmd;
    ros::ServiceServer srv_set_gate_mode;
    ros::ServiceServer srv_get_gate_mode;

    GateMode gate_mode;

    void internalControlCmdCallback(const ferrari_common::control_cmd::ConstPtr &msg);
    void externalControlCmdCallback(const ferrari_common::control_cmd::ConstPtr &msg);
    void sendControlCmd(const ferrari_common::control_cmd::ConstPtr &msg);
    bool setGateModeCallback(ferrari_common::set_gate_mode::Request &req,
                             ferrari_common::set_gate_mode::Response &res);
    bool getGateModeCallback(ferrari_common::get_gate_mode::Request &req,
                             ferrari_common::get_gate_mode::Response &res);

public:
    VehicleCmdGate();
    ~VehicleCmdGate();
};
