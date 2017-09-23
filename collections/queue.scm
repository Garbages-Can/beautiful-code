;;;        队列(FIFO)
;;; 队列(queue)是一种采用先进先出(FIFO)策略的抽象数据结构.
;;;
;;; 队列实现
;;; 为了提高效率,队列保存两个重要元素
;;;   - 头指针
;;;   - 尾指针
;;; 当入队的时候,建立新的序列,插入到队列中,尾指针向后移东
;;; 当出对的时候,头指针向后移动


; constructor
(define (make-queue) (cons '() '()))


; pointer selector
(define (front-ptr queue) (car queue))

(define (rear-ptr queue) (cdr queue))


; pointer setter
(define (set-front-ptr! queue item) (set-car! queue item))

(define (set-rear-ptr! queue item) (set-cdr! queue item))


; predicate
(define (empty-queue? queue) (null? (front-ptr queue)))


; queue selector
(define (front-queue queue)
  (if (empty-queue? queue)
	  (error "FRONT called with ans empty queue" queue)
	  (car (front-ptr queue))))


; queue setter
(define (insert-queue! queue item)
  (let ([new-pair (cons item '())])
    (cond
      [(empty-queue? queue)
       (set-front-ptr! queue new-pair)
       (set-rear-ptr! queue new-pair)
       queue]
      [else
       (set-cdr! (rear-ptr queue) new-pair)
       (set-rear-ptr! queue new-pair)
       queue])))

(define (delete-queue! queue)
  (cond
	[(empty-queue? queue)
	 (error "DELETE! called with an empty queue" queue)]
	[else
	 (set-front-ptr! queue (cdr (front-ptr queue)))
	 queue]))


(define (print-queue queue)
  (car queue))



;;; for test
;(define q (make-queue))
;(write (print-queue (insert-queue! q 'a)))(newline)
; ==> (a)
;(write (print-queue (insert-queue! q 'b)))(newline)
; ==> (a b)
;(write (print-queue (delete-queue! q)))(newline)
; ==> (b)
;(write (print-queue (delete-queue! q)))(newline)
; ==> ()
