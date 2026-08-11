# simple_publisher.py
"""
Python Publisher Node ExampleCreate a file named simple_publisher.py inside your container and paste this exact clean code template:
"""
import rclpy
from rclpy.node import Node
from std_msgs.msg import String

class MinimalPublisher(Node):
    def __init__(self):
        # Initialize the node with the name 'minimal_publisher'
        super().__init__('minimal_publisher')
        # Create a topic named 'chatter' passing String messages, queue size = 10
        self.publisher_ = self.create_publisher(String, 'chatter', 10)
        # Create a timer that executes the callback function every 0.5 seconds
        self.timer = self.create_timer(0.5, self.timer_callback)
        self.i = 0

    def timer_callback(self):
        msg = String()
        msg.data = f'Hello World from Android Terminal: {self.i}'
        self.publisher_.publish(msg)
        self.get_logger().info(f'Publishing: "{msg.data}"')
        self.i += 1

def main(args=None):
    rclpy.init(args=args)
    minimal_publisher = MinimalPublisher()
    # Keep the node running in a loop
    rclpy.spin(minimal_publisher)
    minimal_publisher.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
  
