#!/bin/bash

ACPI=$(acpi -b)
SENSORS=$(sensors)

run_segment() {
	FAN=$(sensors | grep fan | awk '{ print $2 }')
	echo "${FAN} rpm"
}
