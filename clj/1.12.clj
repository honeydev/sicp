
(defn triangle [a, b]
    (if (or (= a 1) (= b 1))
        1
        (+ (triangle (- a 1) b) (triangle a (- b 1)))))

(print (triangle 4 3))
