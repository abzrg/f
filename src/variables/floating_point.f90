! precision of floating point numbers

! The desired floating-point precision can be explicitly declared using a "kind"
! parameter. The "iso_fortran_env" intrinsic module provides kind parameters for
! the common 32-bit and 64-bit floating-point types.

program floating_point
   ! Explicit real kind
   use, intrinsic :: iso_fortran_env, only: sp=>real32, dp=>real64

   ! ! C-interoperable kind
   ! use, intrinsic :: iso_c_binding, only: sp=>c_float, dp=>c_double

   implicit none

   real(sp) :: float32
   real(dp) :: float64

   ! Always use a kind suffix for floating-point literal constants.
   float32 = 1.0_sp  ! Explicit suffix for literal constants
   float64 = 1.0_dp
end program float_point
