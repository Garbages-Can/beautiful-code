(define map
    (lambda (proc iter)
      (if (null? iter)
          '()
          (cons (proc (car iter)) (map proc (cdr iter))))))

(display (map (lambda (x) (* x x)) '(1 2 3)))
(newline)

;;; => (1 4 9)

(let ((words '("People" "Daily" "Online" "focuses" "on" "China" "news")))
  (display (map string-length words))
  (newline))
;;; => (6 5 6 7 2 5 4)
