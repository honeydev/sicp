(defn repeated [f n]
    (fn [x]
        (defn iter [acc counter]
            (if (= counter 0)
                acc
                (iter (f acc) (- counter 1))))
        (iter x n)))
(defn square [x] (* x x))
(defn smooth [f]
    (def dx 0.001)
    (fn [x] (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(print ((smooth square) 3) "\n")
(print ((repeated square 3) 10))
