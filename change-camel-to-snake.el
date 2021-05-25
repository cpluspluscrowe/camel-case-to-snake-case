

(setq expected "path-unprocessed-ad-conversion-event")
(setq input "pathUnprocessedAdConversionEvent")

                                        ; need to replace capital with -lower for the string
                                        ; operate on each char and add to a building list

(defun camel-to-snake-mapper (letter) 
  "return letters as snake-case"
  (if (equal (upcase letter) letter) 
      (list 45 (downcase letter)) 
    (list letter)))

(defun char-list-to-string (char-list) 
  "Converts a nested list of chars to a string"
  (apply #'string (-flatten char-list)))

(defun apply-camel-to-snake-mapper (camel) 
  "map letters from camel case to snake case"
  (-map #'camel-to-snake-mapper camel))

(defun camel-to-snake-2 (camel) 
  "Attempt from a mapping method"
  (char-list-to-string (apply-camel-to-snake-mapper camel)))

(defun camel-to-snake-helper (camel building) 
  "Helper method, allows the main method to pass the default argument here"
                                        ; base case
  (if (eq (length camel) 0) building (let ((letter (car camel))) 
                                       (if (equal (upcase letter) letter) 
                                           (camel-to-snake-helper (cdr camel) 
                                                                  (append building (list 45
                                                                                         (downcase
                                                                                          letter))))
                                        ; continue
                                         (camel-to-snake-helper (cdr camel) 
                                                                (append building (list letter)))))))

(defun camel-to-snake (camel) 
  "Change the input camel case to snake case"
  (apply #'string (camel-to-snake-helper (string-to-list camel) 
                                         (list))))
