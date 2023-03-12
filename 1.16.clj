(require '[clojure.test :refer :all])

(defn iter-expt [a b n] 
  (cond (= n 0) a
    (even? n) (iter-expt a (Math/pow b 2) (/ n 2))
    :else (iter-expt (* a b) b (- n 1))))

(deftest test-iter-expt
  (is (= 1024 (Math/round (iter-expt 1 2 10))))
  (is (= 531441 (Math/round (iter-expt 1 3 12)))))

(run-tests)
