(defn close-enough? [neg-point pos-point]
    (< (Math/abs (- neg-point pos-point)) 0.0001))

(defn cont-fract-recursive [n] 
    (defn cont-fract [n d k]
        (defn rec [i]
            ; (print i)
            (/ (n i) (+ (d i) 
                (if (< i k)
                    (rec (+ i 1))
                    i))))
        (/ 1 (rec 1.0)))
    (cont-fract (fn [i] 1.0) (fn [i] 1.0) n))


(defn cont-fract-iter [i]
    (defn cont-fract [n d k]
        (defn iter [acc i]
            (if (= i k)
                acc
                (iter (/ (n i) (+ acc (d i))) (+ i 1))))
        (/ 1 (iter 1 1)))
    (cont-fract (fn [i] 1.0) (fn [i] 1.0) i))


 (defn check-iteration-count [cont-fract-method]
    (def golden-ratio-required-accuracy-value (float 1.6180))

    (defn iter [n]
        (let [fract-result  (Float/parseFloat (format "%.4f" (cont-fract-method n)))]
            (if (= golden-ratio-required-accuracy-value fract-result)
                n
                (iter (+ n 1)))))
    (iter 1))

(print (check-iteration-count cont-fract-recursive) "\n") ; 12

(print (cont-fract-recursive 12) "\n") ; 1.6179867986798682
(print (cont-fract-iter 12)) ; 1.6180555555555558