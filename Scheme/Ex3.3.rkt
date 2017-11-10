;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Ex3.3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define a 42)

(let ((a 1)
      (b (+ a 1)))
  b)

(let* ((a 1)
       (b (+ a 1)))
  b)

; Ex a
; Ausgabe: 43 2

; Ex b
; 1. let speicher die Ausdrücke quasi von innen nach aussen aus zwischen, deshalb wird für (+ a 1) auch (define a 42) benötigt.
; 2. let* wertet alle Ausdrücke von links nach rechts aus. Deshalb wird zuerst a auf 1 gesetzt und dann b auf a + 1