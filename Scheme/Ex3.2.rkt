;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Ex3.2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
; Ex a


(define (fib n)
    (local
      ((define (fib_tr z a b)
          (cond ((or (= z 0) (= z 1)) b)
              (else (fib_tr (- z 1) b (+ a b)))
          )
      ))
      (fib_tr n 0 1)
    )
)

; Ex b
; Mit akkumulator ist es wedentlich schneller, da nicht immer von 0 her gerechnet wird