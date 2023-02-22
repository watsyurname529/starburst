#Script to read and plot the starburst data

#Load ggplot2
library(ggplot2)

#Read in starburst csv file
starburst <- read.csv("starburst.csv", header=TRUE)

#Set up starburst colors, both in colors corresponding to the original
#flavors and a colorblind friendly palette
sb_colors <- c("#ff6600", "#ff6699", "#cc0000", "#ffff00")
sb_colors_cb <- c("#a6cee3", "#1f78b4", "#b2df8a", "#33a02c")

#Plot the data
#First, make a stacked bar chart
sb_stack_bar <- ggplot(data = starburst, aes(x = Ranking, y = Votes, fill = Flavor)) + geom_bar(stat="identity")

sb_stack_bar <- sb_stack_bar + labs(title = "Original Starburst Flavor Popularity", y = "Num. of Votes", x = "Ranking (1 is best, 4 is worst)")

sb_stack_bar <- sb_stack_bar + scale_fill_manual(values=sb_colors)

#Adjust placement of plot and axis titles
sb_stack_bar <- sb_stack_bar + theme(plot.title = element_text(vjust=2))
sb_stack_bar <- sb_stack_bar + theme(axis.title.x = element_text(vjust=-0.35))
sb_stack_bar <- sb_stack_bar + theme(axis.title.y = element_text(vjust=0.45))

sb_stack_bar <- sb_stack_bar + geom_text(aes(label = Votes), position=position_stack(vjust=0.5), size=3)
#sb_stack_bar <- sb_stack_bar + geom_text(aes(label = Votes, ymax=0), vjust=2.5, size=3)

ggsave("sb_stack_bar.png", width = 5, height = 5)
#ggsave("sb_stack_bar.pdf", width = 5, height = 5)

sb_stack_bar_cb <- sb_stack_bar + scale_fill_manual(values=sb_colors_cb)

ggsave("sb_stack_bar_cb.png", width = 5, height = 5)
#ggsave("sb_stack_bar_cb.pdf", width = 5, height = 5)

#Next, make a side by side bar chart
sb_side_bar <- ggplot(data = starburst, aes(x = Ranking, y = Votes, fill = Flavor)) + geom_bar(stat="identity", position="dodge")

sb_side_bar <- sb_side_bar + labs(title = "Original Starburst Flavor Popularity", y = "Num. of Votes", x = "Ranking (1 is best, 4 is worst)")

sb_side_bar <- sb_side_bar + scale_fill_manual(values=sb_colors)

#Adjust placement of plot and axis titles
sb_side_bar <- sb_side_bar + theme(plot.title = element_text(vjust=2))
sb_side_bar <- sb_side_bar + theme(axis.title.x = element_text(vjust=-0.35))
sb_side_bar <- sb_side_bar + theme(axis.title.y = element_text(vjust=0.45))

sb_side_bar <- sb_side_bar + geom_text(aes(label = Votes, ymax=0), position=position_dodge(width = 0.9), vjust=-0.5, size=3)

ggsave("sb_side_bar.png", width = 5, height = 5)
#ggsave("sb_side_bar.pdf", width = 5, height = 5)

sb_side_bar_cb <- sb_side_bar + scale_fill_manual(values=sb_colors_cb)

ggsave("sb_side_bar_cb.png", width = 5, height = 5)
#ggsave("sb_side_bar_cb.pdf", width = 5, height = 5)
