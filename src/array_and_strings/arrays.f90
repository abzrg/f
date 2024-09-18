! Arrays are multidimensional variables that contain more than one value where
! each value is accessed using one or more indices.

! Arrays in Fortran are one-based by default; this means that the first element
! along any dimension is at index 1.

! We can declare arrays of any type. There are two common notations for
! declaring array variables: using the dimension attribute or by appending the
! array dimensions in parentheses to the variable name.

program arrays
    implicit none

    ! 1D integer array
    integer, dimension(10) :: array1

    ! An equivalent array declaration
    integer :: array2(10)

    ! 2D real array
    real, dimension(10, 10) :: array3

    ! Custom lower and upper index bounds
    real :: array4(0:9)
    real :: array5(-5:5)
end program arrays

! vim: tw=80
