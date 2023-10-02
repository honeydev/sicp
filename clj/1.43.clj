(defn repeated [f n]
    (fn [x]
        (defn iter [acc counter]
            (if (= counter 0)
                acc
                (iter (f acc) (- counter 1))))
        (iter x n)))

(defn square [x] (* x x))

(print ((repeated square 2) 5))
