module types

    use, intrinsic :: iso_c_binding

    implicit none

    private

    type, public, bind(c) :: blob
            character(len=32) :: name
    end type blob
end module types
