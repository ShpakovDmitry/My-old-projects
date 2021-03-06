EESchema Schematic File Version 4
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Morse panel"
Date "2020-02-18"
Rev "v1_03"
Comp ""
Comment1 ""
Comment2 "ShpakovDmitry"
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Microchip_ATtiny:ATtiny2313-20PU U2
U 1 1 5E42D6AB
P 4800 6250
F 0 "U2" H 4800 7528 50  0000 C CNN
F 1 "ATtiny2313-20PU" H 4800 7437 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm" H 4800 6250 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-2543-AVR-ATtiny2313_Datasheet.pdf" H 4800 6250 50  0001 C CNN
	1    4800 6250
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:uA7805 U1
U 1 1 5E42D8D6
P 2000 2400
F 0 "U1" H 2000 2642 50  0000 C CNN
F 1 "uA7805" H 2000 2551 50  0000 C CNN
F 2 "" H 2025 2250 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/ua78.pdf" H 2000 2350 50  0001 C CNN
	1    2000 2400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5E42DA15
P 2000 2950
F 0 "#PWR05" H 2000 2700 50  0001 C CNN
F 1 "GND" H 2005 2777 50  0000 C CNN
F 2 "" H 2000 2950 50  0001 C CNN
F 3 "" H 2000 2950 50  0001 C CNN
	1    2000 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C1
U 1 1 5E42DAED
P 1550 2700
F 0 "C1" H 1668 2746 50  0000 L CNN
F 1 "0.33uF" H 1668 2655 50  0000 L CNN
F 2 "" H 1588 2550 50  0001 C CNN
F 3 "~" H 1550 2700 50  0001 C CNN
	1    1550 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C3
U 1 1 5E42DB42
P 2450 2700
F 0 "C3" H 2568 2746 50  0000 L CNN
F 1 "0.1uF" H 2568 2655 50  0000 L CNN
F 2 "" H 2488 2550 50  0001 C CNN
F 3 "~" H 2450 2700 50  0001 C CNN
	1    2450 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 2700 2000 2850
Wire Wire Line
	2450 2850 2000 2850
Connection ~ 2000 2850
Wire Wire Line
	2000 2850 2000 2950
Wire Wire Line
	1550 2850 2000 2850
Wire Wire Line
	2300 2400 2450 2400
Wire Wire Line
	2450 2550 2450 2400
Connection ~ 2450 2400
Wire Wire Line
	1700 2400 1550 2400
Wire Wire Line
	1550 2550 1550 2400
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 5E42E16D
P 900 1200
F 0 "J1" H 820 875 50  0000 C CNN
F 1 "Conn_01x02" H 820 966 50  0000 C CNN
F 2 "" H 900 1200 50  0001 C CNN
F 3 "~" H 900 1200 50  0001 C CNN
	1    900  1200
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5E42E229
P 1100 1650
F 0 "#PWR03" H 1100 1400 50  0001 C CNN
F 1 "GND" H 1105 1477 50  0000 C CNN
F 2 "" H 1100 1650 50  0001 C CNN
F 3 "" H 1100 1650 50  0001 C CNN
	1    1100 1650
	1    0    0    -1  
$EndComp
Text Notes 750  750  0    50   ~ 0
DC input power connector\n      range 7-25 V
$Comp
L power:+5V #PWR07
U 1 1 5E42E9C6
P 2950 2100
F 0 "#PWR07" H 2950 1950 50  0001 C CNN
F 1 "+5V" H 2965 2273 50  0000 C CNN
F 2 "" H 2950 2100 50  0001 C CNN
F 3 "" H 2950 2100 50  0001 C CNN
	1    2950 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 2100 2950 2400
Wire Wire Line
	2450 2400 2950 2400
$Comp
L Device:Fuse F1
U 1 1 5E42F06D
P 2950 1100
F 0 "F1" V 2753 1100 50  0000 C CNN
F 1 "Fuse" V 2844 1100 50  0000 C CNN
F 2 "" V 2880 1100 50  0001 C CNN
F 3 "~" H 2950 1100 50  0001 C CNN
	1    2950 1100
	0    1    1    0   
$EndComp
$Comp
L Device:D D1
U 1 1 5E42F4D9
P 3200 1300
F 0 "D1" V 3154 1379 50  0000 L CNN
F 1 "D" V 3245 1379 50  0000 L CNN
F 2 "" H 3200 1300 50  0001 C CNN
F 3 "~" H 3200 1300 50  0001 C CNN
	1    3200 1300
	0    1    1    0   
$EndComp
Wire Wire Line
	3100 1100 3200 1100
Wire Wire Line
	3200 1100 3200 1150
Wire Wire Line
	1100 1200 1100 1650
Wire Wire Line
	1100 1100 1650 1100
Text Label 1150 1100 0    50   ~ 0
DC_input
$Comp
L power:GND #PWR08
U 1 1 5E43127C
P 3200 1550
F 0 "#PWR08" H 3200 1300 50  0001 C CNN
F 1 "GND" H 3205 1377 50  0000 C CNN
F 2 "" H 3200 1550 50  0001 C CNN
F 3 "" H 3200 1550 50  0001 C CNN
	1    3200 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 1450 3200 1550
Wire Wire Line
	3200 1100 3700 1100
Connection ~ 3200 1100
Wire Wire Line
	2800 1100 2300 1100
