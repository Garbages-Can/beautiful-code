;;;        双端队列
;;;
;;; 双端队列
;;; 为了提高效率,队列保存两个重要元素
;;;   - 头指针
;;;   - 尾指针
;;; 时间复杂度O(1)

; constructor
(define (make-deque) (cons '() '()))


; pointer selector
(define (front-ptr deque) (car deque))

(define (rear-ptr deque) (cdr deque))


; pointer setter
(define (set-front-ptr! deque item) (set-car! deque item))

(define (set-rear-ptr! deque item) (set-cdr! deque item))


; predicate
(define (empty-deque? deque) (null? (front-ptr deque)))


; deque selector
(define (front-deque deque) (car (front-ptr deque)))

(define (rear-deque deque) (car (rear-ptr deque)))


; deque setter
(define (front-insert-deque! deque item)
  (cond ((empty-deque? deque)
	     (rear-insert-deque! deque item))
	    (else
		  (set-front-ptr! deque (cons item (front-ptr deque)))
          deque)))

(define (rear-insert-deque! deque item)
  (let ((new-pair (cons item '())))
    (cond ((empty-deque? deque)
	       (set-front-ptr! deque new-pair)
		   (set-rear-ptr! deque new-pair)
		   deque)
	      (else
		    (set-cdr! (rear-ptr deque) new-pair)
            (set-rear-ptr! deque new-pair)
            deque))))

(define (front-delete-deque! deque)
  (cond ((empty-deque? deque)
         (error "DELETE! called with an empty deque" deque))
        (else
          (set-front-ptr! deque (cdr (front-ptr deque)))
          deque)))

(define (rear-delete-deque! deque)
  (define (iter deque lst)
    (cond ((null? (cddr lst))
           (set-car! lst '())
           (set-rear-ptr! deque lst)
           deque)
          (else
            (iter deque (cdr lst)))))
  (cond ((empty-deque? deque)
           (error "DELETE! called with an empty deque" deque))
        ((null? (cdr (front-ptr deque)))
         (set-front-ptr! deque '())
         deque)
        (else
          (iter deque (front-ptr deque)))))


(define (print-deque deque)
  (car deque))



;;; for test
;(define q (make-deque))
;(write (print-deque (rear-insert-deque! q 'z)))(newline)
; ==> (z)
;(write (print-deque (front-insert-deque! q 'a)))(newline)
; ==> (a z)
