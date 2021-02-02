library(tidyverse)
library(ggpubr)
library(grid)


a <- ggplot(data = sample, aes(x = treatment, y = dependent)) +
  geom_point() +
  xlab('Treatment') + ylab(expression(paste('Aboveground Net Primary Productivity (g/',  ~ m ^ 2, ')'))) + #superscript in axis label
  scale_x_discrete(
    limits = c('monodominance', '2 codominants', '3 codominants', 'even'),  #ordering x-axis categories
    labels = c('single', 'two', 'three', 'many')) + #changing labels of x-axis categories
  annotate('text', x = 0.6, y = 4.5, label = '(a)', size = 8) #labels for bars or panels


#arranging multiple panels - option #1 - library(ggpubr)
ggarrange(a, b, c,
          ncol = 1, nrow = 3)

#arranging multiple panels - option #2 - library(grid)
pushViewport(viewport(layout=grid.layout(3,1)))
print(a, vp=viewport(layout.pos.row=1, layout.pos.col=1))
print(b, vp=viewport(layout.pos.row=2, layout.pos.col=1))
print(c, vp=viewport(layout.pos.row=3, layout.pos.col=1))