
(require '[clojure.test :refer :all])

(defn average [x, y] (float (/ (+ x y) 2)))
(defn good-enough? [previous, guess]
  (< (Math/abs (float (/ (- previous guess) guess))) 0.001))
  
(defn improve-sqrt [previous-guess guess x]
    (if (good-enough? previous-guess guess)
        (float guess)
        (improve-sqrt guess (average (/ x guess) x) x)))

(deftest test-improve-sqrt
  (is (= (int (Math/floor (improve-sqrt 0.5 1 2))) 1))
  (is (= (int (Math/floor (improve-sqrt 0.5 1 4))) 2)))

(run-tests)
