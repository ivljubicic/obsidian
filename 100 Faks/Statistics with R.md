202112141631
Tags: [[SAP]] [[R]] 

# Statistics with R
## Viewing a data set
- listing columns
	- `names(fifa19)`
- viewing the data
	- `View(fifa19)`

## Altering a data set
### Removing columns that we don't need
`fifa19=select(fifa19, -c("player_url","long_name","real_face","player_tags","loaned_from","player_traits"))`
- removing columns with `-c(columns)`

## Vrste testova
- 


---
# References