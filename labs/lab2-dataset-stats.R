# import data
getwd()
esol_data <- read.csv("data/delaney-processed.csv")

# view data
View(esol_data)
str(esol_data)

# - notice that the continuous numeric variables are stored as num
# - the categorical variables are stored as int
# - the unique IDs are stored as chr

# mean, med, range of Molecular.Weight
mw_mean <- mean(esol_data$Molecular.Weight)
mw_med <- median(esol_data$Molecular.Weight)
mw_range <- max(esol_data$Molecular.Weight) - min(esol_data$Molecular.Weight)

# var, sd, IQR of Molecular.Weight
mw_var <- var(esol_data$Molecular.Weight)
mw_sd <- sqrt(var(esol_data$Molecular.Weight))
mw_IQR <- quantile(esol_data$Molecular.Weight, 0.75) - quantile(esol_data$Molecular.Weight, 0.25)

# outliers
lower <-  mw_mean - 3 * mw_sd # lower threshold
upper <-  mw_mean + 3 * mw_sd # upper threshold

mw <- esol_data$Molecular.Weight
mw_outliers <- mw[mw > upper | mw < lower]
mw_no_outliers <- mw[mw < upper & mw > lower]

# new mean and median without outliers
mean(mw_no_outliers) # 201.989
median(mw_no_outliers) # 182.172

# the mean changed more due to presence of outliers
