(setf nome (make-array '(100)))
(setf horasInicial (make-array '(100)))
(setf diasInicial (make-array '(100)))
(setf mesesInicial (make-array '(100)))
(setf anosInicial (make-array '(100)))
(setf horasFinal (make-array '(100)))
(setf diasFinal (make-array '(100)))
(setf mesesFinal (make-array '(100)))
(setf anosFinal (make-array '(100)))
(setq contador 0)


(defun data (hora dia mes ano)
"Validação da data"
(if (and (>= hora 0)(< hora 24)(> dia 0)(<= dia 30)(> mes 0)(<= mes 12))
1
0
)
)
(defun evento (nome horasInicial diasInicial mesesInicial anosInicial &optional horasFinal diasFinal mesesFinal anosFinal);;o fim fica optativo
"Validação e inserção da data do evento"
(if(= (data horasInicial diasInicial mesesInicial anosInicial) 1)
(if(eql horasFinal nil) ;;omissao fim,assume se uma hora de evento

(if (= (data (+ horasInicial 1) diasInicial mesesInicial anosInicial) 1)
(agenda nome horasInicial diasInicial mesesInicial anosInicial (+ horasInicial 1) diasInicial mesesInicial anosInicial)

)
(if (= (data horasFinal diasFinal mesesFinal anosFinal) 1)
(if (or(< anosInicial anosFinal)(and(= anosInicial anosFinal)(< mesesInicial mesesFinal))(and(= anosInicial anosFinal)(= mesesInicial mesesFinal)(< diasInicial diasFinal))(and(= anosInicial anosFinal)(= mesesInicial mesesFinal)(= diasInicial diasFinal)(< horasInicial horasFinal)))
(agenda nome horasInicial diasInicial mesesInicial anosInicial horasFinal diasFinal mesesFinal anosFinal))

)

)
)
)

(defun imprimirDia (imprime)
(format t "~%Evento: ~s"(aref nome aux))
(format t "~%Dia: ~d/~d/~d"(aref diasInicial aux)(aref mesesInicial aux)(aref anosInicial aux))
(format t "~%Hora: ~d h" (aref horasInicial aux))
(format t "~%Dia: ~d/~d/~d"(aref diasFinal aux)(aref mesesFinal aux)(aref anosFinal aux))
(format t "~%Hora: ~d h" (aref horasFinal aux))
)


(defun agenda (n h1 d1 m1 a1 h2 d2 m2 a2)
"Evento inserido"
(setf (aref nome contador) n)
(setf (aref horasInicial contador) h1)
(setf (aref diasInicial contador) d1)
(setf (aref mesesInicial contador) m1)
(setf (aref anosInicial contador) a1)
(setf (aref horasFinal contador) h2)
(setf (aref diasFinal contador) d2)
(setf (aref mesesFinal contador) m2)
(setf (aref anosFinal contador) a2)

(print (aref nome contador))
(format t "Inserido")
(setq contador (+ contador 1))
)
(defun printa_dia (dia)
 (setq contador_cal 0)
   (loop repeat dia do
   (setq contador_cal (+ contador_cal 1))
   (format t " ~d" contador_cal)

)
)
(defun calendario (dia mes)
"Mostrar o calendário para uma data específica"
(cond
 ((and(<= dia 30)(>= dia 1))
 (cond
    ((= mes 1) (format t "~%Janeiro") (printa_dia dia))
    ((= mes 2) (format t "~%Fevereiro") (printa_dia dia))
    ((= mes 3) (format t "~%Março") (printa_dia dia))
    ((= mes 4) (format t "~%Abril") (printa_dia dia))
    ((= mes 5) (format t "~%Maio") (printa_dia dia))
    ((= mes 6) (format t "~%Junho") (printa_dia dia))
    ((= mes 7)(format t "~%Julho") (printa_dia dia))
    ((= mes 8) (format t "~%Agosto") (printa_dia dia))
    ((= mes 9) (format t "~%Setembro") (printa_dia dia))
    ((= mes 10) (format t "~%Outubro") (printa_dia dia))
    ((= mes 11) (format t "~%Novembro") (printa_dia dia))
    ((= mes 12) (format t "~%Dezembro") (printa_dia dia))
    (t (format t "~%Mes invalido"))
 )
 )
  (t (format t "~%Dia invalido"))
)
)

(defun consulta (dia mes ano)
"Consulta evento dia específico"
(setq aux 0)
(loop while (< aux contador)
do (loop while (and (< aux contador)(or(/= dia (aref diasInicial aux))(/= mes (aref mesesInicial aux))(/= ano (aref anosInicial aux))))
  do (setq aux (+ aux 1))
  
)

(cond
((= aux contador) (format t "~%Não encontrado"))
((< aux contador)(format t "~%Encontrado")(ImprimirDia aux))
)
(setq aux (+ aux 1))
)
)
;; Testes
(describe #'calendario )
(describe #'data )
(describe #'evento )
(describe #'agenda )

(calendario 30 6)
(evento 'teste 1 1 1 1)
(evento 'testea 3 4 5 10 6 7 8 9) ;;anof menor
(evento 'testeb 3 4 5 6 6 7 8 9) ;; anof maior
(evento 'testec 3 4 5 9 6 7 8 9) ;;anof igual mesf maior
(consulta 4 5 9)
(consulta 1 1 1)
(evento 'tested 3 4 5 9 6 7 2 9) ;;anof igual mesf menor
(evento 'testee 3 4 8 9 6 7 8 9) ;;anof igual mesf igual diaf maior

(evento 'testef 3 3 8 9 6 3 8 9) ;;anof igual mesf igual diaf igual
(evento 'testeg 3 3 8 9 6 2 8 9);;anof igual mesf igual diaf menor horaf maior
(evento 'testeh 3 3 8 9 2 3 8 9);;anof igual mesf igual diaf menor horaf menor ou igual
(evento 'testebb 1 4 5 6 6 7 8 9)
(evento 'testebbx 4 4 5 6 6 7 8 9)
(consulta 4 5 6)
