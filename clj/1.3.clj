(require '[clojure.test :refer :all])

(defn sum-of-squares [a, b] (+ (Math/pow a 2) (Math/pow b 2)))
(defn sos-two-big-nums [a, b, c] 
  (cond 
    (and (> a c) (> b c)) (sum-of-squares a b)
    (and (> a b) (> c b)) (sum-of-squares a c)
    :else (sum-of-squares b c)))

(deftest test-sum-of-squares
  (is (= (sos-two-big-nums 2, 3, 4) 25.0))
  (is (= (sos-two-big-nums 14 6 3)) 232.0)
  )

(run-tests)