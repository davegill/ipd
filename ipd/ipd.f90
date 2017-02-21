module ipd
    use, intrinsic :: iso_c_binding,                                    &
                      only: c_char, c_ptr, c_int32_t, c_int64_t, c_loc, &
                            c_null_char, c_null_ptr, c_f_pointer, c_ptr

    use            :: types,                                            &
                      only: blob

    implicit none
    private
    public :: ipd_run

    interface

        integer(c_int32_t)                                              &
        function ipd_fcall_c                                            &
                   (scheme, kitchen_sink)                               &
                   bind(c, name='ipd_fcall')
            import :: c_char, c_int32_t, c_ptr
            character(kind=c_char), dimension(*)  :: scheme
            type(c_ptr)                           :: kitchen_sink
        end function ipd_fcall_c
    end interface

    contains

    subroutine ipd_run(kitchen_sink)

        use, intrinsic :: iso_c_binding
        use            :: types

        type(blob), intent(inout) :: kitchen_sink
        integer                   :: ierr
        character(len=32)         :: scheme

        ierr = 0

        scheme = "GF"
        ierr = ipd_fcall_c(trim(scheme)//c_null_char, c_loc(kitchen_sink))
        if (ierr /= 0) then
            print *, 'Bork, bork, bork'
        end if

    end subroutine ipd_run

end module ipd
