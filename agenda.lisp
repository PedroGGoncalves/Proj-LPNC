(setf nome (make-array '(100)))
(setf horasi (make-array '(100)))
(setf diasi (make-array '(100)))
(setf mesesi (make-array '(100)))
(setf anosi (make-array '(100)))
(setf horasf (make-array '(100)))
(setf diasf (make-array '(100)))
(setf mesesf (make-array '(100)))
(setf anosf (make-array '(100)))
(setq contador 0)

(defun data (hora dia mes ano)
(if (and (>= hora 0)(< hora 24)(> dia 0)(<= dia 30)(> mes 0)(<= mes 12))
1
0
)
)
(defun evento (nome horai diai mesi anoi &optional horaf diaf mesf anof);;o fim fica optativo
(if(= (data horai diai mesi anoi) 1)
(if(eql horaf nil) ;;omissao fim,assume se uma hora de evento
(if (= (data (+ horai 1) diai mesi anoi) 1)
(agenda nome horai diai mesi anoi (+ horai 1) diai mesi anoi)

)
(if (= (data horaf diaf mesf anof) 1)
(if (or(< anoi anof)(and(= anoi anof)(< mesi mesf))(and(= anoi anof)(= mesi mesf)(< diai diaf))(and(= anoi anof)(= mesi mesf)(= diai diaf)(< horai horaf)))
(agenda nome horai diai mesi anoi horaf diaf mesf anof))
;;(print "Data valida B") ;;agenda aki
)
;; se for valido, iria chamar agenda e armazenar (vetor?)
)
)
)
(defun imprimirData (cont)
(setq imprime -1)
(loop while (< imprime cont) 
  do (setq imprime (+ imprime 1))
(print (aref nome imprime))
(print (aref horasi imprime))
(print (aref diasi imprime))
(print (aref mesesi imprime))
(print (aref anosi imprime))
(print (aref horasf imprime))
(print (aref diasf imprime))
(print (aref mesesf imprime))
(print (aref anosf imprime))

)
)

(defun agenda (n h1 d1 m1 a1 h2 d2 m2 a2)
(setf (aref nome contador) n)
(setf (aref horasi contador) h1)
(setf (aref diasi contador) d1)
(setf (aref mesesi contador) m1)
(setf (aref anosi contador) a1)
(setf (aref horasf contador) h2)
(setf (aref diasf contador) d2)
(setf (aref mesesf contador) m2)
(setf (aref anosf contador) a2)

(print "Data valida B") 
(imprimirData contador)
(setq contador (+ contador 1))
)

(evento 'teste 1 1 1 1)
(evento 'testea 3 4 5 10 6 7 8 9) ;;anof menor
(evento 'testeb 3 4 5 6 6 7 8 9) ;; anof maior
(evento 'testec 3 4 5 9 6 7 8 9) ;;anof igual mesf maior

(evento 'tested 3 4 5 9 6 7 2 9) ;;anof igual mesf menor
(evento 'testee 3 4 8 9 6 7 8 9) ;;anof igual mesf igual diaf maior

(evento 'testef 3 3 8 9 6 3 8 9) ;;anof igual mesf igual diaf igual
(evento 'testeg 3 3 8 9 6 2 8 9);;anof igual mesf igual diaf menor horaf maior
(evento 'testeh 3 3 8 9 2 3 8 9);;anof igual mesf igual diaf menor horaf menor ou igual
