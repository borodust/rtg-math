;;;; package.lisp

(defpackage #:%rtg-math
  (:use #:cl)
  (:export :case= :defun-typed :defun-typed-inline))

(defpackage #:rtg-math.types
  (:use #:cl :%rtg-math)
  (:export :quaternion
	   :mat3 :mat4
	   :vec2 :vec3 :vec4
	   :ivec2 :ivec3 :ivec4
	   :uvec2 :uvec3 :uvec4
	   :ivec2 :ivec3 :ivec4
	   :uvec2 :uvec3 :uvec4
	   :int8-vec2 :int8-vec3 :int8-vec4
	   :uint8-vec2 :uint8-vec3 :uint8-vec4))

(defpackage :rtg-math.base-maths
  (:use :cl :%rtg-math :rtg-math.types)
  (:export :clamp
           :clampf
           :+one-degree-in-radians+
           :+pi+
           :inv-sqrt
           :degrees
           :radians))

(defpackage :rtg-math.maths
  (:use :cl :%rtg-math :rtg-math.types)
  (:export :lerp :mix :stepv :clamp :smoothstep :pulse
           :spline))

(defpackage :rtg-math.base-vectors
  (:use :cl :%rtg-math :rtg-math.types)
  (:export :v! :v-x :v-y :v-z :v-w
           :v!byte :v!ubyte :v!int))

(defpackage :rtg-math.base-matrices
  (:use :cl :%rtg-math :rtg-math.types)
  (:export :m!))

(defpackage :rtg-math.vector2
  (:use :cl :%rtg-math :rtg-math.types)
  (:nicknames :v2)
  (:shadow :eql :+ :- :* :/ :length :zerop)
  (:export :make-vector2 :+ :- :* :eql
           :*vec :/ :/vec :negate :length-squared
           :length :distance-squared :distance :dot
           :absolute-dot :normalize :perp-dot
           :zerop :unitp :cross :face-foreward :lerp
           :bezier :spline :from-complex)
  (:import-from :rtg-math.base-maths
                :inv-sqrt)
  (:import-from :rtg-math.base-vectors :v-x :v-y))

(defpackage :rtg-math.vector3
  (:use :cl :%rtg-math :rtg-math.types)
  (:nicknames :v3)
  (:shadow :incf :eql :+ :- :* :/ :length :zerop)
  (:export :make-vector3 :eql :+ :- :* :/
           :*vec :/vec :negate :length-squared
           :length :distance-squared :distance :dot
           :absolute-dot :normalize :cross
           :zerop :unitp :cross :face-foreward :lerp
           :bezier :spline :incf)
  (:import-from :rtg-math.base-maths
                :inv-sqrt)
  (:import-from :rtg-math.base-vectors :v-x :v-y :v-z))

(defpackage :rtg-math.vector4
  (:use :cl :%rtg-math :rtg-math.types)
  (:nicknames :v4)
  (:shadow :eql :+ :- :* :/ :length :zerop)
  (:export :make-vector4 :+ :- :* :/ :v3* :eql
           :*vec :/vec :negate :length-squared
           :length :distance-squared :distance :dot
           :absolute-dot :normalize :cross
           :zerop :unitp :face-foreward :lerp
           :bezier :spline)
  (:import-from :rtg-math.base-maths
                :inv-sqrt)
  (:import-from :rtg-math.base-vectors :v-x :v-y :v-z :v-w))

(defpackage :rtg-math.vectors
  (:use :cl :%rtg-math :rtg-math.types)
  (:nicknames :v)
  (:import-from :rtg-math.base-maths :case=)
  (:export :v :make-vector :zerop :unitp := :+ :/= :1+ :1- :- :*
           :/ :length :length-squared :distance :distance-squared
           :dot :absolute-dot :perp-dot :normalize :cross :eql
           :swizzle :s~ :merge-into-vector :negate :face-foreward :lerp
           :mix :bezier :x :y :z :w :dvec :dvec*)
  (:shadow :zerop :+ :eql := :/= :1+ :1- :- :* :/ :length)
  (:import-from :rtg-math.vector2
                :make-vector2)
  (:import-from :rtg-math.vector3
                :make-vector3)
  (:import-from :rtg-math.vector4
                :make-vector4))

(defpackage :rtg-math.matrix3
  (:use :cl :%rtg-math :rtg-math.types)
  (:nicknames :m3)
  (:shadow :eql :identity)
  (:export :melm :identity :zero-matrix3
           :make :! :make-from-rows :get-rows
           :get-row :make-from-columns :get-columns
           :get-column :determinate :affine-inverse
           :mzerop :identityp :transpose :adjoint
           :mtrace :rotation-from-euler
           :rotation-from-axis-angle :scale
           :rotation-x :rotation-y :rotation-z
           :get-fixed-angles :get-axis-angle :m+ :m- :negate
           :m* :m*vec :mcol*vec3 :mrow*vec3 :m*scalar :eql)
  (:import-from :rtg-math.base-maths)
  (:import-from :rtg-math.vector3
                :make-vector3)
  (:import-from :rtg-math.base-vectors :v-x :v-y :v-z :v-w))

(defpackage :rtg-math.matrix4
  (:use :cl :%rtg-math :rtg-math.types)
  (:nicknames :m4)
  (:shadow :eql :identity)
  (:export :melm :identity :zero-matrix4
           :2dclipspace-to-imagespace-matrix4 :make :!
           :mzerop :identityp :minor :adjoint
           :determinant :affine-inverse :transpose
           :translation :rotation-from-matrix3
           :rotation-from-euler :rotation-from-axis-angle
           :scale :rotation-x :rotation-y
           :rotation-z :get-fixed-angles :mtrace
           :get-axis-angle :m+ :m- :negate :m*scalar
           :mcol*vec4 :mrow*vec4 :m* :transform
           :to-matrix3 :get-row :get-rows :get-column
           :get-columns :eql)
  (:import-from :rtg-math.base-maths)
  (:import-from :rtg-math.vector3
                :make-vector3)
  (:import-from :rtg-math.vector4
                :make-vector4)
  (:import-from :rtg-math.base-vectors :v-x :v-y :v-z :v-w))


(defpackage :rtg-math.matrices
  (:use :cl :%rtg-math :rtg-math.types)
  (:nicknames :m)
  (:import-from :rtg-math.base-maths :case=)
  (:export :zerop :unitp :+ :eql := :/= :1+ :1- :- :*
           :identityp :elt :elm :get-rows :get-row
           :get-columns :get-column :determinant
           :inverse :transpose :trace :negate
           :to-string)
  (:shadow :zerop :unitp :+ :eql := :/= :1+ :1- :- :*
           :elt :trace))

(defpackage :rtg-math.quaternions
  (:use :cl :%rtg-math :rtg-math.types :rtg-math.base-maths)
  (:nicknames :q)
  (:shadow :lerp)
  (:export :w :x :y :z :q! :zero-quit :zero-quatp
           :unit-quatp :identity-quat :identity-quatp
           :make-quat :make-quat-from-vec3
           :make-quat-from-rotation-matrix3
           :make-quat-from-axis-angle
           :make-quat-from-look-at
           :make-quat-from-axies
           :make-quat-from-fixed-angles
           :magnitude :norm :quat-eql :quat-!eql
           :copy :get-axis-angle :normalize :qconjugate
           :inverse :q+1 :q+ :q-1 :q- :q* :q*quat
           :dot :rotate :lerp :slerp :approx-slerp
           :to-matrix3 :to-matrix4))

(defpackage :rtg-math.projection
  (:use :cl :%rtg-math :rtg-math.types :rtg-math.base-maths)
  (:shadow :lerp)
  (:export :perspective :orthographic))

(defpackage #:rtg-math
  (:use #:cl))
