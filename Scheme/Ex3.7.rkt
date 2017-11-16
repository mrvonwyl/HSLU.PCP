;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Ex3.7) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define my-phone-dir (list (list 'Adam 4711) (list 'Eva 4712)))

(define (look-at phone-dir name)
  (cond
    [(empty? phone-dir)
      (print #f)]
    [(symbol=? (first (first phone-dir)) name)
      (print (first (rest (first phone-dir))))]
    [else (look-at (rest phone-dir) name)]
  )
)

(define (add-entry name number)
  (set! my-phone-dir (cons (list name number) my-phone-dir))
)

(look-at my-phone-dir 'Adam)
(newline)
(look-at my-phone-dir 'God)
(newline)
(add-entry 'God 6666)
(look-at my-phone-dir 'God)