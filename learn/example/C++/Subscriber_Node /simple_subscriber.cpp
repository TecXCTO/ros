// C++ Subscriber Node ExampleCreate a file named simple_subscriber.cpp and paste this code:
#include <memory>
#include "rclcpp/rclcpp.hpp"
#include "std_msgs/msg/string.hpp"

using std::placeholders::_1;

class MinimalSubscriber : public rclcpp::Node {
public:
  MinimalSubscriber() : Node("minimal_subscriber") {
    // Subscribe to the 'chatter' topic and route incoming data to the callback
    subscription_ = this->create_subscription<std_msgs::msg::String>(
      "chatter", 10, std::bind(&MinimalSubscriber::topic_callback, this, _1));
  }

private:
  void topic_callback(const std_msgs::msg::String::SharedPtr msg) const {
    RCLCPP_INFO(this->get_logger(), "I heard data: '%s'", msg->data.c_str());
  }
  rclcpp::Subscription<std_msgs::msg::String>::SharedPtr subscription_;
};

int main(int argc, char * argv[]) {
  rclcpp::init(argc, argv);
  rclcpp::spin(std::make_shared<MinimalSubscriber>());
  rclcpp::shutdown();
  return 0;
}
