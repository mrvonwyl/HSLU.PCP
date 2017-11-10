;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Ex3.4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define x 1)
(define y 5)

((lambda (x y) (+ (* 2 x) y)) y x)
((lambda (a b) (+ (* 2 x) y)) y x)

; Ex a
; 11, 7

; Ex b
; 1. hier werden bei der Übergabe x und y vertauscht deshab resultiert die funktion in 11 (5 * 2 + 1)
; 2. weil die Formalen Parameter a und b heissem, greift Expression auf die globalen x und y zu