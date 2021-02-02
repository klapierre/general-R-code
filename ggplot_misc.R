ggplot(data=sample, aes(x=treatment, y=dependent)) +
  geom_point() +
  xlab('Treatment') + ylab(expression(paste('Aboveground Net Primary Productivity (g/',~m^2,')'))) + #superscript in axis label
  scale_x_discrete(limits=c('monodominance', '2 codominants', '3 codominants', 'even'), #ordering x-axis categories
                   labels=c('single', 'two', 'three', 'many'))
