# Question 5.1.a

# The is generated from a normal variable z. 3 linear combinations of z are used to generate 3 different sets of y and x. Later on, the data from these 3 sets is merged into a single data-table along with the set number represented as group. The data for y represents the SAT score, which have been bounded between 200 and 1600, and been rounded to the nearest multiple of 10.

# Question 5.1.b

# The pooled model shows the intercept and slope for a model between all 3 groups, and basically does not discriminate on the basis of the group where the data comes from. This is the overall effect so to speak.
# As for the remaining 4 models, the signs and magnitudes are close to each other. The within group model allows for different intercepts for each of the 3 groups and we notice a negative relationship with income as compared to a positive one in the pooled model. This is a classic example of the Simpson's paradox. As for the remaining 3 models for individual groups, I don't expect too much of a difference from the within-groups model. This speaks about the behavior within a given group with disregard for what's happening in other groups.

# Question 5.1.c

# In the first plot with SAT~Income, it actually looks like the SAT is going down slightly as the income increases, although the pooled OLS model says otherwise. I can only assume that what I can see as a human being and the mathametical answer are two different things.
# The group tree does not reveal anything significant, however the tree with both variables shows exactly what the model summary has shown. For each of the groups, the SAT is highest in the node with the lowest salary. Then, as we start to move right and salary increases, the SAT score tends to go down.

str(dtable)
ictree <- ctree(sat~income, data=dtable)
gptree <- ctree(sat~group, data=dtable)
bthtree <- ctree(sat~group + income, data=dtable)

plot(ictree)
plot(gptree)
plot(bthtree)

# Having to print this because I cannot read the image here.
png("bth.png", res=80, height=1500, width=4000) 
plot(bthtree)
dev.off()

# Question 5.1.d

# Out of the 3 models I ran: sat~income+group,sat~income|group and sat~group|income, sat~income|group has the highest negative log-likelihood of 7968.911.

library(partykit)
glmtree(sat~income|group, data=dtable)

