from setuptools import find_packages, setup

package_name = 'tecx'

setup(
    name=package_name,
    version='0.0.1',
    packages=find_packages(exclude=['test']),
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='Rahul Saini',
    maintainer_email='cto@tecx.ai',
    description='Custom ROS 2 Python package running on Android Termux',
    license='Apache-2.0',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
            # format: 'executable_name = package_name.file_name:main_function'
            'talker_node = tecx.tecx_edge:main'
        ],
    },
)
