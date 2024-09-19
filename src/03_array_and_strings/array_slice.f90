! A powerful feature of the Fortran language is its built-in support for array operations; we can perform operations on all or part
! of an array using array slicing notation:

! Fortran arrays are stored in column-major order; the first index varies fastest.

program array_slice
   implicit none

   integer :: i
   ! 1D integer array of 10 elements
   integer :: array1(10)
   ! 2D integer array of 100 elements
   integer :: array2(10, 10)

   ! Array constructor
   array1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
   ! Implicit do loop constructor
   array1 = [(i, i = 1, 10)]
   ! Set all elements to zero
   array1(:) = 0
   ! Set first five elements to one
   array1(1:5) = 1
   ! Set all elements after five to one
   array1(6:) = 1

   ! Print out elements at odd indicies
   print *, array1(1:10:2)
   ! Print out the first column in a 2D array
   print *, array2(:,1)
   ! Print an array in reverse
   print *, array1(10:1:-1)
end program array_slice
