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
