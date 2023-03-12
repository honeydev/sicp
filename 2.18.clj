(defn make-pair [x y]
    (fn [value-type]
        (cond (= value-type "numer") x
            (= value-type "denom") y
            :else (print "Unknown value type " value-type))))

(defn car [pair-value] (pair-value "numer"))
(defn cdr [pair-value] (pair-value "denom"))


(defn make-list [args-list] 
  (defn make-pairs [args-list pairs]
    (if (= 0 (count args-list))
            pairs
           (make-pairs (drop-last args-list) (make-pair (last args-list) pairs))))
  (make-pairs args-list nil))

(defn print-pair-list [pair-list]
  (print "[ ")
  (defn inner [pair-list]
    (defn print-and-next [pair-list]
      (print (car pair-list) ", ")
      (inner (cdr pair-list)))
      (if (= nil (cdr pair-list))
        (print (car pair-list) "]")
      (print-and-next pair-list)))
  (inner pair-list))


(defn reverse-list [pair-list]
  (defn inner [pair-list acc]
    (let [[element tail] [(car pair-list) (cdr pair-list)]]
       (if (nil? tail)
         (make-pair element acc)
         (inner tail (make-pair element acc)))))
  (inner pair-list nil))

 
(print-pair-list (reverse-list (make-list [1, 2, 3])))
