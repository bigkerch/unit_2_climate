# Levi McKercher
# Unit 2 Lesson 1
# Ice Mass Lost
# MSCI 758
# 01-27-2022

ant_ice_loss = read.table(file = "data/antarctica_mass_200204_202111.txt",
                          skip=31, sep="", header=FALSE, col.names = c("decimal_date"
                                                                       , "mass_Gt", "sigma_Gt"))

head(ant_ice_loss)

grn_ice_loss = read.table(file = "data/greenland_mass_200204_202111.txt",
                          skip=31, sep="", header=FALSE, col.names = c("decimal_date"
                                                                       , "mass_Gt", "sigma_Gt"))

head(grn_ice_loss)
dim(grn_ice_loss)
summary(grn_ice_loss)

# Visualizing the data
plot(mass_Gt~decimal_date, data = ant_ice_loss)

# Can press zoom above figure to expand and visualize
plot(mass_Gt~decimal_date, data = grn_ice_loss, ylab= "Greenland Mass Loss (Gt)", xlab= "Date")

# How to plot two series of data on the same figure
plot(mass_Gt~decimal_date, data = grn_ice_loss, ylab= "Greenland Mass Loss (Gt)", xlab= "Date", type = "l")
lines(mass_Gt~decimal_date, data = ant_ice_loss, col = 'Red')

# How to find minimum, maximum, and range of data
min(grn_ice_loss$mass_Gt)
max(grn_ice_loss$mass_Gt)
min(ant_ice_loss$mass_Gt)
max(ant_ice_loss$mass_Gt)
range(grn_ice_loss$mass_Gt)
range(ant_ice_loss$mass_Gt)

# How to deal with missing data in plots when R fills it in
data_break = data.frame(decimal_date=2018, mass_Gt= NA, sigma_Gt= NA)
data_break
ant_ice_loss_with_NA = rbind(ant_ice_loss, data_break)
ant_ice_loss_with_NA
head(ant_ice_loss_with_NA)
tail(ant_ice_loss_with_NA)

order(ant_ice_loss_with_NA$decimal_date)
ant_ice_loss_with_NA = ant_ice_loss_with_NA[order(ant_ice_loss_with_NA$decimal_date), ]

plot(mass_Gt~decimal_date, data=ant_ice_loss_with_NA, type = "l")

data_break = data.frame(decimal_date=2018, mass_Gt= NA, sigma_Gt= NA)
data_break
grn_ice_loss_with_NA = rbind(grn_ice_loss, data_break)
grn_ice_loss_with_NA
head(grn_ice_loss_with_NA)
tail(grn_ice_loss_with_NA)

order(grn_ice_loss_with_NA$decimal_date)
grn_ice_loss_with_NA = grn_ice_loss_with_NA[order(grn_ice_loss_with_NA$decimal_date), ]

plot(mass_Gt~decimal_date, data = grn_ice_loss_with_NA, type = "l")

#Combining both Ant and Grn plots together
plot(mass_Gt~decimal_date, data = ant_ice_loss_with_NA, ylab = "Mass Ice Lost (Gt)",
     xlab = "Year", type = 'l', ylim = range(grn_ice_loss_with_NA$mass_Gt, na.rm = TRUE))
lines(mass_Gt~decimal_date, data = grn_ice_loss_with_NA, type = 'l', col = 'red')

