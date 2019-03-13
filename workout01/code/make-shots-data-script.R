#######################################################################
## Title: Data Preparation
## Description: Prepares and cleans NBA shot data for some GSW players. 
## Inputs: The following files in the ../data/ directory
##          andre-iguodala.csv
##          draymond-green.csv
##          kevin-durant.csv
##          klay-thompson.csv
##          stephen-curry.csv
## Outputs: Summaries of the data in each of the csv files in the 
##          ../output/ directory, summary of the data in all of the csv 
##          files in the ../output/ directory, and a csv file of all of
##          the data in the ../data/ directory. 
#######################################################################
library(tibble)

# relative paths for the data and output folders. 
data_path <- '../data/'
output_path <- '../output/'

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

# data types for each column in the csv files
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

# Read and clean and prepare data from each csv file
for (i in 1:length(filenames)) {
  f = paste0(data_path, filenames[i], '.csv')
  dat = read.csv(f, stringsAsFactors = F, colClasses=col_types)
  
  dat$name = rep(players[i], nrow(dat))
  dat$shot_made_flag[dat$shot_made_flag == 'y'] <- 'shot_yes'
  dat$shot_made_flag[dat$shot_made_flag == 'n'] <- 'shot_no'
  dat$shot_made_flag <- as.factor(dat$shot_made_flag)
  dat$minute <- 12*(dat$period - 1) + (12 - dat$minutes_remaining)
  
  # write summary of the data from each csv file to the output folder
  sink(paste0(output_path, filenames[i], '-summary.txt'))
  print(summary(dat))
  sink()
  
  if (i == 1) {
    all_data <- dat
  } else {
    all_data <- rbind(all_data, dat)
  }
}

all_data <- as_tibble(all_data)

# write all data to a csv file in the data folder
write.csv(all_data, file=paste0(data_path, 'shots-data.csv'), row.names=FALSE)

# write summary of the data from all csv files to the output folder
sink(paste0(output_path, 'shots-data-summary.txt'))
print(summary(all_data))
sink()

# make sure to close all sinks
for (i in seq_len(sink.number())) {
  sink()
}
