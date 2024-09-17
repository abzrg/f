program read_value
   use iso_fortran_env
   implicit none
   integer(int8) :: age

   ! Using 'read' statement to read user input from stdin
   print *, 'Please enter your age: '
   read(*,*) age

   print *, 'In ten years, your age will be ', age + 10
end program read_value
