; pseudocode

(define (count-leaves x)
        (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))


(count-leaves (list 1 (list 2 (list 3 4))))

(+ (count-leaves 1) (count-leaves (list 2 (list 3 4))))
 |                          |
 |                          |
 1                   (+ (count-leaves 2) (count-leaves (list 3 4)))
                            |                         |
                            |                         |
                            1              (+ (coount-leaves 3) (count-leaves (list 4)))
                                                      |                |       
                                                      |                |         
                                                      1          (+ (count-leaves 4) (count-leaves null))
                                                                       |                       |
                                                                       |                       |
                                                                       1                       0
(+ 1 1 1 1 0)
; 4