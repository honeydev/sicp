
(defn square [n] (* n n))

(defn rand-range [a b]
    (+ a (rand-int (- b a))))

(defn expmod [base exp m]
    (cond (= exp 0) 1
            (even? exp)
                (rem (square (expmod base (/ exp 2) m)) m)
            :else
                (rem (* base (expmod base (- exp 1) m)) m)))


(defn ferma-test [n] 
    (defn try-it [a]
        (= (expmod a n n) a))
    (try-it (rand-range 1 n)))


(defn is-prime? [n]
    (defn prime-iter [n times]
        (cond (= times 0) true
            (ferma-test n) (prime-iter n (- times 1))
            :else false))
    (prime-iter n 5))

(defn search-primes [a b]
    (filter (fn [n] (and (is-prime? n) (not (even? n)))) (range a (+ b 1))))

(def start (System/currentTimeMillis))

(print start "\n")
(print (count (search-primes 3 10000)) "\n")
(print (- (System/currentTimeMillis) start) "\n")
