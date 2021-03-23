# hospitalflow-template Read Me
This is a template repository to aid users in the setup of the ```hospitalflow``` package to run the analyses on their own data. 

The ```hospitalflow``` package provides tools for the standardisation and analysis of hospital data.  It has been designed so that data can be extracted from a hospital server and used with this package with minimal cleaning.  The package contains two example datasets (```ed_data``` and ```inpatient_data```) which can be used to produce an example report.

N.B. The word “trust” is used to describe a group of hospitals that are managed together. This is typically an NHS term which may or may not be applicable outside of the UK.  If not, think of a trust as a hospital that has more than one site.

### Configuration Instructions
#### *R version and packages*

You should have at least version 4.0.3 of R and version 1.3.1093 of R studio installed on your computer and the packages listed in the DESCRIPTION file. (N.B. you may install the ```hospitalflow``` package first and R studio will prompt you to install the necessary packages)

#### *Raw data*

Your raw ED and Inpatient data should be stored in a CSV format and saved in the raw-data folder which already contains simulated example data of each.  The naming convention is “trustName_ed_data.csv” and “trustName_inpatient_data.csv”, where “trustName” is replaced by the name of the trust you are analysing. This may be an abbreviation such as chelWest for Chelsea and Westminster NHS Trust, but be sure to keep this abbreviation consistent throughout the setup. 

You should check that your data contains the necessary columns required for the analyses.  This can be done by running ```??hospitalflow::ed_data``` and ```??hospitalflow::inpatient_data```, after installing the hospitalflow package (see next section), which will show you a help file containing a list and description of the columns in the example datasets.  The columns marked CORE will are necessary for the core analyses, without which the package will not run.  Those marked OPTIONAL are additional columns which you may have and will allow for further analyses to be completed.

#### *Config files*

The repo contains a folder called example-config which contains the config files that correspond to the example data in the raw-data folder.  There is also a config folder named “trustName-config”. You will edit this to match your own data by doing the following:

  1.	Rename the folder with the actual name of the trust that you will be analysing with the suffix “-config”.

  2.	Each config file inside the ed and inpatient folders are currently saved as CSV files so that you can edit them outside of R for convenience. Open each file individually and fill out the “provided” column with the data levels from the raw data that you have saved in the raw-data folder for each column of raw data. E.g. you will edit the “gender_levels.csv” file according to how gender is specified in your data.  It is important that each character is correct including spaces and capitals.

  3.	The column_mapping file should map the column names from your raw data to the standard column names. If you are missing any of the standard columns in your raw data, leave these blank (?).

  4.	The datetime_formats file should specify the datetime format of the date columns in your raw data according to the R standard.  

  5.	Once you have filled in all of the config files in both the ed and inpatient folders you will need to run some code to convert them into RDS files.  Open the “convert_config_to_rds.R” file and run the script.  Your config files should now be set up. 

  6.	Repeat this for each trust that you will be analysing.  (I.e. you need separate config folders and files for each trust.  You don not need separate configs for sites within the same trust).

#### *Import List*

The import list contains information about the data you will be importing and its properties.  An example of this is the example_import_list inside the example-config folder.  You will need to make an import list for you data and can do so by editing the “make_import_list.R” file.  

  1.	Edit the name of the import list which is currently set to “trustName_import_list”. This should be set with the name of the trust that you are analysing followed by “_import_list”.
  
  2.	You will then need to edit each element of the list to match the raw data that you have.  
    a.	The ```data_path``` argument should point to your raw data ED and Inpatient files.  
    b.	The ```config_path``` argument should point to the ED and inpatient folders within the config folder that you made.  
    c.	If you have data for multiple sites within your trust you will need to copy and paste the inner list chunks for each site and specify the site name in the site argument. This can be seen as a commented example in the “make_import_list.R” file.  
    d.	 The ```facility``` argument should not need to be edited.  There should be one for “ED” and one for “IP” for each site.  
    e.	The ```time_zone``` argument should be edited to the timezone that your raw data is in (e.g. “Asia/Singapore”)  
    f.	You will then also need to edit the trust name in the ```saveRDS()``` function call.
    
  3.	Run this script to save your import list into your config folder.
  
### Installation Instructions
To install the hospitalflow package you must have ```devtools``` installed already (which can be done by running ```install.packages("devtools")```).  You should then run the following code which can also be found in the “installation_command.R” file: ```devtools::install_github("HorridTom/hospitalflow", ref = "update-vignette", auth_token = "", build = F)```

The ```auth_token``` will be sent to you separately and you will need to fill this in.

If you are missing packages that ```hospitalflow``` requires you may be prompted to install them.

### Operating Instructions
In order to produce the example report for you data you will need to run the ```render_example_report()``` function from ```hospitalflow```.  You will need to change the arguments to the parameters that you want to use to produce your report.  An example of how to call the function is saved in the R file “render_example_report.R” in the repo.  

The import_list_path argument should point to the import list that you made for your data e.g. “../trustName-config/trustName_import_list.rds”.  The output_dir should point to a directory where you would like your output report to be saved e.g. “reports”.  

### A file manifest (list of files included in the repo)
#### R files with editable and runnable code to aid setup:
*example_hospital_ed_data.csv, example_hospital_inpatient_data.csv*

#### Files contained in example-config folder:
*example_import_list.rds*

#### Files contained in example-config/ed folder:
*attendance_category_levels.rds, column_mapping.rds, datetime_formats.rds, gender_levels.rds, referral_source_levels.rds, traiage_catagory_levels.rds*

#### Files contained in example-config/inpatient folder:
*column_mapping.rds, datetime_formats.rs, discharge_destination_levels.rds, gender_levels.rds, source_of_admission_levels.rds*

#### Files contained in trustName-config/ed folder:
*age_band_start_levels.csv, arrival_mode_levels.csv, attendance_category_levels.csv, attendance_disposal_levels.csv, column_mapping.csv, datetime_format.csv, ethnic_category_levels.csv, gender_levels.csv, referral_source_levels.csv, triage_category.csv*

#### Files contained in trustName-config/inpatient folder:
*admission_method_levels.csv, age_band_start_levels.csv, column_mapping.csv, datetime_formats.csv, discharge_destination_levels.csv, discharge_method_levels.csv, ethnic_category_levels.csv, gender_levels.csv, main_speciality_levels.csv, patient_classification_levels.csv, source_of_admission_levels.csv*

#### File contained in vignettes folder:
*example-report.Rmd*

### Copyright and licensing information
### Contact information for the distributor or programmer
### Known bugs
### Troubleshooting
### Credits and acknowledgments
