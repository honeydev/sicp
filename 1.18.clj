(require '[clojure.test :refer :all])

(defn doub [n] (* n 2))
(defn half [n] (/ n 2))

(defn *-iter [a b c]
    (cond (= b 0)
        c
        (even? b) (*-iter (doub a) (half b) c)
        :else (*-iter a (- b 1) (+ a c))))

(deftest test-iter-expt
    (is (= 15 (*-iter 5 3 0)))
    (is (= 56 (*-iter 7 8 0)))
    (is (= 174372 (*-iter 1321 132 0))))

(run-tests)
