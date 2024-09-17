! Local scope variables with block construct

! The 2008 Fortran standard introduced the notion of block which enables using
! local scope variables within a program or procedure.

module your_module
   implicit none
   integer :: n = 2
end module your_module


program block_construct
   use iso_fortran_env
   implicit none
   real :: x

   block
      use your_module, only: n  ! You can import modules within blocks
      real :: y  ! Local scope variable
      y = 2.0
      x = y ** n
      print *, y
   end block

   ! print *, y ! Error, y is out of scope (only available in the block's scope)
   print *, x
end program block_construct

! vim: tw=80
