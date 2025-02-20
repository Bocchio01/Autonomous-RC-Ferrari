#include "network/network.hpp"
#include "vehicle/vehicle.hpp"

Network::Network() : vehicle(nullptr) {}

Network::Network(VehicleCore& vehicle) : vehicle(&vehicle) {}

Network::~Network() {}

void Network::bindVehicle(VehicleCore& vehicle) {
    this->vehicle = &vehicle;
}

void Network::addPublisher(std::shared_ptr<Publisher> publisher) {
    publishers.push_back(publisher);
}

void Network::addSubscriber(std::shared_ptr<Subscriber> subscriber) {
    subscribers.push_back(subscriber);
}

void Network::addService(std::shared_ptr<Service> service) {
    services.push_back(service);
}

void Network::init() {
    nh.initNode();

    for (auto& pub : publishers) pub->init(nh);
    for (auto& sub : subscribers) sub->init(nh, *vehicle);
    for (auto& srv : services) srv->init(nh, *vehicle);
}

void Network::spinOnce() {
    nh.spinOnce();
}