Text Label 2400 1100 0    50   ~ 0
DC_input
Text Label 3300 1100 0    50   ~ 0
circuit_protection
Text Notes 2600 750  0    50   ~ 0
Simple circuit protection from\npower reversal
Wire Wire Line
	1550 2400 600  2400
Connection ~ 1550 2400
Text Label 750  2400 0    50   ~ 0
circuit_protection
Text Notes 1400 2050 0    50   ~ 0
Voltage regulator Vout = +5V\n                  Imax = 1.5A
$Comp
L Device:LED D2
U 1 1 5E433D5B
P 5200 1600
F 0 "D2" V 5238 1482 50  0000 R CNN
F 1 "RED" V 5147 1482 50  0000 R CNN
F 2 "" H 5200 1600 50  0001 C CNN
F 3 "~" H 5200 1600 50  0001 C CNN
	1    5200 1600
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR09
U 1 1 5E4342F2
P 4800 4500
F 0 "#PWR09" H 4800 4350 50  0001 C CNN
F 1 "+5V" H 4815 4673 50  0000 C CNN
F 2 "" H 4800 4500 50  0001 C CNN
F 3 "" H 4800 4500 50  0001 C CNN
	1    4800 4500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5E434572
P 4800 7600
F 0 "#PWR010" H 4800 7350 50  0001 C CNN
F 1 "GND" H 4805 7427 50  0000 C CNN
F 2 "" H 4800 7600 50  0001 C CNN
F 3 "" H 4800 7600 50  0001 C CNN
	1    4800 7600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 7350 4800 7600
$Comp
L Device:Crystal Y1
U 1 1 5E4348DD
P 3700 5750
F 0 "Y1" V 3654 5881 50  0000 L CNN
F 1 "16MHz" V 3745 5881 50  0000 L CNN
F 2 "" H 3700 5750 50  0001 C CNN
F 3 "~" H 3700 5750 50  0001 C CNN
	1    3700 5750
	0    1    1    0   
$EndComp
$Comp
L Device:C C4
U 1 1 5E43502F
P 3250 5500
F 0 "C4" V 2998 5500 50  0000 C CNN
F 1 "15pF" V 3089 5500 50  0000 C CNN
F 2 "" H 3288 5350 50  0001 C CNN
F 3 "~" H 3250 5500 50  0001 C CNN
	1    3250 5500
	0    1    1    0   
$EndComp
$Comp
L Device:C C5
U 1 1 5E4350A2
P 3250 6000
F 0 "C5" V 2998 6000 50  0000 C CNN
F 1 "15pF" V 3089 6000 50  0000 C CNN
F 2 "" H 3288 5850 50  0001 C CNN
F 3 "~" H 3250 6000 50  0001 C CNN
	1    3250 6000
	0    1    1    0   
$EndComp
Wire Wire Line
	4200 5650 4050 5650
Wire Wire Line
	4050 5650 4050 5500
Wire Wire Line
	4050 5500 3700 5500
Wire Wire Line
	3700 5500 3700 5600
Wire Wire Line
	4200 5850 4050 5850
Wire Wire Line
	4050 5850 4050 6000
Wire Wire Line
	4050 6000 3700 6000
Wire Wire Line
	3700 6000 3700 5900
Wire Wire Line
	3400 5500 3700 5500
Connection ~ 3700 5500
Wire Wire Line
	3400 6000 3700 6000
Connection ~ 3700 6000
Wire Wire Line
	3100 5500 2950 5500
Wire Wire Line
	2950 5500 2950 6000
Wire Wire Line
	2950 6000 3100 6000
$Comp
L power:GND #PWR06
U 1 1 5E436191
P 2950 6300
F 0 "#PWR06" H 2950 6050 50  0001 C CNN
F 1 "GND" H 2955 6127 50  0000 C CNN
F 2 "" H 2950 6300 50  0001 C CNN
F 3 "" H 2950 6300 50  0001 C CNN
	1    2950 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 6300 2950 6000
Connection ~ 2950 6000
Text Notes 3150 6300 0    50   ~ 0
Keep those components\nas close as possible to uC\n
Wire Wire Line
	4800 4500 4800 4700
$Comp
L Switch:SW_Push SW1
U 1 1 5E438B4A
P 750 4500
F 0 "SW1" V 796 4452 50  0000 R CNN
F 1 "SW_Push" V 705 4452 50  0000 R CNN
F 2 "" H 750 4700 50  0001 C CNN
F 3 "" H 750 4700 50  0001 C CNN
	1    750  4500
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5E439418
P 750 4900
F 0 "#PWR02" H 750 4650 50  0001 C CNN
F 1 "GND" H 755 4727 50  0000 C CNN
F 2 "" H 750 4900 50  0001 C CNN
F 3 "" H 750 4900 50  0001 C CNN
	1    750  4900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5E43A26E
P 750 3950
F 0 "R1" H 820 3996 50  0000 L CNN
F 1 "56k" H 820 3905 50  0000 L CNN
F 2 "" V 680 3950 50  0001 C CNN
F 3 "~" H 750 3950 50  0001 C CNN
	1    750  3950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5E43A9A2
P 1150 4200
F 0 "R2" V 943 4200 50  0000 C CNN
F 1 "5.6k" V 1034 4200 50  0000 C CNN
F 2 "" V 1080 4200 50  0001 C CNN
F 3 "~" H 1150 4200 50  0001 C CNN
	1    1150 4200
	0    1    1    0   
