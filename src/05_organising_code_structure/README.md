# Organizing Code Structure

## Modules

In Fortran, when you define a subroutine **outside of a module**, there is no automatic generation of an **explicit interface** for the subroutine unless you manually create one (via an `interface` block) or the caller and the subroutine are defined within the same module or contain program. This is a key distinction in Fortran's design that impacts how you can pass array arguments.

Here’s why using a **module** simplifies subroutine interfaces, particularly when dealing with arrays:

### 1. **Explicit Interface**
When you define a subroutine inside a **module**, the compiler automatically creates an **explicit interface** for the subroutine. An explicit interface provides the compiler with detailed information about the arguments' types, shapes, and properties (such as array bounds). This enables the use of **assumed-shape arrays** (arrays where the dimensions are automatically passed in).

Without a module or explicit interface, Fortran treats arrays as **assumed-size**, meaning the size must be passed manually (often via separate arguments).

#### Example Without Module:
If you define a subroutine outside of a module, the array dimensions must be explicitly passed, as the compiler has no way of knowing the shape of the array from within the subroutine:
```fortran
subroutine print_matrix(matrix, rows, cols)
    real, dimension(rows, cols) :: matrix
    integer :: rows, cols
    ! Code to print the matrix
end subroutine print_matrix
```
Here, the caller has to provide both the `rows` and `cols`, as the subroutine cannot infer the matrix dimensions without an explicit interface.

#### Example With Module:
When you define the subroutine inside a **module**, you can use **assumed-shape arrays**:
```fortran
module my_module
contains
    subroutine print_matrix(matrix)
        real, dimension(:,:) :: matrix
        ! Code to print the matrix
    end subroutine print_matrix
end module my_module
```
Here, the `matrix` argument uses assumed-shape syntax (`(:,:)`), and Fortran automatically handles the passing of the matrix dimensions via an explicit interface. The compiler knows the shape of the array when it's passed, so there's no need to manually pass the `rows` and `cols`.

### 2. **Simplified Interface**
When a subroutine has an explicit interface, it allows for **more complex argument passing** (such as assumed-shape arrays) without needing to pass the extra information explicitly. This results in a cleaner and simpler subroutine interface, as you don't need to pass things like array dimensions separately.

The module-generated interface helps the compiler:
- Check argument consistency between caller and callee.
- Use assumed-shape arrays, which automatically include information about the dimensions.
- Perform optimizations based on the array properties.

### 3. **Assumed-Shape Arrays**
With assumed-shape arrays, you only need to pass the array itself, and Fortran handles the dimensions behind the scenes. The module makes this possible because it enforces an explicit interface, allowing the subroutine to "see" the full details of the array (like its dimensions) without needing separate arguments for them.

This is why using a **module** results in a simpler subroutine interface—because you no longer need to pass all the information manually. The module generates the necessary explicit interface that allows Fortran to work with more flexible argument types like assumed-shape arrays.
