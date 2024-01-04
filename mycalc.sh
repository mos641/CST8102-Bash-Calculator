#!/bin/bash

# Lab 9
# CST8102
# mycalc.sh
# This script performs addition or subtraction calculations

#declare the choice variable
choice=t

#loop throught the program
while [ "$choice" != "x" ] && [ "$choice" != "X" ]
do
	# clear the screen here and after each valid input
	clear
	
	# ask for and validate the first menu choice with a while loop
	while [ "$choice" != "c" ] && [ "$choice" != "x" ] && [ "$choice" != "C" ] && [ "$choice" != "X" ]
	do
		# print menu and store input
		echo -e "C) Calculation \n \nX) Exit\n "
		read -p "Enter your choice: " choice
		
		# if there is no paramater clear the screen to display menu again
		if [ "$choice" = "" ]
		then
			clear
		elif [ "$choice" != "c" ] && [ "$choice" != "C" ] && [ "$choice" != "x" ] && [ "$choice" != "X" ]
		then
			# if its not a no paramater input or a valid input tell user so
			echo -e "Invalid choice. Try again. \n"
		fi
	done
	clear

	# Display the second menu if x was not selected
	if [ "$choice" != "x" ] && [ "$choice" != "X" ]
	then
		# variables for test conditions in validation loop
		ext=false
		isInt=false

		# ask for and validate the input
		while [ $ext = false ] && [ $isInt = false ]
		do
			# print second menu and store input
			read -p "Please enter an integer number or X to exit: " num1

			# if its an integer set one of loop conditions to true
			if [[ "$num1" =~ ^-?[0-9]+$ ]]
			then
				isInt=true
			elif [ "$num1" = "x" ] || [ "$num1" = "X" ]
			then
				# if its x set one of loop conditions to true and choice to x in order to exit the first loop
				ext=true
				choice="x"
			else
				# if it isnt valid input let the user know
				echo Invalid input. Try again.
			fi		
		done
		clear

		# Display the third menu if x was not selected
		if [ "$num1" != "x" ] && [ "$num1" != "X" ]
		then

			echo -e "+) Add \n\n-) Subtract \n\nX) Exit\n"
			read -p "Enter your choice: " choice

			# validate the second menu choice with a while loop
			while [ "$choice" != "+" ] && [ "$choice" != "-" ] && [ "$choice" != "x" ] && [ "$choice" != "X" ]
			do
				# if invalid let user know
				read -p "This is not a valid menu choice, try again: " choice
			done
			clear

			# Display the fourth menu (second number) if not x
			if [ "$choice" != "x" ] && [ "$choice" != "X" ]
			then
				# reset test variables for the validation loop
				ext=false
				isInt=false

				# ask for input and validate the number
				while [ "$ext" = false ] && [ "$isInt" = false ]
				do
					# print fourth menu
					read -p "Please enter a second integer number or X to exit: " num2
					
					# if its an integer set one loop condition to true
					if [[ "$num2" =~ ^-?[0-9]+$ ]]
					then
						isInt=true
					elif [ "$num2" = "x" ] || [ "$num2" = "X" ]
					then
						#if its an x set one loop condition to true and choice to x in order to exit the first loop
						ext=true
						choice="x"
					else
						echo Invalid input. Try again.
					fi
				done
				clear

				#if they didnt exit display the result
				if [ "$num2" != "x" ] && [ "$num2" != "X" ]
				then
					#calculate and print
					((num3=num1"$choice"num2))
					echo Your calculated result is:  "$num3"
					# sleep for three seconds
					sleep 3

				fi
			fi
		fi
	fi
done
