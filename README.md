# Photometry-Analysis-Shared

This folder contains files that are useful for the analysis of fiber photometry data

If you are using a TDT-based photometry recording system, you will find that tdt2mat.m and tdtExtract.m can be used to take "Blocks" recorded using the TDT and pull out vectors of your signal and control channels

Regardless of how you collected your data, you may use controlFit.m and deltaFF.m to get you started on your analysis. controlFit.m fits the control channel to the signal using a linear regression and outputs a fitted control vector. deltaFF.m calculates deltaFF as (signal-fitted_control)/fitted_control. This method makes some assumptions about the data -- use at your own risk! :)

I hope these files will help you get started on your fiber photometry data analysis! Please feel free to ask questions and contribute.

-Talia
talia.lerner@gmail.com