$EndComp
$Comp
L Device:C C2
U 1 1 5E43AAE3
P 1450 4500
F 0 "C2" H 1565 4546 50  0000 L CNN
F 1 "0.1uF" H 1565 4455 50  0000 L CNN
F 2 "" H 1488 4350 50  0001 C CNN
F 3 "~" H 1450 4500 50  0001 C CNN
	1    1450 4500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01
U 1 1 5E43C33E
P 750 3600
F 0 "#PWR01" H 750 3450 50  0001 C CNN
F 1 "+5V" H 765 3773 50  0000 C CNN
F 2 "" H 750 3600 50  0001 C CNN
F 3 "" H 750 3600 50  0001 C CNN
	1    750  3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	750  3600 750  3800
Wire Wire Line
	750  4100 750  4200
Wire Wire Line
	1000 4200 750  4200
Connection ~ 750  4200
Wire Wire Line
	750  4200 750  4300
Wire Wire Line
	750  4700 750  4900
$Comp
L power:GND #PWR04
U 1 1 5E43DA98
P 1450 4900
F 0 "#PWR04" H 1450 4650 50  0001 C CNN
F 1 "GND" H 1455 4727 50  0000 C CNN
F 2 "" H 1450 4900 50  0001 C CNN
F 3 "" H 1450 4900 50  0001 C CNN
	1    1450 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 4650 1450 4900
Wire Wire Line
	1300 4200 1450 4200
Wire Wire Line
	1450 4350 1450 4200
Connection ~ 1450 4200
Wire Wire Line
	1450 4200 1850 4200
Text Label 1600 4200 0    50   ~ 0
RESET
Wire Wire Line
	4200 5450 4200 5250
Wire Wire Line
	4200 5250 3550 5250
Text Label 3700 5250 0    50   ~ 0
RESET
Text Notes 1050 3700 0    50   ~ 0
HW reset circuit
$Comp
L Transistor_BJT:PN2222A Q1
U 1 1 5E441B5A
P 5100 2050
F 0 "Q1" H 5291 2096 50  0000 L CNN
F 1 "PN2222A" H 5291 2005 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 5300 1975 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/PN/PN2222A.pdf" H 5100 2050 50  0001 L CNN
	1    5100 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5E442E57
P 5200 1200
F 0 "R4" H 5130 1154 50  0000 R CNN
F 1 "330R" H 5130 1245 50  0000 R CNN
F 2 "" V 5130 1200 50  0001 C CNN
F 3 "~" H 5200 1200 50  0001 C CNN
	1    5200 1200
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR011
U 1 1 5E44469D
P 5200 950
F 0 "#PWR011" H 5200 800 50  0001 C CNN
F 1 "+5V" H 5215 1123 50  0000 C CNN
F 2 "" H 5200 950 50  0001 C CNN
F 3 "" H 5200 950 50  0001 C CNN
	1    5200 950 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5E445327
P 5200 2350
F 0 "#PWR012" H 5200 2100 50  0001 C CNN
F 1 "GND" H 5205 2177 50  0000 C CNN
F 2 "" H 5200 2350 50  0001 C CNN
F 3 "" H 5200 2350 50  0001 C CNN
	1    5200 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5E445F88
P 4650 2050
F 0 "R3" V 4857 2050 50  0000 C CNN
F 1 "1k" V 4766 2050 50  0000 C CNN
F 2 "" V 4580 2050 50  0001 C CNN
F 3 "~" H 4650 2050 50  0001 C CNN
	1    4650 2050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5200 1750 5200 1850
Wire Wire Line
	5200 1350 5200 1450
Wire Wire Line
	5200 950  5200 1050
Wire Wire Line
	4800 2050 4900 2050
Wire Wire Line
	5200 2250 5200 2350
$Comp
L Device:LED D3
U 1 1 5E44BEB7
P 7050 1600
F 0 "D3" V 7088 1482 50  0000 R CNN
F 1 "GREEN" V 6997 1482 50  0000 R CNN
F 2 "" H 7050 1600 50  0001 C CNN
F 3 "~" H 7050 1600 50  0001 C CNN
	1    7050 1600
	0    -1   -1   0   
$EndComp
$Comp
L Transistor_BJT:PN2222A Q2
U 1 1 5E44BEBE
P 6950 2050
F 0 "Q2" H 7141 2096 50  0000 L CNN
F 1 "PN2222A" H 7141 2005 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 7150 1975 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/PN/PN2222A.pdf" H 6950 2050 50  0001 L CNN
	1    6950 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5E44BEC5
P 7050 1200
F 0 "R7" H 6980 1154 50  0000 R CNN
F 1 "330R" H 6980 1245 50  0000 R CNN
F 2 "" V 6980 1200 50  0001 C CNN
F 3 "~" H 7050 1200 50  0001 C CNN
	1    7050 1200
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR014
U 1 1 5E44BECC
P 7050 950
F 0 "#PWR014" H 7050 800 50  0001 C CNN
F 1 "+5V" H 7065 1123 50  0000 C CNN
F 2 "" H 7050 950 50  0001 C CNN
F 3 "" H 7050 950 50  0001 C CNN
	1    7050 950 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 5E44BED2
P 7050 2350
F 0 "#PWR015" H 7050 2100 50  0001 C CNN
F 1 "GND" H 7055 2177 50  0000 C CNN
F 2 "" H 7050 2350 50  0001 C CNN
F 3 "" H 7050 2350 50  0001 C CNN
	1    7050 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5E44BED8
