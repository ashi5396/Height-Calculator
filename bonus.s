	.data
first_out: .asciiz "\nEnter the height in feet\n"
second_out: .asciiz "\nEnter the height in inches\n"
result_meters: .asciiz "\nHeight in meters is\n"
result_centi: .asciiz "\nHeight in centimeters is\n"
meters_inch: .double 0.0254
meters_ft: .double 0.3048
centimeter_ft: .double 30.48
centimeter_inch: .double 2.54

	.text
main:
    l.d $f2, meters_ft
	l.d $f4, meters_inch
	l.d $f14, centimeter_ft
	l.d $f16, centimeter_inch
	
	li $v0, 4  #Output the first message 
	la $a0,first_out #argument string 
	syscall #print the string 
	
	li, $v0 ,7 #get the user input
	syscall
	
	mul.d $f6,$f0,$f2  
	mul.d $f18, $f0,$f14
	
	li $v0, 4  #Output the second message 
	la $a0,second_out #argument string 
	syscall #print the string
	
	li, $v0 ,7
	syscall
	
	mul.d $f8,$f0,$f4	
	mul.d $f20,$f0,$f16
	
	li $v0, 4  #Output the result in meters
	la $a0,result_meters #argument string 
	syscall #print the string
	
	li, $v0,3
	add.d $f12,$f6,$f8
	syscall
	
	li $v0, 4  #Output the result in centimeters 
	la $a0,result_centi #argument string 
	syscall #print the string
	
	li, $v0,3
	add.d $f12,$f18,$f20
	syscall
	
	li $v0,10    #exit the program
	syscall
