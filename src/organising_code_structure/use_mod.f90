! Fortran modules contain definitions that are made accessible to programs,
! procedures, and other modules through the use statement.  They can contain
! data objects, type definitions, procedures, and interfaces.
!
! - Modules allow controlled scoping extension whereby entity access is made
!   explicit
!
! - Modules automatically generate explicit interfaces required for modern
!   procedures
!
! It is recommended to always place functions and subroutines within modules.
!
! Each module should be written in a separate .f90 source file. Modules need to
! be compiled prior to any program units that use them.

module my_mod
  use iso_fortran_env
  implicit none

  private ! All entities are now module-private by default
  public public_var, print_matrix ! Explicitly export public entities

  real(real64), parameter :: public_var = 2
  integer(int32) :: private_var

contains

  ! Print matrix to stdout
  subroutine print_matrix(A)
    real(real64), intent(in) :: A(:,:) ! An assumed-shape dummy argument

    integer(int32) :: i

    do i = 1, size(A,1)
       print *, A(i,:)
    end do
  end subroutine print_matrix

  ! Compare this print_matrix subroutine with that written outside of a
  ! module. We no longer have to explicitly pass the matrix dimensions and can
  ! instead take advantage of assumed-shape arguments since the module will
  ! generate the required explicit interface for us. This results in a much
  ! simpler subroutine interface.

end module my_mod


program use_mod
  use iso_fortran_env
  ! use my_mod
  ! or
  use my_mod, only: public_var
  use my_mod, only: printMat=>print_matrix
  implicit none

  real(real64) :: mat(10, 10)


  mat(:,:) = public_var

  call printMat(mat)

end program use_mod