P 6500 2050
F 0 "R5" V 6707 2050 50  0000 C CNN
F 1 "1k" V 6616 2050 50  0000 C CNN
F 2 "" V 6430 2050 50  0001 C CNN
F 3 "~" H 6500 2050 50  0001 C CNN
	1    6500 2050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7050 1750 7050 1850
Wire Wire Line
	7050 1350 7050 1450
Wire Wire Line
	7050 950  7050 1050
Wire Wire Line
	6650 2050 6750 2050
Wire Wire Line
	7050 2250 7050 2350
Wire Wire Line
	4500 2050 4100 2050
Wire Wire Line
	6350 2050 5950 2050
Wire Wire Line
	5400 6650 6150 6650
Wire Wire Line
	5400 6750 6150 6750
Text Label 5600 6650 0    50   ~ 0
RED_LED
Text Label 5500 6750 0    50   ~ 0
GREEN_LED
Text Label 4150 2050 0    50   ~ 0
RED_LED
Text Label 6300 2050 2    50   ~ 0
GREEN_LED
$Comp
L Device:Speaker LS1
U 1 1 5E456CB7
P 9050 1550
F 0 "LS1" H 9220 1546 50  0000 L CNN
F 1 "Speaker" H 9220 1455 50  0000 L CNN
F 2 "" H 9050 1350 50  0001 C CNN
F 3 "~" H 9040 1500 50  0001 C CNN
	1    9050 1550
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:PN2222A Q3
U 1 1 5E4576FE
P 8600 2050
F 0 "Q3" H 8791 2096 50  0000 L CNN
F 1 "PN2222A" H 8791 2005 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 8800 1975 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/PN/PN2222A.pdf" H 8600 2050 50  0001 L CNN
	1    8600 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 5E457704
P 8700 1200
F 0 "R10" H 8630 1154 50  0000 R CNN
F 1 "330R" H 8630 1245 50  0000 R CNN
F 2 "" V 8630 1200 50  0001 C CNN
F 3 "~" H 8700 1200 50  0001 C CNN
	1    8700 1200
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR020
U 1 1 5E45770A
P 8700 950
F 0 "#PWR020" H 8700 800 50  0001 C CNN
F 1 "+5V" H 8715 1123 50  0000 C CNN
F 2 "" H 8700 950 50  0001 C CNN
F 3 "" H 8700 950 50  0001 C CNN
	1    8700 950 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR021
U 1 1 5E457710
P 8700 2350
F 0 "#PWR021" H 8700 2100 50  0001 C CNN
F 1 "GND" H 8705 2177 50  0000 C CNN
F 2 "" H 8700 2350 50  0001 C CNN
F 3 "" H 8700 2350 50  0001 C CNN
	1    8700 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 5E457716
P 8150 2050
F 0 "R8" V 8357 2050 50  0000 C CNN
F 1 "1k" V 8266 2050 50  0000 C CNN
F 2 "" V 8080 2050 50  0001 C CNN
F 3 "~" H 8150 2050 50  0001 C CNN
	1    8150 2050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8700 950  8700 1050
Wire Wire Line
	8300 2050 8400 2050
Wire Wire Line
	8700 2250 8700 2350
Wire Wire Line
	8000 2050 7600 2050
Wire Wire Line
	8700 1550 8850 1550
Wire Wire Line
	8700 1350 8700 1550
Wire Wire Line
	8850 1650 8700 1650
Wire Wire Line
	8700 1650 8700 1850
Wire Wire Line
	5400 6850 6150 6850
Text Label 5600 6850 0    50   ~ 0
SPEAKER
Text Label 7950 2050 2    50   ~ 0
SPEAKER
$Comp
L Switch:SW_Push SW2
U 1 1 5E461018
P 3950 3450
F 0 "SW2" V 3996 3598 50  0000 L CNN
F 1 "BUTTON_1" V 3905 3598 50  0000 L CNN
F 2 "" H 3950 3650 50  0001 C CNN
F 3 "" H 3950 3650 50  0001 C CNN
	1    3950 3450
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR016
U 1 1 5E46101F
P 3950 3750
F 0 "#PWR016" H 3950 3500 50  0001 C CNN
F 1 "GND" H 3955 3577 50  0000 C CNN
F 2 "" H 3950 3750 50  0001 C CNN
F 3 "" H 3950 3750 50  0001 C CNN
	1    3950 3750
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5E46102C
P 3750 3200
F 0 "R6" V 3543 3200 50  0000 C CNN
F 1 "5.6k" V 3634 3200 50  0000 C CNN
F 2 "" V 3680 3200 50  0001 C CNN
F 3 "~" H 3750 3200 50  0001 C CNN
	1    3750 3200
	0    -1   1    0   
$EndComp
$Comp
L Device:C C6
U 1 1 5E461033
P 3550 3450
F 0 "C6" H 3665 3496 50  0000 L CNN
F 1 "DNP" H 3665 3405 50  0000 L CNN
F 2 "" H 3588 3300 50  0001 C CNN
F 3 "~" H 3550 3450 50  0001 C CNN
	1    3550 3450
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5E461046
P 3550 3750
F 0 "#PWR013" H 3550 3500 50  0001 C CNN
F 1 "GND" H 3555 3577 50  0000 C CNN
F 2 "" H 3550 3750 50  0001 C CNN
F 3 "" H 3550 3750 50  0001 C CNN
	1    3550 3750
	-1   0    0    -1  
