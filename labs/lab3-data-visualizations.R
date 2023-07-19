library(ggplot2)

# import data
getwd()
esol <- read.csv("data/delaney-processed.csv")

# distribution of Molecular Weight
ggplot(esol, aes(Molecular.Weight)) + 
  geom_histogram() + 
  labs(title="Histogram of Molecular Weight", 
       x="molecular weight", 
       y="number of molecules")
ggsave("plots/molecWeight-histogram.png")


# Molecular Weight (numeric) by Number of Rings (categorical)
ggplot(esol, aes(Number.of.Rings, Molecular.Weight)) +
  geom_jitter() + 
  labs(title="Number of Rings vs Molecular Weight", 
       x="number of rings", 
       y="molecular weight")
ggsave("plots/molecWeight-numRings-jitter.png")

ggplot(esol, aes(as.factor(Number.of.Rings), Molecular.Weight)) +
  geom_boxplot() + geom_violin() +
  labs(title="Number of Rings vs Molecular Weight", 
       x="number of rings", 
       y="molecular weight")
ggsave("plots/molecWeight-numRings-boxViolin.png")


# Molecular Weight (numeric) by Polar Surface Area (numeric)
ggplot(esol, aes(Polar.Surface.Area, Molecular.Weight, color=Number.of.Rings)) +
  geom_point() + 
  labs(title="Polar Surface Area vs Molecular Weight", 
       x="polar surface area", 
       y="molecular weight")
ggsave("plots/molecWeight-polarSurfaceArea-scatter.png")
