! Functions

! It is good programming practice for functions not to
! modify their arguments—that is, all function arguments
! should be intent(in). Such functions are known as pure
! functions. Use subroutines if your procedure needs to
! modify its arguments.

! L2 norm of a vector
function vector_norm(n,vec) result(norm)
  use iso_fortran_env
  implicit none

  integer(int32), intent(in) :: n
  real(real64), intent(in) :: vec(n)
  real(real64) :: norm

  norm = sqrt(sum(vec**2))
end function vector_norm

! NOTE: in production code, the intrinsic function `norm2`
! should be used.

program run_fcn
  use iso_fortran_env
  implicit none

  real(real64) :: v(9)
  real(real64) :: vector_norm

  v(:) = 9

  print *, "Vector norm = ", vector_norm(9,v)
end program run_fcn
