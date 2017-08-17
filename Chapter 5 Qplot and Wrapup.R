###Chapter 5 Qplot and Wrapup

###Using qplot
# The old way (shown)
plot(mpg ~ wt, data = mtcars)

# Using ggplot:
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point()

# Using qplot:
qplot(wt, mpg, data = mtcars)

###Using Aesthetics
# basic scatter plot:
qplot(wt, mpg, data = mtcars)

# Categorical:
# cyl
qplot(wt, mpg, data = mtcars, size = factor(cyl))

# gear
qplot(wt, mpg, data = mtcars, size = factor(gear))

# Continuous
# hp
qplot(wt, mpg, data = mtcars, col = hp)

# qsec
qplot(wt, mpg, data = mtcars, col = qsec)

###Choosing Geoms, Part 1
# qplot() with x only
qplot(factor(cyl), data = mtcars) 

# qplot() with x and y
qplot(factor(cyl), factor(vs), data = mtcars) 

# qplot() with geom set to jitter manually
qplot(factor(cyl), factor(vs), data = mtcars, geom = "jitter") 

###Choosing Geoms, Part 2 - Dotplot
# cyl and am are factors, wt is numeric
class(mtcars$cyl)
class(mtcars$am)
class(mtcars$wt)

# "Basic" dot plot, with geom_point():
ggplot(mtcars, aes(cyl, wt, col = am)) +
  geom_point(position = position_jitter(0.2, 0))

# 1 - "True" dot plot, with geom_dotplot():
ggplot(mtcars, aes(cyl, wt, fill = am)) +
  geom_dotplot(stackdir = "center", binaxis = "y")

# 2 - qplot with geom "dotplot", binaxis = "y" and stackdir = "center"
qplot(
  cyl, wt, 
  data = mtcars, 
  fill = am, 
  geom = "dotplot", 
  binaxis = "y", 
  stackdir = "center"
)

###Chicken Weight
# ChickWeight is available in your workspace

# Check out the head of ChickWeight
head(ChickWeight)

# Use ggplot() for the second instruction
ggplot(ChickWeight, aes(x = Time, y = weight)) + 
  geom_line(aes(group = Chick))

# Use ggplot() for the third instruction
ggplot(ChickWeight, aes(x = Time, y = weight, col = Diet)) + 
  geom_line(aes(group = Chick))

# Use ggplot() for the last instruction
ggplot(ChickWeight, aes(x = Time, y = weight, col = Diet)) + 
  geom_line(aes(group = Chick), alpha = 0.3) + 
  geom_smooth(lwd = 2, se = FALSE)

###Titanic
# titanic is avaliable in Data Camp's workspace
# 1 - Check the structure of titanic
str(titanic)

# 2 - Use ggplot() for the first instruction
ggplot(titanic, aes(x = Pclass, fill = Sex)) + 
  geom_bar(position = "dodge")

# 3 - Plot 2, add facet_grid() layer
ggplot(titanic, aes(x = Pclass, fill = Sex)) + 
  geom_bar(position = "dodge") + 
  facet_grid(. ~ Survived)

# 4 - Define an object for position jitterdodge, to use below
posn.jd <- position_jitterdodge(0.5, 0, 0.6)

# 5 - Plot 3, but use the position object from instruction 4
ggplot(titanic, aes(x = Pclass, y = Age, color = Sex)) + 
  geom_point(size = 3, alpha = 0.5, position = posn.jd) + 
  facet_grid(. ~ Survived)