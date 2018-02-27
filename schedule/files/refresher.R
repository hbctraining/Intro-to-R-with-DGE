Animals <- read.csv("data/animals.csv")

# Question 1

rownames(Animals)

Animals[1, 1]
Animals$speed[1]

Animals[c(1, 4), ]

# Question 2

## Using logical expressions
idx <- Animals$color == "Tan"
idx <- Animals[, "color"] == "Tan"
idx

## Using logical expressions with which()
idx <- which(Animals$color == "Tan")
idx

Animals[idx, ]
Animals[Animals$color == "Tan", ]

## Using the subset() function

subset(Animals, color == "Tan")

# Question 3

idx <- Animals$speed > 50
idx

Animals[idx, "color", drop=F]

subset(Animals, speed > 50, select = color)

# Question 4

idx <- Animals$color == "Grey"
any(idx)
all(idx)

Animals[idx, 2] <- "Gray"
