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
