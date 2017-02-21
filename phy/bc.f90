module bc
    use, intrinsic :: iso_c_binding

    use            :: types,                                            &
                       only: blob
    implicit none

    private
    public :: bc_cap

    contains

    subroutine bc_cap(ptr) bind(c)
        implicit none
        type(c_ptr), intent(inout) :: ptr

        type(blob), pointer :: sink

        print *, 'BC Cap with blob name: ', sink%name
    end subroutine bc_cap

end module bc
