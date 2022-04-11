0202201231918
Tags: 

# Coordinate transformation
# Coordinates
- pose is **relative to a frame**

## Transformations
- `rosrun tf2_tools echo.py base_laser_link odom`
	- from source frame `base_laser_link`
	- to `odom`

### Matrix transformation examples
![[matrix_transoform_rps.png]]
- its transitive, so this is true
 ![[Pasted image 20220123200225.png]]
- inverting the matrix **inverts the transformation**
 ![[Pasted image 20220123200414.png]]

---
# References
- PSR 4th lecture 