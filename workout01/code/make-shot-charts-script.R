#####################################################################################
## Title: Shot Charts
## Description: Creates shot charts of several GSW players. 
## Inputs: Requires 'make-shots-data-script.R' to have been executed.
##          Also requires '../images/nba-court.jpg', which should be 
##          an image of half of an nba court. This image can be 
##          downloaded from the root url:
##          https://raw.githubusercontent.com/ucb-stat133/stat133-hws/master/images/
## Outputs: Shot charts of each of several GSW players as well as a faceted shot
##          chart containing the shot charts of all the players in the folder 
##          '../images/'
#####################################################################################
library(jpeg)
library(grid)
library(ggplot2)

# relative path for the images folder
img_path <- '../images/'

# court image (to be used as background of plot)
court_file <- paste0(img_path, 'nba-court.jpg')

# create raste object
court_image <- rasterGrob(readJPEG(court_file), width = unit(1, "npc"), height = unit(1, "npc"))

# csv file names
filenames <- c(
  'andre-iguodala',
  'draymond-green',
  'kevin-durant',
  'klay-thompson',
  'stephen-curry'
)

# names of the players in proper format
players <- c(
  'Andre Iguodala',
  'Draymond Green',
  'Kevin Durant',
  'Klay Thompson',
  'Stephen Curry'
)

# creating shot charts for each player and saving the plots as pdfs
for (i in 1:length(filenames)) {
  dat = all_data[all_data$name == players[i],]
  shot_chart <- ggplot(data = dat) + 
    annotation_custom(court_image, -250, 250, -50, 420) + 
    geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
    ylim(-50, 420) +
    ggtitle(paste('Shot Chart:', players[i], '(2016 Season)')) + 
    theme_minimal()
  ggsave(paste0(img_path, filenames[i], '-shot-chart.pdf'), width=6.5, height=5)
}

# creating a facted shot chart to put all shot charts in one pdf
shot_chart <- ggplot(data = all_data) + 
  annotation_custom(court_image, -250, 250, -50, 420) + 
  geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
  ylim(-50, 420) +
  ggtitle('Shot Charts: GSW (2016 Season)') + 
  facet_wrap(~name) +
  theme_minimal()
ggsave(paste0(img_path, 'gsw-shot-charts.pdf'), width=8, height=7)
ggsave(paste0(img_path, 'gsw-shot-charts.png'), width=8, height=7)