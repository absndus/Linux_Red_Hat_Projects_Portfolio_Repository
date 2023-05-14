#File: Project_5_Linux_ELIF_Statement_Float_Calculate_WeightLBtoKg.sh
#Author: Albert B. Schultz
#Date: 05/14/2023
#Version: 1.00
#Compatible Version: RHEL 7+
#Description: This Linux bash script runs simple if-else statements to show how if-else and elif work in Linux.

#Install necessary module libraries using yum install command. Uncomment if you do not have the library programs installed.
#yum install cb -y

#Create variables needed for the script.
read -p "Enter the weight in lb here: " weight_lb

#Create if-else statement.
if [ $weight_lb -eq 100 ]; then
  echo '100 range.'
elif [ $weight_lb -eq 200 ]; then
  echo '200 range.'
elif [ $weight_lb -eq 300 ]; then
  echo '300 range.'
elif [ $weight_lb -eq 400 ]; then
  echo '400 range.'
else
  echo 'Please enter your weight in pounds (lb).'
fi

#Create calculation algorithm that converts pounds(lb) to kilogram (kg) and convert it to floating point to 2 decimal places.
kg=$(( echo "scale=2; $weight_lb * 0.45" ) | bc )

#Print out the results by using the echo method.
echo "The weight from $weight_lb pounds to kilogram is, $kg."