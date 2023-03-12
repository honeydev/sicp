(defn close-enough? [neg-point pos-point]
    (< (Math/abs (- neg-point pos-point)) 0.0001))

(defn cont-fract-recursive [n] 
    (defn cont-fract [n d k]
        (defn rec [i]
            (/ (n i) (+ (d i) 
                (if (< i k)
                    (rec (+ i 1))
                    i))))
        (rec 1.0))
    (cont-fract 
        (fn [i] 1.0)
        (fn [i] (if (= (rem i 3) 2)
            (* 2 (/ (+ i 1) 3))
            1)) n))


(print (cont-fract-recursive 20) "\n")