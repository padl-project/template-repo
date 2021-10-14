#### Scripts that downloads the metadata spreadsheet to the project's folder

##Url where the metadata sheet lives
metadata_folder_url <- " "

## Identifying the file
metadata_file <- drive_ls(as_id(metadata_folder_url))

## Download all file to local computer.
drive_download(
  file = as_id(metadata_file$id),
  path = paste0(folder_path, "metadata"),
  type = "xlsx")
