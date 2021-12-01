(setf horasi (make-array '(100)))
(setf diasi (make-array '(100)))
(setf mesesi (make-array '(100)))
(setf anosi (make-array '(100)))
(setf horasf (make-array '(100)))
(setf diasf (make-array '(100)))
(setf mesesf (make-array '(100)))
(setf anosf (make-array '(100)))


(defun data (hora dia mes ano)
(if (and (>= hora 0)(< hora 24)(> dia 0)(<= dia 30)(> mes 0)(<= mes 12))
1
0
)
)
(defun evento (horai diai mesi anoi &optional horaf diaf mesf anof);;o fim fica optativo
(if(= (data horai diai mesi anoi) 1)
(if(eql horaf nil) ;;omissao fim,assume se uma hora de evento
(if (= (data (+ horai 1) diai mesi anoi) 1)
    (print "Data valida A") ;;agenda aki
    
    ;;(agenda horai diai mesi anoi horaf diaf mesf anof)
)
(if (= (data horaf diaf mesf anof) 1)
(agenda horai diai mesi anoi horaf diaf mesf anof)
;;(print "Data valida B") ;;agenda aki
)
;; se for valido, iria chamar agenda e armazenar (vetor?)
)
)
)
(defun agenda (h1 d1 m1 a1 h2 d2 m2 a2)
;;vetor lista/q ira conter esses dados
(print "Data valida B") 
)