$EndComp
Text Notes 6050 1550 0    50   ~ 0
Is ON if pressed button\nsequence is correct,\notherwise is OFF
Text Notes 4200 1550 0    50   ~ 0
Is ON if pressed button\nsequence is wrong,\notherwise is OFF
$Comp
L Switch:SW_Push SW3
U 1 1 5E46FC79
P 5350 3450
F 0 "SW3" V 5396 3598 50  0000 L CNN
F 1 "BUTTON_2" V 5305 3598 50  0000 L CNN
F 2 "" H 5350 3650 50  0001 C CNN
F 3 "" H 5350 3650 50  0001 C CNN
	1    5350 3450
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR022
U 1 1 5E46FC7F
P 5350 3750
F 0 "#PWR022" H 5350 3500 50  0001 C CNN
F 1 "GND" H 5355 3577 50  0000 C CNN
F 2 "" H 5350 3750 50  0001 C CNN
F 3 "" H 5350 3750 50  0001 C CNN
	1    5350 3750
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 5E46FC85
P 5150 3200
F 0 "R9" V 4943 3200 50  0000 C CNN
F 1 "5.6k" V 5034 3200 50  0000 C CNN
F 2 "" V 5080 3200 50  0001 C CNN
F 3 "~" H 5150 3200 50  0001 C CNN
	1    5150 3200
	0    -1   1    0   
$EndComp
$Comp
L Device:C C7
U 1 1 5E46FC8B
P 4950 3450
F 0 "C7" H 5065 3496 50  0000 L CNN
F 1 "DNP" H 5065 3405 50  0000 L CNN
F 2 "" H 4988 3300 50  0001 C CNN
F 3 "~" H 4950 3450 50  0001 C CNN
	1    4950 3450
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR019
U 1 1 5E46FC94
P 4950 3750
F 0 "#PWR019" H 4950 3500 50  0001 C CNN
F 1 "GND" H 4955 3577 50  0000 C CNN
F 2 "" H 4950 3750 50  0001 C CNN
F 3 "" H 4950 3750 50  0001 C CNN
	1    4950 3750
	-1   0    0    -1  
$EndComp
$Comp
L Switch:SW_Push SW4
U 1 1 5E4714F3
P 6750 3450
F 0 "SW4" V 6796 3598 50  0000 L CNN
F 1 "BUTTON_2" V 6705 3598 50  0000 L CNN
F 2 "" H 6750 3650 50  0001 C CNN
F 3 "" H 6750 3650 50  0001 C CNN
	1    6750 3450
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR024
U 1 1 5E4714F9
P 6750 3750
F 0 "#PWR024" H 6750 3500 50  0001 C CNN
F 1 "GND" H 6755 3577 50  0000 C CNN
F 2 "" H 6750 3750 50  0001 C CNN
F 3 "" H 6750 3750 50  0001 C CNN
	1    6750 3750
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R11
U 1 1 5E4714FF
P 6550 3200
F 0 "R11" V 6343 3200 50  0000 C CNN
F 1 "5.6k" V 6434 3200 50  0000 C CNN
F 2 "" V 6480 3200 50  0001 C CNN
F 3 "~" H 6550 3200 50  0001 C CNN
	1    6550 3200
	0    -1   1    0   
$EndComp
$Comp
L Device:C C8
U 1 1 5E471505
P 6350 3450
F 0 "C8" H 6465 3496 50  0000 L CNN
F 1 "DNP" H 6465 3405 50  0000 L CNN
F 2 "" H 6388 3300 50  0001 C CNN
F 3 "~" H 6350 3450 50  0001 C CNN
	1    6350 3450
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR023
U 1 1 5E47150E
P 6350 3750
F 0 "#PWR023" H 6350 3500 50  0001 C CNN
F 1 "GND" H 6355 3577 50  0000 C CNN
F 2 "" H 6350 3750 50  0001 C CNN
F 3 "" H 6350 3750 50  0001 C CNN
	1    6350 3750
	-1   0    0    -1  
$EndComp
Text Label 5500 6050 0    50   ~ 0
BUTTON_1
Text Label 5500 5850 0    50   ~ 0
BUTTON_3
Text Label 5500 5550 0    50   ~ 0
BUTTON_2
Text Label 3550 3200 2    50   ~ 0
BUTTON_1
Text Label 4950 3200 2    50   ~ 0
BUTTON_2
Text Label 6350 3200 2    50   ~ 0
BUTTON_3
Text Notes 3100 2950 0    50   ~ 0
Pull-up is uC internal 56k pullup
Text Notes 4500 2950 0    50   ~ 0
Pull-up is uC internal 56k pullup
Text Notes 5900 2950 0    50   ~ 0
Pull-up is uC internal 56k pullup
$Comp
L Connector:AVR-ISP-6 J2
U 1 1 5E484428
P 1350 6050
F 0 "J2" H 1070 6146 50  0000 R CNN
F 1 "AVR-ISP-6" H 1070 6055 50  0000 R CNN
F 2 "" V 1100 6100 50  0001 C CNN
F 3 " ~" H 75  5500 50  0001 C CNN
	1    1350 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR018
U 1 1 5E484C7C
P 1250 6550
F 0 "#PWR018" H 1250 6300 50  0001 C CNN
F 1 "GND" H 1255 6377 50  0000 C CNN
F 2 "" H 1250 6550 50  0001 C CNN
F 3 "" H 1250 6550 50  0001 C CNN
	1    1250 6550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR017
