(de urlEncode (string)
    (pack
     (make
      (for C (chop string)
           (cond ((or (<= (char "0") (char C) (char "9"))
                      (<= (char "a") (char C) (char "z"))
                      (<= (char "A") (char C) (char "Z"))
                      (member C (chop "$-_.!*'(),")))
                  (link C))
                 ((= C " ") (link "+"))
                 (T (link "%") (link (hex (char C)))))))))
