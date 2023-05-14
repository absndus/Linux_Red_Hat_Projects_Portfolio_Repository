#!/bin/bash
#Title: Linux_Script_2_SAP_TMS_Transport_Finder_Copy.sh
#Author: Albert Schultz
#Version: 1.00
#Summary: This Script Performs the queries of trasnport request ID that are needed to transport the files, which contains SAP change codes, from one SAP to another. 

#Asks for the SAP Transport Request ID(s):
echo "Please enter the SAP Transport Request ID: "
read TRANSPORTID

#Once the ID has been entered into the above variable, pass it through the function below to find the transport files and export them into the /TransportsFiles/ folder.
find /usr/sap/trans/. -name [R,K]$TRANSPORTID.<change for SAP instance ID> | xargs cp -t /TransportsFiles/ #<- Create a new folder called, TransportsFiles on the SAP DEV Red Hat to store all of the found files and then use the MobaXTERM to copy the files to your computer for manual SAP TMS file export to your chosen QAS SAP system or PROD systems.
echo "Transport files has been completed!"

#Shows the completed files copied over to the destined file-directory(s).
ls -l /TransportsFiles/
#End of program
