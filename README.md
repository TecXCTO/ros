# <b> ROS

#"ROS" most commonly refers to the Robot Operating System, an open-source framework and collection of software tools used to build complex robot applications.

1. Robot Operating System (Robotics)
Despite its name, ROS is not a traditional operating system (like Windows) but rather a middleware or SDK that sits on top of an OS (usually Linux) to manage hardware and software communication. 
Communication: ROS uses a "node" system where individual programs (nodes) communicate via "topics" (publish/subscribe) or "services" (request/response).
Hardware Abstraction: It provides drivers and interfaces that allow developers to write code for a robot without needing to know the specific details of its sensors or motors.
Common Packages: It features thousands of ready-to-use packages for standard tasks like navigation (SLAM), motion planning (MoveIt), and perception (OpenCV).
Simulation & Visualization: Tools like Gazebo (physics-based simulation) and RViz (3D visualization) allow developers to test robots virtually before deploying them on physical hardware.
Industry Standards: ROS 2 is the modern version designed for production environments, offering enhanced security, real-time performance, and multi-robot support. 

# ros

# create a new repository on the command line
 
echo "# ros" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/TecXCTO/ros.git
git push -u origin main

# push an existing repository from the command line

git remote add origin https://github.com/TecXCTO/ros.git
git branch -M main
git push -u origin main

md C:\pixi_ws
cd C:\pixi_ws
powershell -ExecutionPolicy Bypass -c "irm -useb https://pixi.sh/install.ps1 | iex"
irm https://raw.githubusercontent.com/ros2/ros2/refs/heads/kilted/pixi.toml -OutFile pixi.toml
pixi install

# Download https://github.com/ros2/ros2/releases

call C:\pixi_ws\ros2-windows\local_setup.bat


#Try some examples
#In a command prompt, set up the ROS 2 environment as described above and then run a C++ talker:

ros2 run demo_nodes_cpp talker
#Start another command shell and run a Python listener:

ros2 run demo_nodes_py listener
#You should see the talker saying that it’s Publishing messages and the listener saying I heard those messages. This verifies both the C++ and Python APIs are working properly. Hooray!

#Uninstall
#If you installed your workspace with colcon as instructed above, “uninstalling” could be just a matter of opening a new terminal and not sourcing the workspace’s setup file. This way, your environment will behave as though there is no Kilted install on your system.

#If you’re also trying to free up space, you can delete the entire workspace directory with:

rmdir /s /q C:\pixi_ws





pixi shell


To ensure Pixi installs its global data and package cache on the D: drive instead of the C: drive, you need to set specific environment variables before running any commands. By default, Pixi uses %UserProfile%\.pixi and %LOCALAPPDATA%\rattler for these files. 
Step 1: Set Environment Variables
Open a PowerShell terminal and run these commands to redirect Pixi's storage folders to the D: drive for the current session:
powershell
# Set Pixi's home folder (for global environments/configs) to D:
$env:PIXI_HOME = "D:\.pixi"

# Set Pixi's global package cache to D:
$env:PIXI_CACHE_DIR = "D:\pixi_cache"
Use code with caution.

[Note: You can permanently set these in Windows System Properties > Environment Variables to avoid re-typing them.] 
Step 2: Download and Initialize in D:
Now, proceed with your commands within the desired directory on the D: drive.
powershell
# Switch to D: drive and enter your workspace
D:
cd \pixi_ws

# Download the manifest
irm raw.githubusercontent.com -OutFile pixi.toml

# Install dependencies (they will now go to D:\pixi_cache and D:\pixi_ws\.pixi)
pixi install
Use code with caution.

Why this works:
PIXI_HOME: Controls where the standalone pixi binary and global environments are stored.
PIXI_CACHE_DIR: Controls where the large downloaded package binaries are cached globally.
Project-Local Files: By running these commands inside D:\pixi_ws, the project-specific environment (the .pixi folder) will naturally be created on the D: drive within that workspace folder. 





To "uninstall" a ROS 2 Kilted workspace managed by Pixi on Windows and free up space, you can use the following methods:
1. Remove Environment Files (Save Config)
If you want to keep your project configuration (pixi.toml) but delete the large installed dependencies and environment files:
Command: Run pixi clean from within the D:\pixi_ws directory.
Manual Alternative: Delete the hidden .pixi folder inside your workspace:
rmdir /s /q D:\pixi_ws\.pixi. 
2. Complete Workspace Removal
To completely delete the entire workspace and all downloaded files (including the pixi.toml you just downloaded):
Command: Navigate out of the directory and delete it entirely:
cd ..
rmdir /s /q D:\pixi_ws. 
3. Clear Global Cache
Pixi stores downloaded packages in a shared global cache. To free up space taken by these cached binaries:
Command: pixi clean cache.
To only remove unused cached items: pixi clean cache --unused. 
Summary of Commands
Action 	Command
Remove local environment	pixi clean
Delete entire workspace	rmdir /s /q D:\pixi_ws
Clear global package cache	pixi clean cache
Uninstall Pixi itself	Delete the ~/.pixi directory (typically in your user home folder).





To "uninstall" a colcon workspace and free up disk space, you can delete the entire workspace directory from your system. 
Uninstalling and Freeing Space
Remove Workspace Directories: To free up space, delete the directory where you built the workspace. For a standard ROS 2 source installation, use the command:
rm -rf ~/ros2_kilted (or the specific name of your workspace, such as ~/ros2_ws).
Clean Specific Build Artifacts: If you want to keep the source code but free up space consumed by the build process, you can delete only the generated folders:
rm -rf build/ install/ log/.
Use colcon-clean: If installed, you can use the colcon-clean extension to safely manage and remove build, install, and log paths:
colcon clean workspace. 
Removing Environment References
Check Shell Startup Scripts: If you added a line to your .bashrc, .zshrc, or other shell startup scripts to automatically source the workspace, you must remove that line.
Example: Open the file with a text editor like gedit ~/.bashrc and delete the line source ~/ros2_ws/install/setup.bash.
Restart Terminals: Simply closing your current terminal and opening a new one ensures the workspace is no longer sourced in your environment. 


Quick Demo#
Project setup is a breeze with Pixi.


pixi init hello-world
cd hello-world
pixi add python
pixi run python -c 'print("Hello World!")'
Pixi Demo

Install your favorite tools with a single command.


pixi global install gh nvim ipython btop ripgrep
Pixi Global Demo





