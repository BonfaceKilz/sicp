; Exercise 2.71.
;
; Suppose we have a Huffman tree for an alphabet of n symbols,
; and that the relative frequencies of the symbols are 1, 2, 4, ..., 2^(n-1)
; Sketch the tree for n=5; for n=10. In such a tree (for general n) how many
; bits are required to encode the most frequent symbol? the least frequent
; symbol?
; ------------------------------------------------------------

;; sketch for n=5:
;;                     {a b c d e} 31
;;                     /           \
;;                {a b c d} 15      e 16
;;                 /     \
;;           {a b c} 7    d 8
;;             /    \
;;        {a b} 3    c 4
;;         /   \
;;      a 1    b 2
; For the biggest weight symbol, it will take always only 1,
; and for the smallest weight n-1 bits.
