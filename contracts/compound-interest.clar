;; Clarity contract for calculating compound interest

;; A = P(1 + r / n)^(nt)
;; A = accrued amount after n years (principal + interest)

;; P = principal amount (the initial amount you borrow or deposit)
(define-data-var initial-investment uint u1000)

;; r = annual rate of interest (as a decimal)
(define-data-var rate-numerator uint u40)
(define-data-var rate-denominator uint u100)

;; t = number of years the amount is deposited or borrowed for.
(define-data-var time uint u4)

;; n = number of times the interest is compounded per year 
(define-data-var number-compounded uint u4)

(define-public (update-initial-investment (updated-initial-investment uint))
    (ok (var-set initial-investment updated-initial-investment))
)

(define-public (update-rate-numerator (updated-rate-numerator uint))
    (ok (var-set rate-numerator updated-rate-numerator))
)

(define-public (update-rate-denominator (updated-rate-denominator uint))
    (ok (var-set rate-denominator updated-rate-denominator))
)

(define-public (update-time (updated-time uint))
    (ok (var-set time updated-time))
)

(define-public (update-number-compounded (updated-number-compounded uint))
    (ok (var-set number-compounded updated-number-compounded))
)

(define-public (get-accrued-amount)
    (ok 
        (*
            (var-get initial-investment)
            (pow
                (+ 
                    u1
                    (/
                        (/ 
                            (var-get rate-numerator) 
                            (var-get rate-denominator)
                        )
                        (var-get number-compounded)
                    )
                )
                (*
                    (var-get number-compounded)
                    (var-get time)
                )
            )
        )
    )
)

(define-read-only (get-initial-investment)
    (ok (var-get initial-investment))
)

(define-read-only (get-rate-numerator)
    (ok (var-get rate-numerator))
)

(define-read-only (get-rate-denominator)
    (ok (var-get rate-denominator))
)

(define-read-only (get-time)
    (ok (var-get time))
)

(define-read-only (get-number-compounded)
    (ok (var-get number-compounded))
)