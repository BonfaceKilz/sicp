;; Exercise 2.76
;; Describing the changes that must be made to a system in order to add
;; new types or new operations.

;; 1. Generic operations with explicit dispatch:

;; Whenever new types of data objects are introduced, all new
;; operations have to be updated to support the new types by adding
;; more explicit dispatches. This is done by modifying the existing
;; the existing operations- which is not additive.

;; Whenever new operations are included, the new operations have to
;; include explicit dispatch for all types.

;; 2. Data-directed dispatch

;; Whenever new types of data objects are introduced, we have to write
;; packages to support the new types to be applicable to existing
;; operations. Think of this as adding a column to the 2D table in the
;; text. This is additive.

;; Whenever new operations are introduced, we have to update existing
;; packages. It's not additive but maintenable

;; 3. Message-passing style
;; Whenever new types of data objects are introduced, we have to write
;; data constructors for these types; It's additive.

;; Whenever new operations are introduced, we have to change the
;; existing data constructors to support the operations. It's not
;; additive
