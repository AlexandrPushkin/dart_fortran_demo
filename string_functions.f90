module string_functions
    use, intrinsic :: iso_c_binding
    implicit none


contains
    ! Функция для объединения строк
    subroutine concatenate_strings(str1, str2, result_str) bind(C, name="concatenate")
        character(kind=c_char), intent(in) :: str1(*), str2(*)
        character(kind=c_char), intent(out) :: result_str(*)
        integer :: i, j

        ! Копирование первой строки к результату
        i = 1
        do while (str1(i) /= c_null_char .and. i <= 100)
            result_str(i) = str1(i)
            i = i + 1
        end do

        ! Копирование второй строки к результату
        j = 1
        do while (str2(j) /= c_null_char .and. i <= 100)
            result_str(i) = str2(j)
            i = i + 1
            j = j + 1
        end do

        ! Добавление символа конца строки '\0'
        result_str(i) = c_null_char
    end subroutine concatenate_strings

end module string_functions