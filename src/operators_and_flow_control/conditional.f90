! Conditional (if)

! Relational operators
! == (.eq.):  Tests for equality of two operands
! /= (.ne.): Test for inequality of two operands
! >  (.gt.): Tests if left operand is strictly greater than right operand
! <  (.lt.): Tests if left operand is strictly less than right operand
! >= (.ge.): Tests if left operand is greater than or equal to right operand
! <= (.le.): Tests if left operand is less than or equal to right operand

! Logical operators
! .and.  TRUE if both left and right operands are TRUE
! .or.   TRUE if either left or right or both operands are TRUE
! .not.  TRUE if right operand is FALSE
! .eqv.  TRUE if left operand has same logical value as right operand
! .neqv. TRUE if left operand has the opposite logical value as right operand

program conditional
   use iso_fortran_env
   implicit none

   real(real64) :: angle
   integer(int32) :: i, j

   ! Conditional construct (if)
   angle = 92.0_real64
   if (angle < 90.0) then
      print *, "Angle is acute"
   else if (angle < 180.0) then
      print *, "Angle is obtuse"
   else
      print *, "Angle is reflex"
   end if

   print *, ""
   print *, "simple loop:"

   ! Loop constructs (do)
   !   When we define the start of the do loop, we use our counter variable name
   !   followed by an equals (=) sign to specify the start value and final value
   !   of our counting variable.
   do i = 1, 10
      print *, i
   end do

   print *, ""
   print *, "skipping values:"

   ! do loop with skip
   do i = 1, 10, 2
      print *, i
   end do

   print *, ""
   print *, "do-while loops:"

   ! while loop
   !    A condition may be added to a do loop with the while keyword. The loop
   !    will be executed while the condition given in while() evaluates to
   !    .true..
   i = 1
   do while (i < 10)
      print *, i
      i = i + 1
   end do
   ! Here i = 11

   print *, ""
   print *, "Printing only ten numbers out of first 100:"

   ! Loop control statements (exit and cycle)
   ! 1. `exit` is used to quit the loop prematurely. It is usually enclosed
   !    inside an `if`.
   do i = 1, 100
      if (i > 10) then
         exit ! Stop printing numbers
      end if
      print *, i
   end do
   ! Here i = 11

   print *, ""
   print *, "Printing Even Numbers:"

   ! 2. `cycle` skips whatever is left of the loop and goes into the next cycle.
   do i = 1, 10
      if (mod(i, 2) == 0) then
         cycle ! Don't print even numbers
      end if
      print *, i
   end do

   ! NOTE: When used within nested loops, the cycle and exit statements operate
   !       on the innermost loop.

   ! Nested loop tags
   ! Fortran allows the programmer to tag or name each loop. If loops are
   ! tagged, there are two potential benefits:
   ! 1. The readability of the code may be improved (when the naming is
   ! meaningful).
   ! 2. exit and cycle may be used with tags, which allows for very fine-grained
   ! control of the loops.

   outer_loop: do i = 1, 10
      inner_loop: do j = 1, 10
         if ((j + i) > 10) then ! Print only pairs of i and j that add up to 10
            cycle outer_loop ! Go to the next iteration of the outer loop
         end if
         print *, "I=", i, " J=", j, " Sum=", j + i
      end do inner_loop
   end do outer_loop
end program conditional
