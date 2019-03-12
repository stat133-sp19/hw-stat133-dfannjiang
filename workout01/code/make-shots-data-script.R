##################################################
## Title: GSW Shot Charts
## Description: Analyzes the shot patterns of GSW players. 
## Inputs:
## Outputs:
##################################################
library(tibble)

filenames <- c(
  'andre-iguodala',
  'draymond-green',
  'kevin-durant',
  'klay-thompson',
  'stephen-curry'
)
players <- c(
  'Andre Iguodala',
  'Draymond Green',
  'Kevin Durant',
  'Klay Thompson',
  'Stephen Curry'
)
data_path <- '../data/'
output_path <- '../output/'
col_types <- c(
  'factor', # team_name
  'character', # game_date
  'integer', # season 
  'integer', # period
  'integer', # minutes_remaining
  'integer', # seconds_remaining
  'character', # shot_made_flag
  'factor', # action_type
  'factor', # shot_type
  'integer', # shot_distance
  'factor', # opponent
  'real', # x
  'real' # y
)

for (i in 1:length(filenames)) {
  p = filenames[i]
  f = paste0(data_path, p, '.csv')
  dat = read.csv(f, stringsAsFactors = F, colClasses=col_types)
  
  dat$name = rep(players[i], nrow(dat))
  dat$shot_made_flag[dat$shot_made_flag == 'y'] <- 'shot_yes'
  dat$shot_made_flag[dat$shot_made_flag == 'n'] <- 'shot_no'
  dat$shot_made_flag <- as.factor(dat$shot_made_flag)
  dat$minute <- 12*(dat$period - 1) + (12 - dat$minutes_remaining)
  
  sink(file=paste0(output_path, p, '-summary.txt'))
  print(summary(dat))
  sink()
  
  if (i == 1) {
    all_data <- dat
  } else {
    all_data <- rbind(all_data, dat)
  }
}

all_data <- tibble(all_data)
write.csv(all_data, file=paste0(data_path, 'shots-data.csv'), row.names=FALSE)
sink(file=paste0(output_path, 'shots-data-summary.txt'))
summary(all_data)
sink()
