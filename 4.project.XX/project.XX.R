rm(list = ls())

#------------------------------------
#read the batch file and load all the libraries
library(EMLassemblyline)
library(XML)
library(readxl)
library(dplyr)
library(here)
library(googledrive)

## authorize access to googledrive
drive_find(n_max = 10)

############################################################
## User edit zone

# change the following number based on each of the datasets
dataset_id <- 101

folder_path<- here::here(paste0("4.project.", dataset_id,"/"))

#end user edit zone###########
############################################################

#loading all the functions
source(paste0(getwd(), '/5.eml_generation/download_metadata.R'))
source(paste0(getwd(), '/5.eml_generation/get_meta_xlsx.R'))
source(paste0(getwd(), '/5.eml_generation/generate_EML_Assemblyline.R'))


#read the metadata content out of xlsx
metadata <- get_meta_xlsx(
  folder_path = folder_path,
  dataset_id = dataset_id) 

#fill the EML content into the template
eml_in_template <- generate_EML_Assemblyline(
  project_path = folder_path,
  excel_input = metadata,
  dataset_id_input = dataset_id)

# Export EML --------------------------------------------------------------------
do.call(make_eml, eml_in_template[names(eml_in_template) %in% names(formals(make_eml))])

