#lang racket


(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


(define (flatmap proc seq)
  (accumulate append null (map proc seq)))


(define (permutations s)
  (if (null? s)
      (list null)
      (flatmap (lambda (x)
                 (map (lambda (p) (cons x p))
                      (permutations (remove x s))))
               s)))


(permutations (list 1 2 3))
; (permutations (list 1 2 3)
;              (flatmap
;                     (lambda (x: 1)
;                             (map -- retrun (list 1 2 3)
;                                   (lambda (x: (cons 2 3)) (cons 1 (cons 2 3)))
;                                   (permutations (list 2 3)
;                                                  (flatmap  -- return (list 2 3)
;                                                         (lambda (x: 2)  
;                                                                  (map
;                                                                      (lambda (p: 3) (cons 2 3))
;                                                                      
;                                                                      (permutations (list 3))
;                                                                          (flatmap (lambda (x: 3) -- return (list 3 )
;                                                                                 (map
;                                                                                     --! (cons 3 null) create (list 3) here !--
;                                                                                     (lambda (p: null) (list (cons 3 null)))
;                                                                                             (permutations (list null) 
;                                                                                                    (list null))))))
;                                                                               
;                                                         (list 2 3)

;                      (lambda (x: 2)
;                          (map  -- return (list (list 2 1 3) (list 2 3 1)
;                              (lamnda (p: (list 1 3)) (cons 2 (list 1 3))
;                              (permutatuons (list 1 3)
;                                  (flatmap  -- return (list 1 3)
;                                      (lambda (x: 1)
;                                        (map (lambda (p: 3) (cons 1 3))
;                                         (permutations (list 3))
;    
;                                             (flatmap (lambda (x: 3)  -- return (list 3)
;                                               (lambda (p: null) (cons 3 null)
 ;                                                    
  ;                                                      (permutatons (list null)
   ;                                                                  (list null))
    ;                                        
     ;                                   (lambda (x: 3)
      ;                                    (map
       ;                                      (lambda (p: 1) (cons 3 1))))
        ;                                     (permuatations (list 1))
          ;                                      (flatmap (lambda (x: 1)  -- return (list 1)
         ;                                          (lambda (p: null) (cons 1 null))
          ;                                            (permutations (list null)
;                                                                   (list null))))))
;
;                      (lambda (x: 3)
;                        ....                        ...
;                        return (list (list 3 1 2) (list 3 2 1)))
;                                            
;                     (list 1 2 3)))