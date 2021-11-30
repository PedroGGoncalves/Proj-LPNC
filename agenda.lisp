(defun data (hora dia mes ano) ;;data -> ainda vamos melhorar
(if (and (>= hora 0)(< hora 24)(> dia 0)(<= dia 30)(> mes 0)(<= mes 12))
(print "Data valida") ;; mudar o print - será um retorno
(print "Nao valido") ;; será retorno tbm
)
)
(defun evento (horai diai mesi anoi &optional horaf diaf mesf anof);;o fim fica optativo
(data horai diai mesi anoi)
(if(eql horaf nil) ;;omissao fim,assume se uma hora de evento
(data (+ horai 1) diai mesi anoi)
(data horaf diaf mesf anof) ;; se nao houve omissao
)
)