U 1 1 5E4850E3
P 1250 5450
F 0 "#PWR017" H 1250 5300 50  0001 C CNN
F 1 "+5V" H 1265 5623 50  0000 C CNN
F 2 "" H 1250 5450 50  0001 C CNN
F 3 "" H 1250 5450 50  0001 C CNN
	1    1250 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 5450 1250 5550
Wire Wire Line
	1250 6450 1250 6550
Wire Wire Line
	1750 5850 2500 5850
Wire Wire Line
	1750 5950 2500 5950
Wire Wire Line
	1750 6050 2500 6050
Wire Wire Line
	1750 6150 2500 6150
Text Label 1950 6150 0    50   ~ 0
RESET
Text Label 1950 6050 0    50   ~ 0
SCK
Text Notes 1550 5500 0    100  ~ 0
ISP connector
Text Notes 6650 6150 0    100  ~ 0
uC is configured that\ninternal pull-up resistors\nare connected to PORTB\nafter init
Wire Notes Line
	6550 5500 6550 6300
Wire Notes Line
	6550 6300 8600 6300
Wire Notes Line
	8600 6300 8600 5500
Wire Notes Line
	8600 5500 6550 5500
Wire Wire Line
	5400 5950 6150 5950
Wire Wire Line
	5400 6050 6150 6050
Wire Wire Line
	5400 6150 6150 6150
$Comp
L Device:CP C9
U 1 1 5E4C1AA4
P 4300 4700
F 0 "C9" V 4045 4700 50  0000 C CNN
F 1 "1uF" V 4136 4700 50  0000 C CNN
F 2 "" H 4338 4550 50  0001 C CNN
F 3 "~" H 4300 4700 50  0001 C CNN
	1    4300 4700
	0    1    1    0   
$EndComp
Wire Wire Line
	4450 4700 4800 4700
Connection ~ 4800 4700
Wire Wire Line
	4800 4700 4800 5150
$Comp
L power:GND #PWR025
U 1 1 5E4C433B
P 4000 4900
F 0 "#PWR025" H 4000 4650 50  0001 C CNN
F 1 "GND" H 4005 4727 50  0000 C CNN
F 2 "" H 4000 4900 50  0001 C CNN
F 3 "" H 4000 4900 50  0001 C CNN
	1    4000 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 4700 4000 4700
Wire Wire Line
	4000 4700 4000 4900
Wire Wire Line
	5400 5550 6150 5550
Wire Wire Line
	5400 5850 6150 5850
NoConn ~ 5400 6350
NoConn ~ 5400 6450
NoConn ~ 5400 6550
NoConn ~ 5400 6950
Text Label 1950 5950 0    50   ~ 0
MOSI
Text Label 1950 5850 0    50   ~ 0
BUTTON_1
Wire Wire Line
	3900 3200 3950 3200
Wire Wire Line
	3950 3200 3950 3250
Wire Wire Line
	3950 3650 3950 3750
Wire Wire Line
	3550 3600 3550 3750
Wire Wire Line
	3600 3200 3550 3200
Wire Wire Line
	3550 3300 3550 3200
Connection ~ 3550 3200
Wire Wire Line
	3550 3200 3150 3200
Wire Wire Line
	5000 3200 4950 3200
Wire Wire Line
	4950 3300 4950 3200
Connection ~ 4950 3200
Wire Wire Line
	4950 3200 4550 3200
Wire Wire Line
	5300 3200 5350 3200
Wire Wire Line
	5350 3200 5350 3250
Wire Wire Line
	5350 3650 5350 3750
Wire Wire Line
	4950 3600 4950 3750
Wire Wire Line
	6400 3200 6350 3200
Wire Wire Line
	6350 3300 6350 3200
Connection ~ 6350 3200
Wire Wire Line
	6350 3200 5950 3200
Wire Wire Line
	6350 3600 6350 3750
Wire Wire Line
	6750 3650 6750 3750
Wire Wire Line
	6750 3250 6750 3200
Wire Wire Line
	6750 3200 6700 3200
$Comp
L Switch:SW_Push SW?
U 1 1 5E532E85
P 8150 3450
F 0 "SW?" V 8196 3598 50  0000 L CNN
F 1 "BUTTON_2" V 8105 3598 50  0000 L CNN
F 2 "" H 8150 3650 50  0001 C CNN
F 3 "" H 8150 3650 50  0001 C CNN
	1    8150 3450
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E532E8C
P 8150 3750
F 0 "#PWR?" H 8150 3500 50  0001 C CNN
F 1 "GND" H 8155 3577 50  0000 C CNN
F 2 "" H 8150 3750 50  0001 C CNN
F 3 "" H 8150 3750 50  0001 C CNN
	1    8150 3750
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5E532E92
P 7950 3200
F 0 "R?" V 7743 3200 50  0000 C CNN
F 1 "5.6k" V 7834 3200 50  0000 C CNN
F 2 "" V 7880 3200 50  0001 C CNN
F 3 "~" H 7950 3200 50  0001 C CNN
	1    7950 3200
	0    -1   1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5E532E99
