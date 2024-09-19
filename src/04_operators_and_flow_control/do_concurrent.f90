! Parallelizable loop (do concurrent)

! The `do concurrent` loop is used to explicitly specify that the inside of
! the loop has no interdependencies; this informs the compiler that it may
! use parallelization/SIMD to speed up execution of the loop and conveys
! programmer intention more clearly. More specifically, this means that any
! given loop iteration does not depend on the prior execution of other loop
! iterations. It is also necessary that any state changes that may occur must
! only happen within each do concurrent loop. These requirements place
! restrictions on what can be placed within the loop body.

! Simply replacing a do loop with a do concurrent does not guarantee parallel
! execution. The explanation given above does not detail all the requirements
! that need to be met in order to write a correct do concurrent loop.
! Compilers are also free to do as they see fit, meaning they may not
! optimize the loop (e.g., a small number of iterations doing a simple
! calculation, like the below example). In general, compiler flags are
! required to activate possible parallelization for do concurrent loops.

program do_concurrent
   use iso_fortran_env
   implicit none

   ! real(real64), parameter :: pi = 3.14159265
   real(real64), parameter :: pi = 4 * atan(1.0_real64)
   integer(int32), parameter :: n = 10
   real(real64) :: result_sin(n)
   integer(int32) :: i

   do concurrent (i = 1:n) ! Careful, the syntax is slightly different
      result_sin(i) = sin(i * pi/4.0)
   end do

   do i = 1, n
      print *, "result[", i, "] = ", result_sin(i)
   end do
end program do_concurrent
