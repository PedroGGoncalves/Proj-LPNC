(defun insere_eventos ()
(load “/home/user/agenda.lisp”)
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
(calendario 2021)
(evento 'testef 3 3 8 9 6 3 8 9) ;;anof igual mesf igual diaf igual
(evento 'testeg 3 3 8 9 6 2 8 9);;anof igual mesf igual diaf menor horaf maior
(evento 'testeh 3 3 8 9 2 3 8 9);;anof igual mesf igual diaf menor horaf menor ou igual
(evento 'testebb 1 4 5 6 6 7 8 9)
(evento 'testebbx 4 4 5 6 6 7 8 9)
(consulta 4 5 6)
(calendario 2021 1 6)

)
