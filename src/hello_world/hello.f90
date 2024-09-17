! .f90: standard extension for Fortran source code.
!       the 90 refers to the first modern fortran standard in 1990.
! gfortran hello.f90 -o hello

program hello
   ! Never leave home without these two lines
   use iso_fortran_env
   implicit none

   print *, "hello"
   write(*,*) "world"
end program hello