P 7750 3450
F 0 "C?" H 7865 3496 50  0000 L CNN
F 1 "DNP" H 7865 3405 50  0000 L CNN
F 2 "" H 7788 3300 50  0001 C CNN
F 3 "~" H 7750 3450 50  0001 C CNN
	1    7750 3450
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E532EA0
P 7750 3750
F 0 "#PWR?" H 7750 3500 50  0001 C CNN
F 1 "GND" H 7755 3577 50  0000 C CNN
F 2 "" H 7750 3750 50  0001 C CNN
F 3 "" H 7750 3750 50  0001 C CNN
	1    7750 3750
	-1   0    0    -1  
$EndComp
Text Label 7750 3200 2    50   ~ 0
BUTTON_PB0
Text Notes 7300 2950 0    50   ~ 0
Pull-up is uC internal 56k pullup
Wire Wire Line
	7800 3200 7750 3200
Wire Wire Line
	7750 3300 7750 3200
Connection ~ 7750 3200
Wire Wire Line
	7750 3200 7350 3200
Wire Wire Line
	7750 3600 7750 3750
Wire Wire Line
	8150 3650 8150 3750
Wire Wire Line
	8150 3250 8150 3200
Wire Wire Line
	8150 3200 8100 3200
$Comp
L Switch:SW_Push SW?
U 1 1 5E536840
P 9550 3450
F 0 "SW?" V 9596 3598 50  0000 L CNN
F 1 "BUTTON_2" V 9505 3598 50  0000 L CNN
F 2 "" H 9550 3650 50  0001 C CNN
F 3 "" H 9550 3650 50  0001 C CNN
	1    9550 3450
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E536847
P 9550 3750
F 0 "#PWR?" H 9550 3500 50  0001 C CNN
F 1 "GND" H 9555 3577 50  0000 C CNN
F 2 "" H 9550 3750 50  0001 C CNN
F 3 "" H 9550 3750 50  0001 C CNN
	1    9550 3750
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5E53684D
P 9350 3200
F 0 "R?" V 9143 3200 50  0000 C CNN
F 1 "5.6k" V 9234 3200 50  0000 C CNN
F 2 "" V 9280 3200 50  0001 C CNN
F 3 "~" H 9350 3200 50  0001 C CNN
	1    9350 3200
	0    -1   1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5E536854
P 9150 3450
F 0 "C?" H 9265 3496 50  0000 L CNN
F 1 "DNP" H 9265 3405 50  0000 L CNN
F 2 "" H 9188 3300 50  0001 C CNN
F 3 "~" H 9150 3450 50  0001 C CNN
	1    9150 3450
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E53685B
P 9150 3750
F 0 "#PWR?" H 9150 3500 50  0001 C CNN
F 1 "GND" H 9155 3577 50  0000 C CNN
F 2 "" H 9150 3750 50  0001 C CNN
F 3 "" H 9150 3750 50  0001 C CNN
	1    9150 3750
	-1   0    0    -1  
$EndComp
Text Label 9150 3200 2    50   ~ 0
BUTTON_PB2
Text Notes 8700 2950 0    50   ~ 0
Pull-up is uC internal 56k pullup
Wire Wire Line
	9200 3200 9150 3200
Wire Wire Line
	9150 3300 9150 3200
Connection ~ 9150 3200
Wire Wire Line
	9150 3200 8750 3200
Wire Wire Line
	9150 3600 9150 3750
Wire Wire Line
	9550 3650 9550 3750
Wire Wire Line
	9550 3250 9550 3200
Wire Wire Line
	9550 3200 9500 3200
$Comp
L Switch:SW_Push SW?
U 1 1 5E53AA9C
P 8150 4700
F 0 "SW?" V 8196 4848 50  0000 L CNN
F 1 "BUTTON_2" V 8105 4848 50  0000 L CNN
F 2 "" H 8150 4900 50  0001 C CNN
F 3 "" H 8150 4900 50  0001 C CNN
	1    8150 4700
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E53AAA3
P 8150 5000
F 0 "#PWR?" H 8150 4750 50  0001 C CNN
F 1 "GND" H 8155 4827 50  0000 C CNN
F 2 "" H 8150 5000 50  0001 C CNN
F 3 "" H 8150 5000 50  0001 C CNN
	1    8150 5000
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5E53AAA9
P 7950 4450
F 0 "R?" V 7743 4450 50  0000 C CNN
F 1 "5.6k" V 7834 4450 50  0000 C CNN
F 2 "" V 7880 4450 50  0001 C CNN
F 3 "~" H 7950 4450 50  0001 C CNN
	1    7950 4450
	0    -1   1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5E53AAB0
P 7750 4700
F 0 "C?" H 7865 4746 50  0000 L CNN
F 1 "DNP" H 7865 4655 50  0000 L CNN
F 2 "" H 7788 4550 50  0001 C CNN
F 3 "~" H 7750 4700 50  0001 C CNN
	1    7750 4700
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E53AAB7
P 7750 5000
F 0 "#PWR?" H 7750 4750 50  0001 C CNN
F 1 "GND" H 7755 4827 50  0000 C CNN
F 2 "" H 7750 5000 50  0001 C CNN
F 3 "" H 7750 5000 50  0001 C CNN
	1    7750 5000
	-1   0    0    -1  
$EndComp
Text Label 7750 4450 2    50   ~ 0
BUTTON_PB3
Text Notes 7300 4200 0    50   ~ 0
Pull-up is uC internal 56k pullup
Wire Wire Line
	7800 4450 7750 4450
Wire Wire Line
	7750 4550 7750 4450
Connection ~ 7750 4450
Wire Wire Line
	7750 4450 7350 4450
