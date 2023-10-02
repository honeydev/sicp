(require '[clojure.test :refer :all])

(defn doub [n] (* n 2))
(defn half [n] (/ n 2))

(defn *-log [a b]
    (cond (= b 0)
        0
        (even? b) (doub (*-log a (half b)))
        :else (+ a (*-log a (- b 1)))))

(deftest test-iter-expt
    (is (= 15 (*-log 5 3)))
    (is (= 56 (*-log 7 8)))
    (is (= 174372 (*-log 1321 132))))

(run-tests)
