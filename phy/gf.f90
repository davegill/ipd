module gf

    use, intrinsic :: iso_c_binding

    use            :: types,                                            &
                       only: blob
    implicit none

    private
    public :: gf_cap

    contains

    subroutine gf_cap(ptr) bind(c)
        implicit none
        type(c_ptr), intent(inout) :: ptr

        type(blob), pointer :: sink

        call c_f_pointer(ptr, sink)

        print *, 'GF Cap with blob name: ', sink%name

    end subroutine gf_cap

end module gf
