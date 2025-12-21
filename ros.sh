# Create a location for the ROS 2 installation

md C:\dev
or
md D:\dev

# Increase the Windows maximum path length

New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "LongPathsEnabled" -Value 1 -PropertyType DWORD -Force

# Install prerequisites
# Install MSVC
# In order to compile the ROS 2 code, the MSVC compiler must be installed. Currently it is recommended to use MSVC 2019.

# Continue using the previous powershell session, and run the following command to download it:

irm https://aka.ms/vs/16/release/vs_buildtools.exe -OutFile vs_buildtools_2019.exe

# Now install MSVC 2019:

.\vs_buildtools_2019.exe --quiet --wait --norestart --add Microsoft.Component.MSBuild --add Microsoft.Net.Component.4.6.1.TargetingPack --add Microsoft.Net.Component.4.8.SDK --add Microsoft.VisualStudio.Component.CoreBuildTools --add Microsoft.VisualStudio.Component.Roslyn.Compiler --add Microsoft.VisualStudio.Component.TextTemplating --add Microsoft.VisualStudio.Component.VC.CLI.Support --add Microsoft.VisualStudio.Component.VC.CoreBuildTools --add Microsoft.VisualStudio.Component.VC.CoreIde --add Microsoft.VisualStudio.Component.VC.Redist.14.Latest --add Microsoft.VisualStudio.Component.VC.Tools.x86.x64 --add Microsoft.VisualStudio.Component.Windows10SDK --add Microsoft.VisualStudio.Component.Windows10SDK.19041 --add Microsoft.VisualStudio.ComponentGroup.NativeDesktop.Core --add Microsoft.VisualStudio.Workload.MSBuildTools --add Microsoft.VisualStudio.Workload.VCTools

# Install pixi
ROS 2 uses conda-forge as a backend for packages, with pixi as the frontend.

Continue using the previous powershell session, and use the instructions from https://pixi.sh/latest/ to install pixi. Once pixi has been installed, close the powershell session and start it again, which will ensure pixi is on the PATH.

# Install dependencies
Download the pixi configuration file in the existing powershell session:

cd C:\dev or cd D:\dev

irm https://raw.githubusercontent.com/ros2/ros2/refs/heads/jazzy/pixi.toml -OutFile pixi.toml

# Install dependencies:

pixi install

You should now close the powershell session, as the rest of the instructions will use the Windows command prompt.

Build ROS 2
Start a new Windows command prompt, which will be used for the build.

Source the MSVC compiler
This is required in the command prompt you’ll use to compile ROS 2, but it is not required when running:

call "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvarsall.bat" x86_amd64

Source the pixi environment
This is required in every command prompt you open to set up paths to the dependencies:

cd C:\dev
pixi shell
Get ROS 2 code
Now that we have the development tools we can get the ROS 2 source code.

Setup a development folder, for example C:\dev\jazzy:

md C:\dev\jazzy\src
cd C:\dev\jazzy
Get the ros2.repos file which defines the repositories to clone from:

vcs import --input https://raw.githubusercontent.com/ros2/ros2/jazzy/ros2.repos src
Install additional RMW implementations (optional)
The default middleware that ROS 2 uses is Fast DDS, but the middleware (RMW) can be replaced at build or runtime. See the guide on how to work with multiple RMWs.

Build the code in the workspace
To build the \jazzy folder tree:

colcon build --merge-install
