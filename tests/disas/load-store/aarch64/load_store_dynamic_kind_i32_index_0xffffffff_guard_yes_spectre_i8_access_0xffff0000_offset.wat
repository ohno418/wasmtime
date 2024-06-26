;;! target = "aarch64"
;;! test = "compile"
;;! flags = " -C cranelift-enable-heap-access-spectre-mitigation -O static-memory-maximum-size=0 -O static-memory-guard-size=4294967295 -O dynamic-memory-guard-size=4294967295"

;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;; !!! GENERATED BY 'make-load-store-tests.sh' DO NOT EDIT !!!
;; !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

(module
  (memory i32 1)

  (func (export "do_store") (param i32 i32)
    local.get 0
    local.get 1
    i32.store8 offset=0xffff0000)

  (func (export "do_load") (param i32) (result i32)
    local.get 0
    i32.load8_u offset=0xffff0000))

;; function u0:0:
;; block0:
;;   ldr x12, [x0, #88]
;;   ldr x15, [x0, #80]
;;   mov w13, w2
;;   movz x14, #0
;;   add x15, x15, x2, UXTW
;;   movz x0, #65535, LSL #16
;;   add x15, x15, x0
;;   subs xzr, x13, x12
;;   csel x13, x14, x15, hi
;;   csdb
;;   strb w3, [x13]
;;   b label1
;; block1:
;;   ret
;;
;; function u0:1:
;; block0:
;;   ldr x12, [x0, #88]
;;   ldr x15, [x0, #80]
;;   mov w13, w2
;;   movz x14, #0
;;   add x15, x15, x2, UXTW
;;   movz x0, #65535, LSL #16
;;   add x15, x15, x0
;;   subs xzr, x13, x12
;;   csel x13, x14, x15, hi
;;   csdb
;;   ldrb w0, [x13]
;;   b label1
;; block1:
;;   ret
