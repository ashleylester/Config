install.packages("ISLR")
library(ISLR)

# Lag 1 through 5 is the percentage return in the last 5 days. Volume is
# the number of shares traded on the previous day. Today is the percentage
# return of today. Direction is the categorical variable indicating whether
# the market went up or down today.

head(Smarket)
str(Smarket)

# The cor function works with numeric data only, so we remove column 9
# from the function for it to work. Observe there is little correlation
# on Lag1 to Lag5. There is some correlation on Volume.

cor(Smarket[,-9])
plot(Smarket$Volume)

# We run the generalised linear model with the family = binomial arg
# to indicate that we are working with logistic regression.

glm.fit <- glm(Direction~Lag1+Lag2+Lag3+Lag4+Lag5+Volume,
              data = Smarket, family = binomial)

summary(glm.fit)

# For the prediction of Direction to be useful, we need to convert
# probabilities into categories: up and down.

glm.probs = predict(glm.fit, type = "response")
head(glm.probs)

glm.pred <- ifelse(glm.probs > 0.5, "Up", "Down")
table(glm.pred, Smarket$Direction)
mean(glm.pred == Smarket$Direction)

# The training data and the test data are the same in this model; the
# test error rate of 48% is therefore inaccurate (and probably an
# underestimate).

install.packages("MASS")
library(MASS)

train <- Smarket$Year < 2005
lda.fit <- lda(Direction ~ Lag1 + Lag2, data = Smarket, subset = train)
lda.fit
lda.probs <- predict(lda.fit, Smarket[!train,])
lda.class <- lda.probs$class
table(lda.class, Smarket$Direction[!train])
mean(lda.class==Smarket$Direction[!train])
