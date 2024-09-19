! Fortran has two forms of procedure:
! 1. Subroutine: invoked by a 'call' statement
! 2. Function: invoked within an expression or assignment to which it returns a
! value

! Both subroutines and functions have access to variables in the parent scope by
! argument association; unless the `value` attribute is ! specified, this is
! similar to call by reference.

! 1. Subroutine
!
! The subroutine input arguments, known as dummy arguments, are specified in
! parentheses after the subroutine name; the dummy argument types and attributes
! are declared within the body of the subroutine just like local variables.
!
! Note the additional `intent` attribute when declaring the dummy arguments; this
! optional attribute signifies to the compiler whether the argument is
! 'read-only' (intent(in)) 'write-only' (intent(out)) or 'read-write'
! (intent(inout)) within the procedure. In this example, the subroutine does not
! modify its arguments, hence all arguments are intent(in).
!
!    It is good practice to always specify the intent attribute for dummy
!    arguments; this allows the compiler to check for unintentional errors and
!    provides self-documentation.


! Print matrix A to screen
subroutine print_matrix(n,m,A)
  use iso_fortran_env
  implicit none

  integer(int32), intent(in) :: n
  integer(int32), intent(in) :: m
  real(real64), intent(in) :: A(n, m)

  integer(int32) :: i

  do i = 1, n
     print *, A(i, 1:m)
  end do
end subroutine print_matrix


program call_sub
  implicit none

  real :: mat(10, 20)

  mat(:,:) = 0.0

  call print_matrix(10, 20, mat)
end program call_sub

! This example uses a so-called explicit-shape array argument since we
! have passed additional variables to describe the dimensions of the
! array A; this will not be necessary if we place our subroutine in a
! module as described later.
