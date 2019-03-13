### Description of Variables

* `team_name`: The name of the player's NBA team.
* `game_data`: The date of the NBA game. 
* `season`: The NBA season.
* `period`: The period (1-4) of the NBA game. Period `i` refers to the `i`-th 12-minute period of the game.
* `minutes_remaining`: Minutes remaining to be played in a particular period.
* `seconds_remaining`: Seconds remaining to be played in a particular period.
* `shot_made_flag`: Indicator of whether the shot was made or missed.
* `action_type`: The action taken to attempt the shot.
* `shot_type`: The type of shot attempted (2 or 3 points).
* `shot_distance`: Distance between where the shot was attempted and the basket (in feet).
* `opponent`: Name of the opposing NBA team.
* `x`: x-coordinate of the court (in inches) where the shot was attempted.
* `y`: y-coordinate of the court (in inches) where the shot was attempted.

### Notes

* The data is only for the 2016 season, so `season` should always be 2016.
* `shot_made_flag` is either `'y'` for yes or `'n'` for no.
* `shot_type` is either `'3PT Field Goal'` or `'2PT Field Goal'`.