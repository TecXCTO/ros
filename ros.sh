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
