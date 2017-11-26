#!/usr/bin/env scheme --script

;;; 邻接矩阵实现图

(define infinity 9999999)


; constructor
(define (make-graphics size)
  (make-vector size (make-vector size infinity)))


; setter and getter
(define (get-graphics graph row col)
  (vector-ref (vector-ref graph row) col))

(define (set-graphics! graph row col value)
  (vector-set! (vector-ref graph row) col value))


; initial
(define (init-graphics graph)
  (let ((row 0) (col 0))
    (if (and (< row (length graph))
             (< col (length graph)))
      (set-graphics! graph row col 0))))

;;; for test
(define graph (make-graphics 3))
(init-graphics graph)
(set-graphics! graph 1 2 0)
(write (get-graphics graph 1 2))(newline)
(write graph)(newline)
