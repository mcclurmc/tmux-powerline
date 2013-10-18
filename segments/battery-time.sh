#!/bin/bash

ACPI=$(acpi -b)

run_segment() {
	echo ${ACPI} | grep -q Full
	if [ $? -eq 0 ]; then
		echo "―     "
	else
		echo ${ACPI} | grep -q Charging
		if [ $? -eq 0 ]; then
			# charging
			echo -n "↑ "

			echo ${ACPI} | egrep -q -e zero -e Unknown
			if [ $? -eq 0 ]; then
				# time unknown
				echo "     "
			else
				# time known
				echo ${ACPI} | grep -q "100%"
				if [ $? -eq 0 ]; then
					echo "100%"
				else
					echo $(echo ${ACPI} | awk '{print $5}' | sed 's/^\(..:..\):../\1/')
				fi
			fi

		else
			# discharging
			echo -n "↓ "

			echo ${ACPI} | egrep -q -e zero -e Unknown
			if [ $? -eq 0 ]; then
				# time unknown
				echo "     "
			else
				# time known
				echo $(echo ${ACPI} | awk '{print $5}' | sed 's/^\(..:..\):../\1/')
			fi
		fi
	fi
}