Wire Wire Line
	7750 4850 7750 5000
Wire Wire Line
	8150 4900 8150 5000
Wire Wire Line
	8150 4500 8150 4450
Wire Wire Line
	8150 4450 8100 4450
$Comp
L Switch:SW_Push SW?
U 1 1 5E53E717
P 9550 4700
F 0 "SW?" V 9596 4848 50  0000 L CNN
F 1 "BUTTON_2" V 9505 4848 50  0000 L CNN
F 2 "" H 9550 4900 50  0001 C CNN
F 3 "" H 9550 4900 50  0001 C CNN
	1    9550 4700
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E53E71E
P 9550 5000
F 0 "#PWR?" H 9550 4750 50  0001 C CNN
F 1 "GND" H 9555 4827 50  0000 C CNN
F 2 "" H 9550 5000 50  0001 C CNN
F 3 "" H 9550 5000 50  0001 C CNN
	1    9550 5000
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5E53E724
P 9350 4450
F 0 "R?" V 9143 4450 50  0000 C CNN
F 1 "5.6k" V 9234 4450 50  0000 C CNN
F 2 "" V 9280 4450 50  0001 C CNN
F 3 "~" H 9350 4450 50  0001 C CNN
	1    9350 4450
	0    -1   1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5E53E72B
P 9150 4700
F 0 "C?" H 9265 4746 50  0000 L CNN
F 1 "DNP" H 9265 4655 50  0000 L CNN
F 2 "" H 9188 4550 50  0001 C CNN
F 3 "~" H 9150 4700 50  0001 C CNN
	1    9150 4700
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E53E732
P 9150 5000
F 0 "#PWR?" H 9150 4750 50  0001 C CNN
F 1 "GND" H 9155 4827 50  0000 C CNN
F 2 "" H 9150 5000 50  0001 C CNN
F 3 "" H 9150 5000 50  0001 C CNN
	1    9150 5000
	-1   0    0    -1  
$EndComp
Text Label 9150 4450 2    50   ~ 0
BUTTON_PB5
Text Notes 8700 4200 0    50   ~ 0
Pull-up is uC internal 56k pullup
Wire Wire Line
	9200 4450 9150 4450
Wire Wire Line
	9150 4550 9150 4450
Connection ~ 9150 4450
Wire Wire Line
	9150 4450 8750 4450
Wire Wire Line
	9150 4850 9150 5000
Wire Wire Line
	9550 4900 9550 5000
Wire Wire Line
	9550 4500 9550 4450
Wire Wire Line
	9550 4450 9500 4450
$Comp
L Switch:SW_Push SW?
U 1 1 5E5430EC
P 9550 5950
F 0 "SW?" V 9596 6098 50  0000 L CNN
F 1 "BUTTON_2" V 9505 6098 50  0000 L CNN
F 2 "" H 9550 6150 50  0001 C CNN
F 3 "" H 9550 6150 50  0001 C CNN
	1    9550 5950
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E5430F3
P 9550 6250
F 0 "#PWR?" H 9550 6000 50  0001 C CNN
F 1 "GND" H 9555 6077 50  0000 C CNN
F 2 "" H 9550 6250 50  0001 C CNN
F 3 "" H 9550 6250 50  0001 C CNN
	1    9550 6250
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5E5430F9
P 9350 5700
F 0 "R?" V 9143 5700 50  0000 C CNN
F 1 "5.6k" V 9234 5700 50  0000 C CNN
F 2 "" V 9280 5700 50  0001 C CNN
F 3 "~" H 9350 5700 50  0001 C CNN
	1    9350 5700
	0    -1   1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5E543100
P 9150 5950
F 0 "C?" H 9265 5996 50  0000 L CNN
F 1 "DNP" H 9265 5905 50  0000 L CNN
F 2 "" H 9188 5800 50  0001 C CNN
F 3 "~" H 9150 5950 50  0001 C CNN
	1    9150 5950
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E543107
P 9150 6250
F 0 "#PWR?" H 9150 6000 50  0001 C CNN
F 1 "GND" H 9155 6077 50  0000 C CNN
F 2 "" H 9150 6250 50  0001 C CNN
F 3 "" H 9150 6250 50  0001 C CNN
	1    9150 6250
	-1   0    0    -1  
$EndComp
Text Label 9150 5700 2    50   ~ 0
BUTTON_PB7
Text Notes 8700 5450 0    50   ~ 0
Pull-up is uC internal 56k pullup
Wire Wire Line
	9200 5700 9150 5700
Wire Wire Line
	9150 5800 9150 5700
Connection ~ 9150 5700
Wire Wire Line
	9150 5700 8750 5700
Wire Wire Line
	9150 6100 9150 6250
Wire Wire Line
	9550 6150 9550 6250
Wire Wire Line
	9550 5750 9550 5700
Wire Wire Line
	9550 5700 9500 5700
Wire Wire Line
	5400 5450 6150 5450
Wire Wire Line
	5400 5650 6150 5650
Wire Wire Line
	5400 5750 6150 5750
Text Label 5500 5450 0    50   ~ 0
BUTTON_PB0
Text Label 5500 5650 0    50   ~ 0
BUTTON_PB2
Text Label 5500 5750 0    50   ~ 0
BUTTON_PB3
Text Label 5500 5950 0    50   ~ 0
BUTTON_PB5
Text Label 5500 6150 0    50   ~ 0
BUTTON_PB7
$EndSCHEMATC
