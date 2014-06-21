CourseProjectGettingandCleaningData
===================================

This repo is for course project in Coursera **Johns Hopkins** *Jeff Leek* Getting and Cleaning Data Course.


It uses 2 sets of input data sets and processes them to produce a tidy dataset.

Acknowledgement is made to Course lectures, examples given by TA, materials in discussion forums, and specifically for paper by *Hadley Wickham*.


The R code is in run_analysis.R file. The code has comments to make it readable.

There is a codebook.md file in the repo which contains a dictionary of all the variables.


Data Source Files Organization

Data is provided in a zip file. This was downloaded to local working directory on a machine running Windows Vista and R.

The directory structure of data files is in root directory and 2 sub-directories - test and train. 

After unzipping, the data files are used by R program, which produces the tidy data sets.


Processing Summary

All the processing is done by a single R program called run_analysis.R. It reads test and train data files, and related files describing labels for data sets and activity and subject data. The progrms combines these data sets and produces a tidy data set.


Output Files

The main outfile is written as tidyfile.txt in the working directory. It contains average values for variables per subject and activity sets.

This readme along with codebase.md and run_analysis is stored in a git hub repo.


