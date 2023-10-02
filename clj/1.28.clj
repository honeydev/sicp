(require '[clojure.test :refer :all])

(defn square [n] (* n n))

; мое не рабочее решение

(defn is-equal-on-module? [a mod]
    ; (print "a" a "mod" mod "rems" (rem a mod) "\n")
    (= (rem a mod) 1))

(defn square-and-check [value n]
    ; (print value n "\n")
    (cond (and (not= value 1) (not= value (- n 1)) (is-equal-on-module? (square value) n))
        0
        :else (rem (square value) n)))

(defn expmod [base exp m]
    (cond (= exp 0)
        1
        (even? exp) (square-and-check (expmod base (/ exp 2) m) m)
        :else
            (* base (expmod base (- exp 1) m))))

(defn r-test [n]
    (defn iter [num exp mod counter]
        (print num exp mod "counter" counter "\n")
        (cond (= num mod) counter
            (= 0 (expmod num exp mod)) (iter (+ 1 num) exp mod (+ 1 counter))
            :else (iter (+ 1 num) exp mod counter)))
    (> (iter 2 (- n 2) n 0) (/ n 2)))

(print (r-test 7) "\n")


; Решение на основе http://sicp.sergeykhenkin.com/2007/10/15/sicp-exercise-solution-1-28/

(defn apply-trivial-check [k m r]
    (if (and
        (not= k 1)
        (not= k (- m 1))
        (= r 1))
    0
    r))

(defn remainder-or-trivial [k m]
    (apply-trivial-check k m (rem (square k) m)))

(defn expmod [base exp m]
    (cond (= exp 0) 1
            (even? exp)
                (remainder-or-trivial (expmod base (/ exp 2) m) m)
            :else
                (rem (* base (expmod base (- exp 1) m)) m)))


(defn test-f [n]
    (defn test-iter [a t n]
        (defn try-it [a]
            (= (expmod a (- n 1) n) 1))
        ; (print (try-it a))
        (if (= a n)
            (> t (/ n 2))
            (if (= a n)
                (> t (/ n 2))
                (if (try-it a)
                    (test-iter (+ a 1) (+ t 1) n)
                    (test-iter (+ a 1) t n)))))

    (test-iter 1 0 n))

(print (test-f 10) "\n")
