! Fortran is "strongly typed" language: variables must have a type

! 5 built-in data types
! 1. integer   - for data that represent whole numbers, positive or negative
! 2. real      - for floating-point data (not a whole number)
! 3. complex   - pair consisting of a real part and an imaginary part
! 4. character - for text data
! 5. logical   - for data that represent boolean (true or false) values

! Variables must be 'declared' before being used.  This tells the compiler the
! variable type and any other variable attributes.

! Fortran is statically typed language: type of the variable is fixed when the
! program is compiled.

! Declaration syntax
! <variable_type> :: <variable_name>

program variables
   use iso_fortran_env
   ! This statement tells the compiler that all variables will be explicitly
   ! declared; without this statement variables will be implicitly typed
   ! according to the letter they begin with.  Implicit typing considered bad
   ! practice. Always use this statements.
   implicit none

   ! Variable names must start with a letter and can consist of letters,
   ! numbers and underscores.
   ! Fortran is case-insensitive: keep it consistent
   integer(int8)   :: amount
   real(real64)    :: pi
   complex(real64) :: frequency
   character       :: initial
   logical         :: isOkay

   ! Once we have declared a variable, we can assign and reassign values to it
   ! using the assignment operator =.

   amount = 10
   pi = 3.1415927
   frequency = (1.0, -0.5)
   initial = 'A'
   isOkay = .false.  ! or .true.

   ! Characters are surrounded by either single (') or double quotes (").

   ! Good practice: initialise your variables separately to their declaration

   ! using 'print' statement to print values to stdout
   print *, 'The value of amount (integer) is: ', amount
   print *, 'The value of pi (real) is: ', pi
   print *, 'The value of frequency (complex) is: ', frequency
   print *, 'The value of initial (character) is: ', initial
   print *, 'The value of isOkay (logical) is: ', isOkay

   ! Watch out for assignment at declaration
   integer :: count = 1
   ! This is NOT a normal initialization; it implies the 'save' attirbutes, which means that the variable retains its value between
   ! procedure calls. Good practice is to initialize your values separately to their declaration.

end program variables

! vim: ts=3 sw=3 et
