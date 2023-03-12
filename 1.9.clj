; pseudocode

(def (+ a b)
    (if (= a 0)
    b
(inc (+ (dec a) b))))


(def (+ a b)
    (if (= a 0)
    b
    (+ (dec a) (inc b))))

