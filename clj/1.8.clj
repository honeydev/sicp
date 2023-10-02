(require '[clojure.test :refer :all])

(defn improve-guess [sqrt-value guess] 
    (/ (+ (/ sqrt-value (Math/pow guess 2)) (* 2 guess)) 3))

(defn good-enough? [guess prev-guess] 
    (< (Math/abs (float (- guess prev-guess))) 0.001))

(defn cube [x guess prev-guess]
    (if (good-enough? guess prev-guess)
        guess
        (cube x (improve-guess x guess) guess)))


(deftest test-improve-sqrt
    (is (= (int (Math/floor (cube 27 1 0.5))) 3))
    (is (= (int (Math/floor (cube 16 1 0.5))) 2)))

(run-tests)
