#Script to read and plot the starburst data

#Load ggplot2
library(ggplot2)

#Read in starburst csv file
starburst <- read.csv("starburst.csv", header=TRUE)

#Set up starburst colors
sb_colors <- c("#ff6600", "#ff6699", "#cc0000", "#ffff00")

#Plot the data
#First, make a stacked bar chart
sb_stack_bar <- ggplot(data = starburst, aes(x = Ranking, y = Votes, fill = Flavor)) + geom_bar(stat="identity")

sb_stack_bar <- sb_stack_bar + labs(title = "Orginial Starburst Flavor Popularity", y = "Num. of Votes", x = "Ranking (1 is best, 4 is worst)")

sb_stack_bar <- sb_stack_bar + scale_fill_manual(values=sb_colors)

sb_stack_bar <- sb_stack_bar + theme(plot.title = element_text(vjust=2))
sb_stack_bar <- sb_stack_bar + theme(axis.title.x = element_text(vjust=-0.35))
sb_stack_bar <- sb_stack_bar + theme(axis.title.y = element_text(vjust=0.35))

ggsave("sb_stack_bar.png", width = 5, height = 5)
ggsave("sb_stack_bar.pdf", width = 5, height = 5)

#Next, make a side by side bar chart
sb_side_bar <- ggplot(data = starburst, aes(x = Ranking, y = Votes, fill = Flavor)) + geom_bar(stat="identity", position="dodge")

sb_side_bar <- sb_side_bar + labs(title = "Orginial Starburst Flavor Popularity", y = "Num. of Votes", x = "Ranking (1 is best, 4 is worst)")

sb_side_bar <- sb_side_bar + scale_fill_manual(values=sb_colors)

sb_side_bar <- sb_side_bar + theme(plot.title = element_text(vjust=2))
sb_side_bar <- sb_side_bar + theme(axis.title.x = element_text(vjust=-0.35))
sb_side_bar <- sb_side_bar + theme(axis.title.y = element_text(vjust=0.35))

ggsave("sb_side_bar.png", width = 5, height = 5)
ggsave("sb_side_bar.pdf", width = 5, height = 5)
