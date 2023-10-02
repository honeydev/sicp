(require '[clojure.test :refer :all])

(defn square [n] (* n n))

(defn expmod [base exp m]
    (cond (= exp 0) 1
            (even? exp)
                (rem (square (expmod base (/ exp 2) m)) m)
            :else
                (rem (* base (expmod base (- exp 1) m)) m)))

(defn check-carmicle [n]
    (defn inner [test-num]
        (cond (< test-num 2)
            true
            (not (= (expmod test-num n n) test-num)) false
            :else (inner (- test-num 1))))
    (inner (- n 1)))

(deftest test-check-carmicle
    (is (= (check-carmicle 10) false))
    (is (= (check-carmicle 561) true))
    (is (= (check-carmicle 1105) true))
    (is (= (check-carmicle 2821) true)))

(run-tests)
