####Seminar 10####

library(decisionSupport)

#The arguments for the vv function include:
  
#var_mean, which is the mean of the variable to be varied
#var_CV, which is the desired coefficient of variation (in percent)
#n, which is the integer; number of values to produce
#distribution, which is the probability distribution for the introducing variation. This is currently only implemented for normal distributions
#absolute_trend, which is the absolute increment in the var_mean in each time step. Defaults to NA, which means no such absolute value trend is present. If both absolute and relative trends are specified, only original means are used
#relative_trend, which is the relative trend in the var_mean in each time step (in percent). Defaults to NA, which means no such relative value trend is present. If both absolute and relative trends are specified, only original means are used
#lower_limit, which is the lowest possible value for elements of the resulting vector
#upper_limit, which is the upper possible value for elements of the resulting vector

# reduce var_CV to 5 and change n to 40. Name the output 'valvar' and plot with base R  
valvar <- vv(var_mean = 100, 
             var_CV = 5, 
             n = 40)

plot(valvar)

###Use the "absolute_trend" argument and plot it with the base R "plot" function###

# reduce var_mean to 50 and make absolute_trend 10. Name the output 'valvar' and plot with base R 
valvar <- vv(var_mean = 50, 
             var_CV = 10, 
             n = 30, 
             absolute_trend = 10)

plot(valvar)

###Use the "relative_trend" argument and plot it with the base R "plot" function###

# reduce var_CV to 5 and change n to 40. Name the output 'valvar' and plot with base R 
valvar <- vv(var_mean = 100, 
             var_CV = 5, 
             n = 40, 
             relative_trend = 5)

plot(valvar)

####Simulate occurence of random events####

#The arguments for the chance_event function include:

#chance, which is the probability that the risky event will occur (between 0 and 1)
#value_if, which is the output value in case the event occurs. This can be either a single numeric value or a numeric vector. Defaults to 1.
#value_if_not, which is the output value in case the event does not occur. This can be either a single numeric value or a numeric vector. 
#If it is a vector, it must have the same length as value_if
#n, which is the number of times the risky event is simulated. This is ignored if length(value_if)>1.
#CV_if, which is the coefficient of variation for introducing randomness into the value_if data set. This defaults to 0 for no artificial variation. 
#See documentation for the vv function for details. CV_if_not, which is the coefficient of variation for introducing randomness into the value_if_not data set. 
#This defaults to the value for CV_if. See documentation for the vv function for details.
#one_draw, which is the boolean coefficient indicating if event occurrence is determined only once (TRUE) with results applying to all elements of the results vector, 
#or if event occurrence is determined independently for each element (FALSE is the default).
  
###The "chance_event" function provides a vector of lenght "n" and assigns "value_if" if the event occurs and "value_if_not" if the evend doesn`t occur###

# decrease the chance and value_if by half and repeat 20 times. Name the output 'chancevar' and plot with base R 
chancevar <- chance_event(chance = 0.25, 
                          value_if = 3, 
                          n = 20)

plot(chancevar)

###Use the "value_if_not" argument and "CV_if" arguments###

# make the chance 10 percent, the value_if 5 and the value_if_not 20, repeat 100 times and reduce the coefficient of variation by half. Name the output 'chancevar' and plot with base R.
chancevar <- chance_event(chance = 0.1,
                          value_if = 5,
                          value_if_not = 20,
                          n = 100,
                          CV_if = 10)

plot(chancevar)

####Gompertz function####

#The arguments for the gompertz_yield function include:
  
#max_harvest, which is the maximum harvest from the tree (in number of fruits, kg or other units)
#time_to_first_yield_estimate, which is the year (or other time unit) number, for which the first yield estimate is provided by first_yield_estimate_percent
#time_to_second_yield_estimate, which is the year (or other time unit) number, for which the second yield estimate is provided by second_yield_estimate_percent
#first_yield_estimate_percent percentage of the maximum yield that is attained in the year (or other time unit) given by time_to_first_yield_estimate
#second_yield_estimate_percent percentage of the maximum yield that is attained in the year (or other time unit) given by time_to_second_yield_estimate
#n_years, which is the number of years to run the simulation
#var_CV, which is the coefficient indicating how much variation should be introduced into the time series. If this is one numeric value, 
#then this value is used for all variables. The default is 0, for a time series with no artificially introduced variation. 
#See description of the vv function for more details on this.
#no_yield_before_first_estimate, which is the boolean variable indicating whether yields before the time unit indicated by time_to_first_yield_estimateshould be 0.

###The function provides a vector of n_years numeric values, describing the simulated yield of the perennial. This starts at 0 and, if the simulation runs for a sufficient number of years, approaches max_harvest. If var_CV>0, this time series includes artificial variation.###

# create a vector where the maximum harvest is 500, which is achieved in 10 years (i.e. 100% by the second yield estimate)
gompertz_yield(max_harvest = 500,
               time_to_first_yield_estimate = 5,
               first_yield_estimate_percent = 10,
               time_to_second_yield_estimate = 10,
               second_yield_estimate_percent = 100,
               n_years = 30)