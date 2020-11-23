.data

buffer: .space 60
buffer1: .space 60
buffer2: .space 60

firstpart:  .asciiz "\n  _       _         ._"
secondpart: .asciiz "\n / \    /  \ _____  | |   ____    ___   _____    ____   "
thirdpart:  .asciiz "\n \  \/\/   //  __ \ | | _/ ___\  / _ \ /     \ _/ __ \  "
fourthpart: .asciiz "\n  \       / \  ___/ | |_\  \___ ( <_> )  YY   \   ___/  "
fifthpart:  .asciiz "\n   \_/\  /   \____  >___/\_____  >____/|__|_| /\____  >  "
sixthpart:  .asciiz "\n       \/         \/           \/           \/      \/   \n"
seventhpart: .asciiz "\n          Bookstore Application version 1.0 \n"




m1: .asciiz "Main Menu: \n 1.Genre  \n 2.Loan \n 3.Buy a Book \n 4.Order a Book \n 5.Calculator  \n 6.Receipt  \n 7.Exit "
m2: .asciiz "\n Menu 1. Genre: "
m3: .asciiz "\n Menu 2. Loan: "
m4: .asciiz "\n Menu 3. Buy a Book: "
m5: .asciiz "\n Menu 4. Order a Book: "
m6: .asciiz "\n Menu 5. Calculator: "
m7: .asciiz "\n Menu 6. Receipt: "
m8: .asciiz "\n Have a wonderful day :D "
res: .asciiz "\n Your final result is: "
start: .asciiz "\n Enter a number to enter the menu option"
input2: .asciiz "\n Please choose genre: "


genres: .asciiz "These Genres are available: \n 1. Action & Adventure \n 2. Animated  \n 3. Bibliography  \n 4. Children "
backm:  .asciiz " \n To go back to main menu press 1 to stay -1"
loanrat: .asciiz "\n The loan rates are: \n 5$ for a Month and \n 20$ for period of 6 months "
buybook:  .asciiz "\n The prices per book according to genre: \n 1. Action & Adventure - 20$ \n 2. Animated -25$ \n 3. Bibliography -15$ \n 4. Children -10$ "
bookord:  .asciiz "\n Please write the name of the book you would like to order or loan : "
book1:    .asciiz "\n The Book that will be ordered is: \n"

price:    .asciiz "\n Enter the cost of the book: "
buy:      .asciiz "\n Enter the name of the book bought: "
tax:      .asciiz "\n Enter the amount of tax: "
discount: .asciiz "\n Enter discount:"

total:    .asciiz "\n Total is: \n dollars"
details:  .asciiz "\n Details are below: "


.text




main: 

 #PRINTING THE WELCOME MESSAGE

  li $v0, 4
  la $a0, firstpart
  syscall

  li $v0, 4
  la $a0, secondpart
  syscall

  li $v0, 4
  la $a0, thirdpart
  syscall

  li $v0, 4
  la $a0, fourthpart
  syscall

  li $v0, 4
  la $a0, fifthpart
  syscall

  li $v0, 4
  la $a0, sixthpart
  syscall

  li $v0, 4
  la $a0, seventhpart
  syscall


 #PRINTING THE MENU OPTIONS 


start1: 
li $v0, 4
  la $a0, m1
  syscall

    li $v0, 4 
    la $a0, start
    syscall

    li $v0, 5
    syscall
   
    move $t0, $v0

    beq $t0, 1, menu1
    beq $t0, 2, menu2
    beq $t0, 3, menu3
    beq $t0, 4, menu4
    beq $t0, 5, menu5
    beq $t0, 6, menu6
    beq $t0, 7, menu7
    
   #START OF THE MENUS OPTIONS

menu1:

#LOOP

   li $a1, 0 
   li $t0, 4

   li $v0, 4
   la $a0, m2
   syscall

one: 

    li $v0, 4
    la $a0, genres
    syscall

    li $v0, 4
    la $a0, backm
    syscall

    li $v0, 5
    syscall

#ASKING IF TO CONTINUE OR TO GO TO ANOTHER MENU ITEM

    beq $v0, 1 start1
    beq $v0, -1 menu1

    bltu $t0, 4 loop
    b next,
    #bgtz $t0, loop




menu2:

   li $a1, 0 
   li $t0, 4

   li $v0, 4
   la $a0, m3
   syscall

two: 

    li $v0, 4
    la $a0, loanrat
    syscall

    li $v0, 4
    la $a0, backm
    syscall

    li $v0, 5
    syscall

    beq $v0, 1 start1
    beq $v0, -1 menu2

    bltu $t0, 4 loop
    b next,
    #bgtz $t0, loop


menu3:

   li $a1, 0 
   li $t0, 4

   li $v0, 4
   la $a0, m4
   syscall

three: 
   
    li $v0, 4
    la $a0, buybook
    syscall

    li $v0, 4
    la $a0, backm
    syscall

    li $v0, 5
    syscall

    beq $v0, 1 start1
    beq $v0, -1 menu3

    bltu $t0, 4 loop
    b next,
    #bgtz $t0, loop


menu4:
   li $a1, 0 
   li $t0, 4

   li $v0, 4
   la $a0, m5
   syscall


four: 

    li $v0, 4
    la $a0, bookord
    syscall
    
    li $v0,8            # READ THE STRING
    la $a0, buffer
    li $a1, 60
    syscall 

    li $v0, 4
    la $a0, book1
    syscall

    li $v0, 4
    la $a0, buffer
    syscall 

    beq $v0, 1 start1
    beq $v0, -1 menu4

    bltu $t0, 4 loop
    b next,
    #bgtz $t0, loop


menu5: 

   li $a1, 0 
   li $t0, 4

   li $v0, 4
   la $a0, m5
   syscall

five:  
   
    li $v0, 4
    la $a0, buy
    syscall

    li $v0,8            # READ THE STRING
    la $a0, buffer1
    li $a1, 60
    syscall 

    li $v0, 4
    la $a0, price
    syscall

    li $v0, 5			#read the integer 
    syscall
    move $s1, $v0

    li $v0, 4
    la $a0, tax
    syscall

    li $v0, 5			#read the integer 
    syscall
    move $s2, $v0

    li $v0, 4
    la $a0, discount
    syscall

    li $v0, 5			#read the integer 
    syscall
    move $s3, $v0

    mult $s1, $s2
    mflo $v1
    sub $s4, $v1, $s3

    li $v0, 4
    la $a0, book1
    syscall


    li $v0, 4
    la $a0, buffer1
    syscall 

    li $v0, 4
    la $a0, total
    syscall

    li $v0, 1
    move $a0, $s4
    syscall

    li $v0, 4
    la $a0, backm
    syscall

    li $v0, 5
    syscall

    beq $v0, 1 start1
    beq $v0, -1 menu5

    bltu $t0, 4 loop
    b next,
    #bgtz $t0, loop

menu6: 

   li $a1, 0 
   li $t0, 4

   li $v0, 4
   la $a0, m7
   syscall

six:  
   
    li $v0, 4
    la $a0, details
    syscall
       
    li $v0, 4
    la $a0, book1
    syscall

    li $v0, 4
    la $a0, buffer
    syscall 

    li $v0, 4
    la $a0, backm
    syscall

    li $v0, 5
    syscall

    beq $v0, 1 start1
    beq $v0, -1 menu5

    bltu $t0, 4 loop
    b next,
    #bgtz $t0, loop

menu7: 

   li $a1, 0 
   li $t0, 4

   li $v0, 4
   la $a0, m8
   syscall

exit:
    li      $v0, 10              # terminate program run and
    syscall                      # exit
   
  
