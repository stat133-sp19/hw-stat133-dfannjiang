#######################################################################
## Title: Shot Charts
## Description: Creates shot charts of several GSW players. 
## Inputs: Requires `make-shots-data-script.R` to have been executed.
## Outputs:
#######################################################################
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

for (i in 1:length(filenames)) {
  dat = all_data[all_data$name == players[i],]
  shot_chart <- ggplot(data = dat) + 
    annotation_custom(court_image, -250, 250, -50, 420) + 
    geom_point(aes(x = x, y = y, color = shot_made_flag)) + 
    ylim(-50, 420) +
    ggtitle(paste('Shot Chart:', players[i])) + 
    theme_minimal()
  ggsave(paste0(img_path, filenames[i], '-shot-chart.pdf'), width=6.5, height=5)
}
