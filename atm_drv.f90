program atm_drv

    use types, only: blob
    use ipd,   only: ipd_run

    implicit none

    type(blob), target :: test

    test%name = "something"

    call ipd_run(test)

end program atm_drv
