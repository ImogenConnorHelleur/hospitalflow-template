#create import list for hospital with one site
#please edit as appropriate
trustName_import_list <- list(list(data_path = "data-raw/trustName_ed_data.csv", #edit trust name
                                   config_path = "trustName-config/ed/", #edit trust name
                                   site = "Site 1", #edit site name
                                   facility = "ED", 
                                   time_zone = "Europe/London"), #edit time zone 
                              list(data_path = "data-raw/trustName_inpatient_data.csv", #edit trust name
                                   config_path = "trustName-config/inpatient/", #edit trust name
                                   site = "Site 1", 
                                   facility = "IP", #edit site name
                                   time_zone = "Europe/London") #edit time zone
                              )

saveRDS(trustName_import_list, "trustName-config/trustName_import_list.RDS") #edit trust name

# #example of how the import_list should look for a hospital with two sites 
# trustName_import_list <- list(list(data_path = "data-raw/trustName_ed_data.csv", 
#                                    config_path = "trustName-config/ed/", 
#                                    site = "Site 1", 
#                                    facility = "ED", 
#                                    time_zone = "Europe/London"), 
#                               list(data_path = "data-raw/trustName_inpatient_data.csv", 
#                                    config_path = "trustName-config/inpatient/", 
#                                    site = "Site 1", 
#                                    facility = "IP", 
#                                    time_zone = "Europe/London"),
#                               list(data_path = "data-raw/trustName_ed_data.csv",
#                                    config_path = "trustName-config/ed/",
#                                    site = "Site 2",
#                                    facility = "ED",
#                                    time_zone = "Europe/London"),
#                               list(data_path = "data-raw/trustName_inpatient_data.csv",
#                                    config_path = "trustName-config/inpatient/",
#                                    site = "Site 2",
#                                    facility = "IP",
#                                    time_zone = "Europe/London")
#                               )