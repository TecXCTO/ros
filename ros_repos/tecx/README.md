To run own custom GitHub repository in ROS 2, repository must have a specific folder structure containing configuration files (package.xml and setup.py). ROS 2 cannot compile or run loose, unorganized Python files directly from GitHub.Here is the exact blueprint to structure your GitHub repository and the commands to run it on your phone.


```
tecx/
├── package.xml             # Defines dependencies (rclpy, std_msgs)
├── setup.py                # Defines executable script paths
├── setup.cfg               # Defines script installation paths
└── your_package_name/      # Folder must match package name
    ├── __init__.py
    └── your_script.py      # Your actual Python code
```
```

# 1. Create a structured workspace folder tree layout
mkdir -p ~/dev_ws/src

# cd ~/dev_ws/src

# 1. Clear workspace and enter your package source folder
cd ~/ros2_ws/src

# 2. Clone your newly created clean repository architecture
git clone https://ghproxy.com

# 3. Jump to the root directory of your workspace and compile it
cd ~/ros2_ws
colcon build

# 4. Activate your custom built package workspace links
source install/setup.bash

# 5. Run your node using the executable terminal link name we set inside setup.py!
ros2 run my_robot_package talker_node
```
