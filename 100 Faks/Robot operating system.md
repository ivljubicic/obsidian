# Commands breakdown
- rostopic
- rosnode
- rosparam
- rostopic pub
	- http://wiki.ros.org/ROS/Tutorials/UnderstandingTopics
	- `rostopic pub /turtle1/cmd_vel -r 5 geometry_msgs/Twist '[2.0, 0.0, 0.0]' '[0.0, 0.0, 1.8]'`
- rosservice

# Creating our publisher
```python
rospy.init_node('publisher')
```

- see send messages
	- `rostopic echo [topic]`	
- zasto je turtlesim trebao biti na listi dependencia