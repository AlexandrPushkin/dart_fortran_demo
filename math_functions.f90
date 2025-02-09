module math_functions

    use iso_c_binding, only : c_double, c_int
    implicit none


contains

    function add(x, y) result(result) bind(C, name="add_f")
        real(c_double), intent(in), value :: x, y
        real(c_double) :: result
        
        result = x + y
    end function add

    function sub(x, y) result(result) bind(C, name="sub_f")
        real(c_double), intent(in), value :: x, y
        real(c_double) :: result
        
        result = x - y
    end function sub

    function div(x, y) result(result) bind(C, name="div_f")
        real(c_double), intent(in), value :: x, y
        real(c_double) :: result
        
        result = x / y
    end function div 

    function mul(x, y) result(result) bind(C, name="mul_f")
        real(c_double), intent(in), value :: x, y
        real(c_double) :: result
        
        result = x * y
    end function mul      

end module math_functions