;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Ex2.6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define rect-calc-list 
  (list (lambda (a b) (* a b)) (lambda (a b) (* 2 a b))))

(define (calc-a-list flist a b)
  (cond
    [(empty? flist) "finished"]
    [else
      (begin
        (write ((first flist) a b))
        (newline)
        (calc-a-list (rest flist) a b)
      )
    ]
  )
)

;   (map (lambda (f) (f a b)) flist)


(calc-a-list rect-calc-list 2 3)
