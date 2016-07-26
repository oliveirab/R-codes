#### Brunno Oliveira, 2014 (brunno.oliveira@me.com)
#### Universidade Federal do Rio Grande do Norte - Brasil
#### Functions to remove outliers

# x: data
# na.rm: logical
# na.q: 1 or 2; 1= fix values to first and second quartiles to outilers, 2 = remove outliers
# probs.u: upper and lower quatil values to consider as outliers

reout <- function(x, na.rm = TRUE, na.q = NA, probs.u = c(.25, .75),...) {
  qnt <- quantile(x, probs=probs.u, na.rm = na.rm, ...)
  H <- 1.5 * IQR(x, na.rm = na.rm)
  y <- x
  if (na.q == 1) {
    y[x < (qnt[1] - H)] <- qnt[1] - H
    y[x > (qnt[2] + H)] <- qnt[2] + H
    return(y)  #Fix values of first and second quartiles to outliers
  }
  if (na.q == 2) {
    y[x < (qnt[1] - H)] <- NA
    y[x > (qnt[2] + H)] <- NA
    return(y) 
  } #Put NA in outliers
  if (is.na(na.q)) {
    return('reout were not computed because you should choose between the methods 1 or 2 /n
           Method 1 Fix values of first and second quartiles to outliers /n
           Method 2 Put NA in outliers')
  }
} 
