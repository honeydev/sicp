(require '[clojure.test :refer :all])

(defn f-recursive [n]
    (if (<= n 3)
        n
        (+ 
            (f-recursive (- n 1))
            (f-recursive (- n 2))
            (f-recursive (- n 3)))))

(defn f-iter [n]
    (defn f-iter [counter a b c]
        (if (< counter 0)
            a
            (f-iter (- counter 1) (+ a b c) a b)))
    (f-iter n 1 0 -1))

(deftest test-recursive
    (is (= 3 (f_recursive 3)))
    (is (= 11 (f_recursive 3)))
    (is (= 20 (f_recursive 6))))

(run-tests)
