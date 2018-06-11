#!/bin/bash

TILT=0
AZI=-45
for j in {0..8..2}
	do
	for i in {0..8..2}
		do
		
		#rack panel
		#! genbox gray_paint rack  0.05 1.6 1.0 | xform -t 0 0+$n 1

		
		
		if [ $j -eq 0 ] && [ $i -eq 0 ] ; then
		
			#glass pane
			#! genbox panel_glass panel_cover 0.005 1.6 1.0 | xform -t $j.01 $i 1 > cell.rad
			
			#pv panel
			! genbox black_cell cell1 -0.005 1.6 1.0 | xform -ry $TILT -rz $AZI -t $j $i 1 > cell.rad
			
			
			#mounting structure
			#! genbox chrome mount 0.05 0.05 1.5 | xform -t $j $i.8 0 >> cell.rad
			
			#calculate measure_front
			#echo -n $j.6 > measure_front.dat
			#echo -n " " >> measure_front.dat
			#echo -n $i.5 >> measure_front.dat
			#echo -n " " >> measure_front.dat
			#echo -n 1.5 >> measure_front.dat
			#echo -n " " >> measure_front.dat
			#cat normal_vec.dat >> measure_front.dat
			#echo "" >> measure_front.dat
			
		else
		
			#glass pane
			#! genbox panel_glass panel_cover 0.005 1.6 1.0 | xform -t $j.01 $i 1 >> cell.rad
			
			#pv panel
			! genbox black_cell cell1 -0.005 1.6 1.0 | xform -ry $TILT -rz $AZI -t $j $i 1 >> cell.rad
	
			
			#mounting structure
			#! genbox chrome mount 0.05 0.05 1.5 | xform -t $j $i.8 0 >> cell.rad
			
			#calculate measure_front
			#echo -n $j.6 >> measure_front.dat
			#echo -n " " >> measure_front.dat
			#echo -n $i.5 >> measure_front.dat
			#echo -n " " >> measure_front.dat
			#echo -n 1.5 >> measure_front.dat
			#echo -n " " >> measure_front.dat
			#cat normal_vec.dat >> measure_front.dat
			#echo "" >> measure_front.dat
			
		fi

	done
done

#! rad -o qt pv_control.rif
#! rtrace -h -w -ab 2 -I -ad 512 -as 128 -ov pv_control.oct < measure_front.dat \
#| rcalc -f irr_formula.dat > irr_front.dat



