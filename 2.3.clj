(defn make-pair [x y]
    (fn [value-type]
        (cond (= value-type "numer") x
            (= value-type "denom") y
            :else (print "Unknown value type " value-type))))

(defn car [pair-value] (pair-value "numer"))
(defn cdr [pair-value] (pair-value "denom"))
(defn make-point [x y](make-pair x y))
(defn x-point [point] (car point))
(defn y-point [point] (cdr point))

(defn make-rectangle [a b] (make-pair a b))
(defn get-height [rectangle] (car rectangle))
(defn get-width [rectangle] (cdr rectangle))
(defn get-top-left [rectangle] (car rectangle))
(defn get-bottom-right [rectangle] (cdr rectangle))
(defn get-point-width [rectangle]
    (Math/abs (- (x-point (get-top-left rectangle)) (x-point (get-bottom-right rectangle)))))
(defn get-point-height [rectangle]
    (Math/abs (- (y-point (get-top-left rectangle)) (y-point (get-bottom-right rectangle)))))

(defn perimeter [rectangle]
    (* 2 (+ (get-height rectangle) (get-width rectangle))))

(defn perimeter [rectangle height-getter width-getter]
    (* 2 (+ (height-getter rectangle) (width-getter rectangle))))

(defn square [rectangle height-getter width-getter]
    (* (height-getter rectangle) (width-getter rectangle)))

(println (perimeter (make-rectangle 2 4) get-height get-width))
(println (square (make-rectangle 2 4) get-height get-width))
(println (square (make-rectangle (make-point 2 4) (make-point 4 8)) get-point-height get-point-width))
(println (perimeter (make-rectangle (make-point 2 4) (make-point 4 8)) get-point-height get-point-width))
